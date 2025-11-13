# SACE Price Feed Contract Architecture & Flow

## Overview
This document details the architecture and flow of the SACE Oracle system, which is used to benchmark the SACE token against DXY and other currencies. The system uses a UUPS upgradeable proxy pattern, Chainlink feeds, and hybrid price feeds for Tier 2 currencies. 

## Components

1. **SACE Token Proxy**
   - Address: `0x3Bb737BFaCfA48e912014686D051D6f39c747802`
   - Type: Transparent proxy for the SACE token
   - Function: Public-facing token contract; forwards calls to SACE Implementation

2. **SACE Implementation**
   - Address: `0xAA1b92910370853E0E97E63670ef7B0d072cBF3a`
   - Function: Contains all token logic
   - Verified on BSCScan: [Link](https://bscscan.com/address/0xAA1b92910370853E0E97E63670ef7B0d072cBF3a#code)

3. **SACE Oracle Proxy**
   - Address: `0x6Ee1ec18C3629B4Dea00703286DcA3BEEE49F122`
   - Type: UUPS Proxy
   - Function: Points to SACE Implementation for price feed logic
   - Note: Previously pointed to old implementation `0x0671F26539A1aCA85530c67bc9bC4706cbF1A87c`

4. **SACEOracleRegistry.sol**
   - Provides price feeds for Tier 1 and Tier 2 currencies
   - Uses Chainlink feeds for DXY and ZAR
   - Supports hybrid prices for other currencies
   - Upgradeable via UUPS proxy pattern

## Currency Feeds

### Tier 1
- ZAR (Chainlink feed)
- DXY (Chainlink feed)
- NADD (Hybrid feed)

### Tier 2
- TND, LYD, MAD, GHS, BWP, SCR, ERN, NAD, SZL, LSL, STN, ZMW, MRU, EGP, DZD, MUR, XOF, XAF, KES, RWF
- All use Hybrid price feeds initially set to 0

### DXY Currencies
- EUR, JPY, GBP, CAD, SEK, CHF

## Events
- `FeedSetChainlink(bytes32 currencyKey, address feedAddress)`
- `FeedSetHybrid(bytes32 currencyKey, uint256 price)`
- `HybridPriceUpdated(bytes32 currencyKey, uint256 price, uint256 timestamp)`
- `BatchHybridPriceUpdated(bytes32[] currencyKeys, uint256[] prices, uint256 timestamp)`
- `NADDPriceUpdated(uint256 price, uint256 timestamp)`

## Upgradeability
- Proxy: UUPS pattern
- `_authorizeUpgrade(address)` restricted to `onlyOwner`
- Supports future initializers (`initializeV2`) without breaking existing storage

---

## Contract Storage & Architecture

```
+---------------------+
|   SACE Token Proxy   |
|  (UUPS Proxy)       |
+---------+-----------+
          |
          v
+---------------------+
|  SACE Implementation |
|  (Token Logic)       |
+---------------------+
          ^
          |
+---------------------+
| SACE Oracle Proxy    |
|  (UUPS Proxy)        |
+---------+-----------+
          |
          v
+---------------------+
| SACEOracleRegistry   |
| - Feeds (CHAINLINK,  |
|   HYBRID)           |
| - Feed Weights      |
| - Currency Mappings |
+---------------------+
```
---

## Flow Description

1. **Deployment & Proxy Setup**
   - `SACEOracleRegistry.sol` deployed as an upgradeable UUPS contract.
   - Proxy points directly to SACE Implementation (`0xAA1b92910370853E0E97E63670ef7B0d072cBF3a`).

2. **Price Feed Initialization**
   - Tier 1: ZAR → Chainlink feed
   - Tier 2: 20 other African currencies → Hybrid feed (manual updates)
   - DXY → Chainlink feed
   - NADD → Hybrid feed

3. **Hybrid Price Update**
   - Admin can update tier 2 currency prices manually.
   - Events emitted:
     - `HybridPriceUpdated`
     - `BatchHybridPriceUpdated`
     - `NADDPriceUpdated`

4. **SACE Benchmarking**
   - SACE token price is calculated relative to DXY.
   - All operations (trading, valuation, reporting) reference the DXY benchmark instead of USD.

5. **Upgradeable Logic**
   - UUPS proxy enables future upgrades without changing proxy addresses.
   - `_authorizeUpgrade` ensures only owner can upgrade logic contract.

---

## Key Advantages

- **DXY Benchmarking**: Allows SACE to be measured against a global currency index.
- **Hybrid Feeds**: Combines Chainlink and manual updates for maximum coverage.
- **Upgradeable Architecture**: Enables future-proof contract upgrades.
- **Investor-Friendly Transparency**: Events and public mappings allow tracking of all price feed changes.

---

## Deployment Summary

| Component                  | Address                                                        | Notes                                                   |
|----------------------------|----------------------------------------------------------------|---------------------------------------------------------|
| SACE Token Proxy           | 0x3Bb737BFaCfA48e912014686D051D6f39c747802                     | Public-facing token proxy                                |
| SACE Implementation        | 0xAA1b92910370853E0E97E63670ef7B0d072cBF3a                     | Holds all token logic                                    |
| SACE Oracle Proxy          | 0x6Ee1ec18C3629B4Dea00703286DcA3BEEE49F122                     | Points to SACE Implementation                            |
| Old Oracle Implementation  | 0x0671F26539A1aCA85530c67bc9bC4706cbF1A87c                     | Deprecated                                              |

---

### Data Flow
1. User interacts with SACE Proxy.
2. Proxy forwards calls to SACE Implementation (SACEOracleRegistry.sol).
3. Contract fetches live prices:
   - Tier 1 via Chainlink
   - Tier 2 via hybrid/manual pricing
4. Emits events for frontend or ecosystem integration.
5. Supports future upgrades via UUPS proxy without changing the proxy address.

## Why Benchmark SACE to DXY Instead of USD

### Context
- USD represents a single currency
- DXY (US Dollar Index) represents a basket of major global currencies: EUR, JPY, GBP, CAD, SEK, CHF
- Benchmarking SACE to DXY provides **a more balanced and globalized reference** instead of being tied to USD

### Benefits
1. **Reduced Single-Currency Risk**
   - SACE value is less sensitive to fluctuations in USD alone
   - Provides stability in regions where USD volatility is high

2. **Global Relevance**
   - DXY reflects multiple major economies
   - SACE pricing interpretable in global macroeconomic context

3. **Investor-Friendly**
   - Shows SACE is designed for international adoption
   - Encourages institutional adoption, less concentration risk

4. **Better Hedging**
   - Projects or users exposed to multiple currencies can hedge SACE more effectively

### Implementation in SACEOracleRegistry.sol
- Tier 1: ZAR and DXY set up with Chainlink feeds
- Tier 2: Regional currencies are hybrid-priced
- Hybrid feeds allow manual adjustments if Chainlink unavailable
- NADD is a special hybrid feed for internal ecosystem

### Flow (DXY Integration)

```
+---------------------------+
|     SACE Oracle Proxy     |
|        (UUPS Proxy)       |
+------------+--------------+
             |
             v
+---------------------------+
|    SACEOracleRegistry     |
|   (Implements DXY & other |
|      currency feeds)      |
+------------+--------------+
             |
             v
+---------------------------+
|    Tier 1: Chainlink Feeds|
|           ZAR, DXY        |
+---------------------------+
             |
+---------------------------+
|    Tier 2: Hybrid Feeds   |
|  TND, LYD, MAD, ...       |
+---------------------------+
             |
+---------------------------+
|        NADD (Hybrid)      |
+---------------------------+
```
---

### Conclusion
The SACE Price Feed System now fully supports DXY benchmarking with a hybrid price feed architecture. All proxies are correctly pointing to the current SACE Implementation, and the upgradeable design ensures seamless future upgrades.
- Benchmarking SACE to DXY ensures **global stability, investor confidence, and adoption readiness**
- Architecture supports future upgrades without breaking existing proxy
- SACE positioned as a **globally aware, resilient token**, adaptable to currency fluctuations and macroeconomic trends

### Contract Architect By: Simon Kapenda, SACE Creator
