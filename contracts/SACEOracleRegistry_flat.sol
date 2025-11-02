// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SACE Oracle Registry Initializable
 * @dev Base contract to aid in writing upgradeable contracts.
 */
abstract contract Initializable {
    bool private _initialized;
    bool private _initializing;

    modifier initializer() {
        require(_initializing || !_initialized, "Initializable: already initialized");
        bool isTopLevelCall = !_initializing;
        if (isTopLevelCall) _initializing = true;
        _;
        if (isTopLevelCall) {
            _initialized = true;
            _initializing = false;
        }
    }
}

/**
 * @title ContextUpgradeable
 */
abstract contract ContextUpgradeable is Initializable {
    function __Context_init() internal initializer {}
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

/**
 * @title OwnableUpgradeable
 */
abstract contract OwnableUpgradeable is Initializable, ContextUpgradeable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function __Ownable_init() internal initializer {
        __Context_init();
        _transferOwnership(_msgSender());
    }

    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is zero");
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

/**
 * @title IERC1822ProxiableUpgradeable
 */
interface IERC1822ProxiableUpgradeable {
    function proxiableUUID() external view returns (bytes32);
}

/**
 * @title ERC1967UpgradeUpgradeable
 */
abstract contract ERC1967UpgradeUpgradeable is Initializable {
    function __ERC1967Upgrade_init() internal initializer {}
}

/**
 * @title UUPSUpgradeable
 */
abstract contract UUPSUpgradeable is Initializable, ERC1967UpgradeUpgradeable {
    address private immutable __self = address(this);

    function __UUPSUpgradeable_init() internal initializer {
        __ERC1967Upgrade_init();
    }

    function _authorizeUpgrade(address) internal virtual;
}

/**
 * @title AggregatorV3Interface
 */
interface AggregatorV3Interface {
    function decimals() external view returns (uint8);
    function latestRoundData() external view returns (
        uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound
    );
}

/**
 * @title SACEOracleRegistry
 */
contract SACEOracleRegistry is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint8 public constant DECIMALS = 8;
    uint256 public constant STALE_PRICE_THRESHOLD = 3600; // 1 hour

    enum FeedType { NONE, CHAINLINK, HYBRID }

    struct Feed {
        FeedType feedType;
        address chainlinkAddress;
        uint256 hybridPrice; // scaled to DECIMALS
        uint256 lastUpdated;
    }

    mapping(bytes32 => Feed) public feeds;

    // --- Tier 1 currency ---
    bytes32 public constant ZAR = keccak256("ZAR");

    // --- Tier 2 currencies ---
    bytes32 public constant TND = keccak256("TND");
    bytes32 public constant LYD = keccak256("LYD");
    bytes32 public constant MAD = keccak256("MAD");
    bytes32 public constant GHS = keccak256("GHS");
    bytes32 public constant BWP = keccak256("BWP");
    bytes32 public constant SCR = keccak256("SCR");
    bytes32 public constant ERN = keccak256("ERN");
    bytes32 public constant NAD = keccak256("NAD");
    bytes32 public constant SZL = keccak256("SZL");
    bytes32 public constant LSL = keccak256("LSL");
    bytes32 public constant STN = keccak256("STN");
    bytes32 public constant ZMW = keccak256("ZMW");
    bytes32 public constant MRU = keccak256("MRU");
    bytes32 public constant EGP = keccak256("EGP");
    bytes32 public constant DZD = keccak256("DZD");
    bytes32 public constant MUR = keccak256("MUR");
    bytes32 public constant XOF = keccak256("XOF");
    bytes32 public constant XAF = keccak256("XAF");
    bytes32 public constant KES = keccak256("KES");
    bytes32 public constant RWF = keccak256("RWF");

    event FeedSetChainlink(bytes32 indexed currencyKey, address feedAddress);
    event FeedSetHybrid(bytes32 indexed currencyKey, uint256 price);
    event HybridPriceUpdated(bytes32 indexed currencyKey, uint256 price, uint256 timestamp);
    event BatchHybridPriceUpdated(bytes32[] currencyKeys, uint256[] prices, uint256 timestamp);

    function initialize() external initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();

        feeds[ZAR] = Feed({
            feedType: FeedType.CHAINLINK,
            chainlinkAddress: 0xDE1952A1bF53f8E558cc761ad2564884E55B2c6F,
            hybridPrice: 0,
            lastUpdated: block.timestamp
        });
        emit FeedSetChainlink(ZAR, 0xDE1952A1bF53f8E558cc761ad2564884E55B2c6F);

        bytes32[20] memory tier2Keys = [
            TND, LYD, MAD, GHS, BWP, SCR, ERN, NAD, SZL, LSL,
            STN, ZMW, MRU, EGP, DZD, MUR, XOF, XAF, KES, RWF
        ];

        for (uint i = 0; i < tier2Keys.length; i++) {
            feeds[tier2Keys[i]] = Feed({
                feedType: FeedType.HYBRID,
                chainlinkAddress: address(0),
                hybridPrice: 0,
                lastUpdated: block.timestamp
            });
            emit FeedSetHybrid(tier2Keys[i], 0);
        }
    }

    function _authorizeUpgrade(address) internal override onlyOwner {}

    function _updateHybridPrice(bytes32 currencyKey, uint256 price) internal {
        require(price > 0 && price < 1e12, "Price out of bounds");
        Feed storage f = feeds[currencyKey];
        require(f.feedType == FeedType.HYBRID, "Not a hybrid feed");
        f.hybridPrice = price;
        f.lastUpdated = block.timestamp;
        emit HybridPriceUpdated(currencyKey, price, block.timestamp);
    }

    function updateHybridPrice(bytes32 currencyKey, uint256 price) external onlyOwner {
        _updateHybridPrice(currencyKey, price);
    }

    function batchUpdateHybridPrices(bytes32[] calldata currencyKeys, uint256[] calldata prices) external onlyOwner {
        require(currencyKeys.length == prices.length, "Array length mismatch");
        for (uint i = 0; i < currencyKeys.length; i++) {
            _updateHybridPrice(currencyKeys[i], prices[i]);
        }
        emit BatchHybridPriceUpdated(currencyKeys, prices, block.timestamp);
    }

    function getPrice(bytes32 currencyKey) external view returns (uint256 price, uint8 decimalsOut) {
        Feed memory f = feeds[currencyKey];
        require(f.feedType != FeedType.NONE, "Feed not set");

        if (f.feedType == FeedType.CHAINLINK) {
            AggregatorV3Interface aggregator = AggregatorV3Interface(f.chainlinkAddress);
            try aggregator.latestRoundData() returns (
                uint80, int256 answer, uint256, uint256 updatedAt, uint80
            ) {
                require(answer > 0, "Invalid Chainlink price");
                require(block.timestamp - updatedAt <= STALE_PRICE_THRESHOLD, "Chainlink price stale");
                return (uint256(answer), aggregator.decimals());
            } catch {
                revert("Chainlink call failed");
            }
        } else {
            require(f.hybridPrice > 0, "Hybrid price not set");
            return (f.hybridPrice, DECIMALS);
        }
    }
}
