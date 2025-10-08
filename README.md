<!-- Project Badges -->
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Token Type](https://img.shields.io/badge/Token-BEP--20-blue.svg)
![Status](https://img.shields.io/badge/Status-Active-success.svg)
![Build](https://img.shields.io/badge/Build-Upgradeable%20UUPS-orange.svg)
![Creator](https://img.shields.io/badge/Creator-Simon%20Kapenda-lightgrey.svg)

# Synthetic African Currency Exchange (SACE)

**Ticker:** SACE  
**Token Type:** BEP-20 Upgradeable  
**Total Supply:** 100,000,000,000 SACE  
**Creator:** Simon Kapenda  
**Version:** 1.0  
**Date:** October 6, 2025  

---

## Summary 

The **Synthetic African Currency Exchange (SACE)** is a BEP-20 token representing a **weighted basket of Africa’s top 21 performing currencies**. Inspired by benchmarks such as the **U.S. Dollar Index (DXY)**, SACE offers a unified, tradable instrument for tracking and trading Africa’s collective currency strength.  

SACE consolidates Africa’s top 21 currencies into a single tradable instrument, creating a transparent benchmark for the continent’s currency performance. It enhances market efficiency, improves liquidity, enables effective hedging against currency volatility, and facilitates cross-border trade — positioning SACE as a foundational economic tool for Africa’s growing financial ecosystem.  

SACE is a development brand of **Abba Platforms Inc.**, created by **Simon Kapenda**, the creator of **CillarCoin (CILLAR)** — a utility token — and **NADD**, Namibia's first blockchain-native stablecoin pegged 1:1 to the Namibian Dollar.

---

## Purpose

SACE is designed to:  
- Create a **synthetic index** representing Africa’s currency performance.  
- Enable **cross-border trade and exposure** to African forex.  
- Serve as a **transparent benchmark** for African currency movements.  
- Provide traders and investors with a **single tradable instrument**.  

---

## Currency Basket

As of October 2025, the SACE Currency Basket Index includes the following Africa's top performing currencies:  

| #  | Currency                                      |
|----|-----------------------------------------------|
| 1  | Tunisian Dinar (TND)                         |
| 2  | Libyan Dinar (LYD)                           |
| 3  | Moroccan Dirham (MAD)                        |
| 4  | Ghanaian Cedi (GHS)                          |
| 5  | Botswana Pula (BWP)                          |
| 6  | Seychelles Rupee (SCR)                       |
| 7  | Eritrean Nakfa (ERN)                         |
| 8  | Namibian Dollar (NAD)                        |
| 9  | Swazi Lilangeni (SZL)                        |
| 10 | South African Rand (ZAR)                     |
| 11 | Lesotho Loti (LSL)                           |
| 12 | São Tomé and Príncipe Dobra (STN)            |
| 13 | Zambian Kwacha (ZMW)                         |
| 14 | Mauritanian Ouguiya (MRU)                    |
| 15 | Egyptian Pound (EGP)                         |
| 16 | Algerian Dinar (DZD)                         |
| 17 | Mauritian Rupee (MUR)                        |
| 18 | West African CFA Franc (XOF)                 |
| 19 | Central African CFA Franc (XAF)              |
| 20 | Kenyan Shilling (KES)                        |
| 21 | Rwandan Franc (RWF)                          |

---

## 📊 SACE Basket Value Summary

As the Synthetic African Currency Exchange (**SACE**) represents a weighted basket of Africa’s top 21 performing currencies, the combined estimated value of this basket is approximately **$2.3 trillion USD**, as of October 2025.

With a max supply of **100 billion SACE tokens**, the starting market price is approximately **$23 USD per SACE** — determined by market conditions to reflect the proportional value of the underlying currency basket.

For a full in-depth analysis, valuation breakdown, and long-term growth projections, see the dedicated document:  
📄 [SACE_BASKET_VALUE.md](./SACE_BASKET_VALUE.md)

---

## Technical Overview

SACE uses **OpenZeppelin’s Upgradeable BEP-20 implementation** with the UUPS upgrade pattern and integrates **Chainlink Oracles** for real-time currency rate feeds.  

Key features:  
- **Currency Basket Management** — dynamic add/remove currency logic.  
- **Weighted Index Calculation** — based on currency weights and rates.  
- **Deviation Protection** — rejects outlier price feeds.  
- **Oracle Heartbeat** — ensures feeds are up-to-date.  
- **Upgradeable Contract** — governance controlled updates.  
- **Transparent Events** — logs all updates and changes.  

---

## Economic Analysis

The **Synthetic African Currency Exchange (SACE)** creates a unique economic instrument that aggregates the strength of Africa’s top currencies into a single tradable token. By doing so, SACE addresses key economic challenges:  

- **Market Efficiency:** Simplifies exposure to African currencies, reducing the complexity of multi-currency forex trading.  
- **Liquidity Creation:** Consolidates liquidity for African currencies, making them more accessible to global investors.  
- **Hedging Tool:** Provides a standardized way for investors, businesses, and governments to hedge against currency volatility.  
- **Transparency:** Offers a clear benchmark for Africa’s collective currency performance, promoting informed economic decisions.  
- **Trade Facilitation:** Supports cross-border trade by reducing currency conversion friction and providing a stable reference currency.  

In effect, SACE functions as Africa’s **currency performance index**, much like the DXY for the U.S. dollar, and has the potential to become a core instrument in the continent’s financial ecosystem.  

---

## 📚 Documentation

This repository contains all key documentation and resources for the **Synthetic African Currency Exchange (SACE)** project.

| File | Description |
|------|-------------|
| `contracts/SACE.sol.md` | Full documented source code for the SACE smart contract, including upgradeable BEP-20 implementation and Chainlink oracle integration. |
| `SACE_Audit_Report.md` | Deep OpenZeppelin-style audit of SACE.sol, including security checks, deviation logic validation, and recommended fixes. |
| `SACE_Analysis.md` | Comprehensive economic and strategic analysis of the SACE project, including market implications and forecasts. |
| `SACE_Whitepaper.md` | Full whitepaper outlining the vision, technical design, tokenomics, governance, and economic impact of SACE. |
| `SACE_BASKET_VALUE.md` | Detailed analysis of SACE basket value, pricing rationale, growth simulation, and full currency list. |
| `CHANGELOG.md` | Record of changes, improvements, and version history for the SACE project. |
| `README.md` | Project overview, technical setup instructions, and reference to core documentation. |

---

## Getting Started

### Prerequisites
- [Node.js](https://nodejs.org/) v18+
- [Hardhat](https://hardhat.org/)  
- [Yarn](https://yarnpkg.com/) or npm  
- [MetaMask](https://metamask.io/) or similar wallet  
- Binance Smart Chain (BSC) testnet/mainnet access  

### Installation
```bash
git clone https://github.com/yourusername/SACE.git
cd SACE
yarn install
```

### Compile Contract
```bash
npx hardhat compile
```

### Deploy Contract (Testnet Example)
```bash
npx hardhat run scripts/deploy.js --network bsctestnet
```

### Run Tests
```bash
npx hardhat test
```

---

## Whitepaper

For the full technical and economic details, see the [SACE Whitepaper](./SACE_Whitepaper.md).  

---

## License

This repository is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.  
