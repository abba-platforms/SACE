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

pragma solidity ^0.8.19;

// Chainlink interface
import "./interfaces/AggregatorV3Interface.sol";

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

    // ================================
    // ORIGINAL STORAGE (do NOT change)
    // ================================
    address public treasuryWallet;       // deprecated
    uint256 public totalWeight;          // deprecated
    uint256 public currentIndexValue;    // deprecated

    struct Currency {
        string code;
        uint256 weight;
        uint256 rateUSD;
        bool active;
        address feed;          // RESTORED to original type
        uint256 lastUpdated;
    }

    mapping(string => Currency) public basket;         // deprecated
    mapping(string => uint256) public lastValidPrice;  // deprecated
    string[] public currencyCodes;                     // deprecated

    // OZ upgradeable gaps (match exactly original size)
    uint256[353] private __gap;

    // ================================
    // NEW STORAGE (added at the end)
    // ================================
    mapping(bytes32 => Feed) public feeds;
    uint256[] public feedWeights;

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

    // --- DXY currencies ---
    bytes32 public constant EUR = keccak256("EUR");
    bytes32 public constant JPY = keccak256("JPY");
    bytes32 public constant GBP = keccak256("GBP");
    bytes32 public constant CAD = keccak256("CAD");
    bytes32 public constant SEK = keccak256("SEK");
    bytes32 public constant CHF = keccak256("CHF");

    bytes32 public constant DXY = keccak256("DXY");
    bytes32 public constant NADD = keccak256("NADD");

    // ================================
    // Events
    // ================================
    event FeedSetChainlink(bytes32 indexed currencyKey, address feedAddress);
    event FeedSetHybrid(bytes32 indexed currencyKey, uint256 price);
    event HybridPriceUpdated(bytes32 indexed currencyKey, uint256 price, uint256 timestamp);
    event BatchHybridPriceUpdated(bytes32[] currencyKeys, uint256[] prices, uint256 timestamp);
    event NADDPriceUpdated(uint256 price, uint256 timestamp);

    // ================================
    // Initializer
    // ================================
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

        feeds[DXY] = Feed({ feedType: FeedType.CHAINLINK, chainlinkAddress: address(0), hybridPrice: 0, lastUpdated: block.timestamp });
        emit FeedSetChainlink(DXY, address(0));

        feeds[NADD] = Feed({ feedType: FeedType.HYBRID, chainlinkAddress: address(0), hybridPrice: 0, lastUpdated: block.timestamp });
        emit FeedSetHybrid(NADD, 0);
    }

    /// @custom:oz-upgrades-validate-as-initializer
    function initializeV2() external reinitializer(2) {
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function _authorizeUpgrade(address) internal override onlyOwner {}

    // Internal helpers and getters remain unchanged...
}
