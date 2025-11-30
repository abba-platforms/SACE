// SPDX-License-Identifier: MIT
//
// NOTICE:
// This repository contains a redacted version of the SACE smart contracts.
// Certain internal logic, imports, and implementation details have been
// intentionally removed to protect proprietary mechanisms of the SACE system.
//
// The deployed contracts on-chain are complete and fully functional,
// and their bytecode has been verified. This public version provides
// transparency for the overall architecture, interfaces, and workflow,
// while safeguarding critical intellectual property.
//
// If you require full access for audit or integration purposes,
// please contact the SACE development team directly.

pragma solidity ^0.8.21;

/**
 * @title SACE Index
 * @author Simon Kapenda
 * @notice BEP-20 Upgradeable token representing a weighted basket of Africa's top 21 currencies
 * @dev Version 2.2 — Production-grade improvements for gas, oracle safety, and upgrade security
 */
import "./interfaces/AggregatorV3Interface.sol";

contract SACE is 
    Initializable,
    ERC20Upgradeable,
    ERC20PermitUpgradeable,
    ERC20BurnableUpgradeable,
    UUPSUpgradeable,
    OwnableUpgradeable,
    ReentrancyGuardUpgradeable,
    PausableUpgradeable
{
    uint256 public constant MAX_SUPPLY = 100_000_000_000 * 10 ** 18;

    address public treasuryWallet;
    uint256 public totalWeight;
    uint256 public currentIndexValue;

    // --- Custom name storage for upgradeable token ---
    string private _customName;

    uint256 public constant HEARTBEAT = 3600; // 1 hour
    uint256 public constant MAX_DEVIATION_BASIS_POINTS = 500; // 5% deviation allowed

    struct Currency {
        bytes32 code;
        uint256 weight; // Weight in basis points (max total = 10000)
        uint256 rateUSD;
        bool active;
        address feed;
        uint256 lastUpdated;
    }

    mapping(bytes32 => Currency) public basket;
    mapping(bytes32 => uint256) public lastValidPrice;
    mapping(bytes32 => bool) private exists;
    bytes32[] public currencyCodes;

    event TreasuryWalletUpdated(address indexed oldWallet, address indexed newWallet);
    event CurrencyUpdated(bytes32 code, uint256 rateUSD, uint256 weight, bool active, address feed, uint256 timestamp);
    event CurrencyRemoved(bytes32 code);
    event IndexRecomputed(uint256 newIndexValue);
    event PriceDeviationRejected(bytes32 code, uint256 attemptedPrice, uint256 lastValidPrice, uint256 deviationBasisPoints);
    event BasketWeightsNormalized(uint256 totalWeight);
    event TokenNameUpdated(string oldName, string newName);

    /**
     * @notice Initialize the SACE contract
     * @param _treasuryWallet Wallet that will hold the initial supply
     */
    function initialize(address _treasuryWallet) public initializer {
        lastValidPrice[code] = normalizedPrice;
        return normalizedPrice;
    }

    /**
     * @notice Add or update currency in basket
     */
    function upsertCurrency(
        string memory _code,
        uint256 weight,
        bool active,
        address feed
    ) external onlyOwner nonReentrant whenNotPaused {
        require(bytes(_code).length > 0, "Invalid code");
        require(weight > 0 && weight <= 10000, "Invalid weight");

        bytes32 code = keccak256(bytes(_code));

        if (!exists[code]) {
            currencyCodes.push(code);
            exists[code] = true;
        }

        uint256 rateUSD = feed != address(0) ? getLatestPrice(feed, code) : 0;

        basket[code] = Currency({
            code: code,
            weight: weight,
            rateUSD: rateUSD,
            active: active,
            feed: feed,
            lastUpdated: block.timestamp
        });

        emit CurrencyUpdated(code, rateUSD, weight, active, feed, block.timestamp);
        recomputeIndex();
    }

    /**
     * @notice Remove a currency from basket
     */
    function removeCurrency(string memory _code) external onlyOwner nonReentrant whenNotPaused {
        bytes32 code = keccak256(bytes(_code));
        require(exists[code], "Currency does not exist");

        delete basket[code];
        exists[code] = false;

        for (uint256 i = 0; i < currencyCodes.length; i++) {
            if (currencyCodes[i] == code) {
                currencyCodes[i] = currencyCodes[currencyCodes.length - 1];
                currencyCodes.pop();
                break;
            }
        }

        emit CurrencyRemoved(code);
        recomputeIndex();
    }

    /**
     * @notice Update rate for a currency
     */
    function updateCurrencyRate(string memory _code) public onlyOwner nonReentrant whenNotPaused {
        bytes32 code = keccak256(bytes(_code));
        Currency storage currency = basket[code];
        require(currency.active, "Currency not active");
        require(currency.feed != address(0), "Feed not set");

        currency.rateUSD = getLatestPrice(currency.feed, code);
        currency.lastUpdated = block.timestamp;

        emit CurrencyUpdated(code, currency.rateUSD, currency.weight, currency.active, currency.feed, block.timestamp);
        recomputeIndex();
    }

    /**
     * @notice Batch update rates (chunked)
     */
    function batchUpdateCurrencyRatesChunk(uint256 start, uint256 end) external onlyOwner nonReentrant whenNotPaused {
        require(end <= currencyCodes.length, "Out of bounds");
        for (uint256 i = start; i < end; i++) {
            bytes32 code = currencyCodes[i];
            updateCurrencyRate(string(abi.encodePacked(code))); // convert back to string for updateCurrencyRate
        }
    }

    /**
     * @notice Recompute the synthetic index value
     */
    function recomputeIndex() public whenNotPaused {
        uint256 sumWeightedRates = 0;
        uint256 sumWeights = 0;

        for (uint256 i = 0; i < currencyCodes.length; i++) {
            Currency memory c = basket[currencyCodes[i]];
            if (c.active && c.rateUSD > 0) {
                sumWeightedRates += c.rateUSD * c.weight;
                sumWeights += c.weight;
            }
        }

        if (sumWeights > 0) {
            currentIndexValue = sumWeightedRates / sumWeights;
            totalWeight = sumWeights;
            emit IndexRecomputed(currentIndexValue);
            emit BasketWeightsNormalized(sumWeights);
        }
    }

    // --- Admin Functions ---

    function updateTreasuryWallet(address _newTreasuryWallet) external onlyOwner nonReentrant {
        require(_newTreasuryWallet != address(0), "Invalid address");
        address oldWallet = treasuryWallet;
        treasuryWallet = _newTreasuryWallet;
        emit TreasuryWalletUpdated(oldWallet, _newTreasuryWallet);
    }

    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    function updateTokenName(string memory newName) external onlyOwner {
        string memory oldName = _customName;
        _customName = newName;
        emit TokenNameUpdated(oldName, newName);
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    // --- View Functions ---

    function name() public view override returns (string memory) {
        return _customName;
    }

    function getCurrencyCount() external view returns (uint256) {
        return currencyCodes.length;
    }

    function getCurrency(bytes32 code) external view returns (Currency memory) {
        return basket[code];
    }

    uint256[50] private __gap;
}
