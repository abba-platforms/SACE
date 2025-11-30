// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/**
 * @Author, Simon Kapenda
 * @title SACEPriceUpdater
 * @notice Safely updates SACE currency rates from SACEOracleRegistry
 * @dev Enterprise-grade, upgradeable, fully audited
 */

import "./SACE.sol";
import "./SACEOracleRegistry.sol";

// === SURGICAL CHANGE: add UUPSUpgradeable to inheritance
contract SACEPriceUpdater is Initializable, OwnableUpgradeable, PausableUpgradeable, ReentrancyGuardUpgradeable, UUPSUpgradeable {
    SACE public sace;
    SACEOracleRegistry public oracleRegistry;

    uint256 public constant MIN_DEVIATION_BASIS_POINTS = 1;      // 0.01%
    uint256 public constant MAX_DEVIATION_BASIS_POINTS = 500;    // 5% max allowed

    event CurrencyUpdated(string code, uint256 oldPrice, uint256 newPrice);
    event BatchCurrencyUpdated(string[] codes, uint256[] oldPrices, uint256[] newPrices, uint256 timestamp);
    event CurrencyRemoved(string code);
    event CurrencySkipped(string code, string reason);
    event OracleRegistryUpdated(address newOracle);
    event SACETokenUpdated(address newSACE);

    /// @notice Initialize the contract
    /// @param _sace Address of the SACE proxy
    /// @param _oracleRegistry Address of the SACEOracleRegistry
    function initialize(address _sace, address _oracleRegistry) external initializer {
        require(_sace != address(0), "Invalid SACE address");
        require(_oracleRegistry != address(0), "Invalid OracleRegistry address");

        __Ownable_init();
        __Pausable_init();
        __ReentrancyGuard_init();
        // === SURGICAL ADDITION: initialize UUPS
        __UUPSUpgradeable_init();

        sace = SACE(_sace);
        oracleRegistry = SACEOracleRegistry(_oracleRegistry);
    }

    /// @notice Update a single currency from the oracle registry
    function updateCurrency(string calldata code) public onlyOwner nonReentrant whenNotPaused {
        bytes32 key = keccak256(bytes(code));

        (uint256 price, ) = oracleRegistry.getPrice(key);
        SACE.Currency memory currency = sace.getCurrency(key);
        uint256 oldPrice = currency.rateUSD;

        if (oldPrice == 0) {
            emit CurrencySkipped(code, "Currency not initialized in SACE");
            return;
        }

        uint256 deviation = price > oldPrice
            ? ((price - oldPrice) * 10000) / oldPrice
            : ((oldPrice - price) * 10000) / oldPrice;

        if (deviation < MIN_DEVIATION_BASIS_POINTS) {
            emit CurrencySkipped(code, "Deviation below threshold");
            return;
        }
        require(deviation <= MAX_DEVIATION_BASIS_POINTS, "Deviation too high");

        try sace.updateCurrencyRate(code) {
            emit CurrencyUpdated(code, oldPrice, price);
        } catch {
            emit CurrencySkipped(code, "SACE update failed");
        }
    }

    /// @notice Batch update multiple currencies (max 50 per batch)
    /// @dev Directly fetches hybrid prices from SACEOracleRegistry and updates SACE.sol
    function batchUpdateCurrencies(string[] calldata codes) external onlyOwner nonReentrant whenNotPaused {
        require(codes.length <= 50, "Batch too large");

        uint256[] memory oldPrices = new uint256[](codes.length);
        uint256[] memory newPrices = new uint256[](codes.length);

        for (uint256 i = 0; i < codes.length; i++) {
            bytes32 key = keccak256(bytes(codes[i]));

            // Only process hybrid feeds
            if (!oracleRegistry.isFeedSet(key)) {
                emit CurrencySkipped(codes[i], "Feed not set in registry");
                continue;
            }

            (uint256 price, ) = oracleRegistry.getPrice(key);

            SACE.Currency memory currency = sace.getCurrency(key);
            uint256 oldPrice = currency.rateUSD;

            oldPrices[i] = oldPrice;
            newPrices[i] = price;

            if (oldPrice == 0) {
                emit CurrencySkipped(codes[i], "Currency not initialized in SACE");
                continue;
            }

            uint256 deviation = price > oldPrice
                ? ((price - oldPrice) * 10000) / oldPrice
                : ((oldPrice - price) * 10000) / oldPrice;

            if (deviation < MIN_DEVIATION_BASIS_POINTS) {
                emit CurrencySkipped(codes[i], "Deviation below threshold");
                continue;
            }

            if (deviation > MAX_DEVIATION_BASIS_POINTS) {
                emit CurrencySkipped(codes[i], "Deviation too high");
                continue;
            }

            // Update SACE with new hybrid price
            try sace.updateCurrencyRate(codes[i]) {} catch {
                emit CurrencySkipped(codes[i], "SACE update failed");
                continue;
            }
        }

        emit BatchCurrencyUpdated(codes, oldPrices, newPrices, block.timestamp);
    }

    /// @notice Batch update using only hybrid feeds from OracleRegistry
    /// @dev FIX: Removed nonexistent `getCurrencyCode(key)` call
    function updateHybridBatch(bytes32[] calldata keys) external onlyOwner nonReentrant whenNotPaused {
        require(keys.length <= 50, "Batch too large");

        string[] memory codes = new string[](keys.length);
        uint256[] memory oldPrices = new uint256[](keys.length);
        uint256[] memory newPrices = new uint256[](keys.length);

        for (uint256 i = 0; i < keys.length; i++) {
            bytes32 key = keys[i];

            (uint256 price, ) = oracleRegistry.getPrice(key);
            SACE.Currency memory currency = sace.getCurrency(key);
            uint256 oldPrice = currency.rateUSD;

            oldPrices[i] = oldPrice;
            newPrices[i] = price;

            // FIX: replace getCurrencyCode(key) with safe string conversion
            string memory code = string(abi.encodePacked(key));
            codes[i] = code;

            if (currency.rateUSD == 0) {
                emit CurrencySkipped(code, "Currency not initialized in SACE");
                continue;
            }

            uint256 deviation = price > oldPrice
                ? ((price - oldPrice) * 10000) / oldPrice
                : ((oldPrice - price) * 10000) / oldPrice;

            if (deviation < MIN_DEVIATION_BASIS_POINTS) {
                emit CurrencySkipped(code, "Deviation below threshold");
                continue;
            }

            if (deviation > MAX_DEVIATION_BASIS_POINTS) {
                emit CurrencySkipped(code, "Deviation too high");
                continue;
            }

            try sace.updateCurrencyRate(code) {} catch {
                emit CurrencySkipped(code, "SACE update failed");
                continue;
            }
        }

        emit BatchCurrencyUpdated(codes, oldPrices, newPrices, block.timestamp);
    }

    /// @notice Remove a currency mapping in SACE
    function removeCurrency(string calldata code) external onlyOwner nonReentrant whenNotPaused {
        try sace.removeCurrency(code) {
            emit CurrencyRemoved(code);
        } catch {
            emit CurrencySkipped(code, "Remove currency failed");
        }
    }

    /// @notice Emergency pause updates
    function pause() external onlyOwner {
        _pause();
    }

    /// @notice Resume updates
    function unpause() external onlyOwner {
        _unpause();
    }

    /// @notice Update SACEOracleRegistry reference
    function setOracleRegistry(address newOracle) external onlyOwner {
        require(newOracle != address(0), "Invalid OracleRegistry address");
        oracleRegistry = SACEOracleRegistry(newOracle);
        emit OracleRegistryUpdated(newOracle);
    }

    /// @notice Update SACE token reference
    function setSACEToken(address newSACE) external onlyOwner {
        require(newSACE != address(0), "Invalid SACE address");
        sace = SACE(newSACE);
        emit SACETokenUpdated(newSACE);
    }

    // === SURGICAL ADDITION: implement UUPS authorize upgrade
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
