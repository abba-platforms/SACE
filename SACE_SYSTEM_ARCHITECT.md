# SACE SYSTEM ARCHITECT

SACE Index is Africa’s first blockchain-native weighted currency index, designed to track the top 21 performing national currencies across Africa, benchmarked against the U.S. Dollar Index (DXY). The system provides transparent, real-time price data through a hybrid on-chain oracle architecture powered by SACEOracleRegistry and SACEPriceUpdater, with upgradeability supported by a secure proxy pattern.

---

## Core Architecture

### 1. SACE.sol (Main Index Contract – via Proxy)

The SACE Proxy is the primary live contract that users and integrations interact with.  
It forwards calls to the underlying SACE Implementation contract while preserving upgradeability.

- Proxy Address (Main): 0x9F6d0EDc0eB6BBa34F06CeC4fbA7f91bb4600F73  
- Implementation (Verified): 0xf84D3BA755a5c8FBffb2776948F61676552f39bB  
- Proxy Admin: 0x91E7895f312370b98d3Fc754A085Fcb73d195cDb

The SACE Index stores values for each tracked currency and enforces deviation thresholds for updates.

---

## Oracle Components

### 2. SACEOracleRegistry.sol

- Address: 0x96DCdC8C5A5C2B2Fdb5CB1C882234311b2dc797d  
- Responsible for storing and managing price feeds from:
  - Chainlink oracles
  - Hybrid feed sources
  - Custom data providers

The registry serves as the canonical source of truth for raw asset and FX data.

### 3. SACEPriceUpdater.sol

- Address: 0x8C4A89223af9Ce160927D6Fcbd85e10084eAB7Bc  
- Responsible for:
  - Reading prices from SACEOracleRegistry
  - Applying deviation checks
  - Batch updating the SACE Proxy with new rates
  - Ensuring only authorized updaters modify index values

This contract guarantees data freshness and consistency for all 21 currencies.

---

## Security & Governance

**Multisig Control (Gnosis Safe)**

All critical operations—proxy upgrades, updater authorization, and oracle management—are executed via:

- SAFE Multisig: 0x49fb37A417191F98e4852A92EEAC208716deE036  
- Owner/Executor Address: 0x17BE831cFACD6ABbccF30BAa610de5acD4E113f4

This ensures no single actor can alter system behavior.

---

## What the SACE Index Tracks

SACE maintains a weighted basket of 21 African national currencies, benchmarking each against:

- USD Index (DXY)  
- Chainlink FX feeds  
- Hybrid sources for markets without direct on-chain coverage  

**Result:**  
A real-time, transparent, and tamper-resistant currency index for Africa’s economic landscape.

---

## Why SACE Matters

- First blockchain-native African currency index  
- Enables FX transparency for digital finance, DeFi, settlement systems, and CBDCs  
- Bridges off-chain FX markets with on-chain digital asset systems  
- Built for institutions, fintech ecosystems, and smart-contract financial infrastructure

---

## Production Deployment Summary

The following integrations are complete and active:

- SACE Proxy deployed and functional  
- SACE Implementation verified  
- OracleRegistry linked to SACE Proxy  
- PriceUpdater authorized and operational  

The full oracle → updater → proxy pipeline is now live.  
This enables reliable updating of all 21 currency pairs on-chain.

---

## System Flow Diagram

```
┌─────────────────────┐
│  SACEOracleRegistry │
│  (0x96DC…797d)      │
│                     │
│ Aggregates:         │
│ - Chainlink feeds   │
│ - Hybrid feeds      │
│ - Custom data       │
└─────────┬─────────-─┘
          │
          │ Price Data
          ▼
┌─────────────────────┐
│  SACEPriceUpdater   │
│  (0x8C4A…7Bc)       │
│                     │
│ Reads from Registry │
│ Checks deviations   │
│ Batch updates Proxy │
└─────────┬─────────-─┘
          │
          │ Calls / Updates
          ▼
┌─────────────────────┐
│      SACE Proxy     │
│  (0x9F6d0E…F73)     │
│                     │
│ Upgradeable entry   │
│ Delegates calls to  │
│ Implementation      │
└─────────┬────────-──┘
          │
          │ Forwarded Calls
          ▼
┌─────────────────────┐
│  SACE Implementation│
│  (0xf84D…39bB)      │
│                     │
│ Stores index values │
│ Enforces deviations │
│ Provides live data  │
└─────────────────────┘
```

---

## Links

- Website: https://casex.io  
- Repository: https://github.com/abba-platforms/SACE

---

## Creator    

[Simon Kapenda](https://linkedin.com/in/simonkapenda)
