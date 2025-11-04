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

### 🚀 Mainnet Deployment

The **Synthetic African Currency Exchange (SACE)** smart contract has been successfully deployed to the **BNB Smart Chain (Mainnet)**.  
SACE represents a **weighted basket of Africa’s top 21 performing national currencies** — with a combined valuation exceeding **$2.3 trillion USD** — tokenized into a single, tradable BEP-20 digital asset—**SACE**.

**Deployment Details:**
- **Network:** BNB Smart Chain (Mainnet) — Main     
- **Proxy Verified Contract Address:** `0x3Bb737BFaCfA48e912014686D051D6f39c747802`  
- **Implementation Verified Contract Address:** `0x7E1633443a50866847C92A580FbD9c531107061b`
- **SACE Oracle Registry:** `0x03233fb8cf478Fb6c3BB284bC82f1df3CA39d480`
- **Standard:** BEP-20 (Upgradeable Proxy via OpenZeppelin)    

SACE provides a unified benchmark for Africa’s collective currency strength, enabling efficient trading, hedging, and cross-border commerce.  

---

## Executive Summary 

The **Synthetic African Currency Exchange (SACE)** is a BEP-20 token representing a **weighted basket of Africa’s top 21 performing national currencies**, collectively valued at more than **$2.3 trillion USD**. Inspired by benchmarks such as the **Dow Jones Industrial Average (DJIA)**, **S&P 500**, **NASDAQ 100**, and the **U.S. Dollar Index (DXY)**, SACE offers a unified, tradable instrument for tracking and trading Africa’s collective currency strength.  

SACE consolidates Africa’s top 21 currencies into a single tradable instrument, creating a transparent benchmark for the continent’s currency performance. It enhances market efficiency, improves liquidity, enables effective hedging against currency volatility, and facilitates cross-border trade — positioning SACE as a foundational economic tool for Africa’s growing financial ecosystem.  

SACE is a development brand of **Abba Platforms Inc.**, created by **Simon Kapenda**, the creator of **CillarCoin (CILLAR)** — a utility token — and **Namibia Digital Dollar (NADD)**, Namibia's first blockchain-native stablecoin pegged 1:1 to the Namibian Dollar. Together, **SACE**, **CILLAR**, and **NADD** form the foundation of Abba Platforms’ digital asset ecosystem — advancing Africa’s financial inclusion, liquidity, and cross-border economic integration through blockchain innovation.

---

## 📄 Whitepaper Summary

The **Synthetic African Currency Exchange (SACE)** Whitepaper provides a complete overview of SACE as a **BEP-20 blockchain token representing a weighted basket of Africa’s top 21 performing currencies**, with a combined valuation exceeding **$2.3 trillion USD**.  

Key highlights include:  
- **Valuation Model:** Starting indicative value of ~$23 per SACE token based on the African currency basket.  
- **Tokenomics:** Max supply of 100 billion SACE tokens, treasury-controlled distribution, and governance mechanisms.  
- **Technical Overview:** Upgradeable UUPS proxy, Chainlink oracle integration, deviation protection, and transparent events.  
- **Economic Impact:** Facilitates cross-border trade, improves liquidity, provides hedging against currency volatility, and serves as a benchmark for Africa’s macroeconomic performance.  
- **Governance:** Multi-sig treasury, timelocks, and basket rebalancing mechanisms for secure, community-driven upgrades.  
- **Strategic Insight:** Tracks Africa’s currency performance similarly to DJIA, S&P 500, and NASDAQ 100 for the U.S. market.  

For the **full Whitepaper**, visit: [SACE_Whitepaper.md](./SACE_Whitepaper.md)

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

## 🧩 SACE Smart Contract Overview

The Synthetic African Currency Exchange (**SACE**) is deployed on **BNB Smart Chain (Mainnet)** and operates through a verifiable, upgradeable contract architecture designed for transparency, real-time data accuracy, and investor trust.

**Core Contracts:**
- **SACE Proxy (Main Contract):** `0x3Bb737BFaCfA48e912014686D051D6f39c747802`  
- **SACE Implementation:** `0x7E1633443a50866847C92A580FbD9c531107061b`  
- **SACE Oracle Registry:** `0x03233fb8cf478Fb6c3BB284bC82f1df3CA39d480`

SACE uses a **hybrid oracle system** combining **Chainlink’s on-chain data feeds** (for major currencies like ZAR) and **SACE’s Hybrid Feeds** (for other African currencies). The Hybrid Feeds aggregate real-time market data from sources such as **OANDA, XE, and Investing.com**, which are validated and published on-chain every hour. This ensures accurate, transparent, and verifiable price updates — all visible on **BscScan**.

The upgradeable UUPS Proxy model allows the SACE protocol to evolve without changing its main contract address, ensuring both stability for users and flexibility for future innovation. Every feed update, logic change, and timestamp is **recorded immutably on-chain**, allowing investors and traders to independently verify that SACE operates with full transparency.

📄 **Full technical explanation and interaction diagram:**  
See [SACE_CONTRACTS_SUMMARY.md](./SACE_CONTRACTS_SUMMARY.md)

---

## 📊 SACE Basket Value Summary

As the Synthetic African Currency Exchange (**SACE**) representing a weighted basket of Africa’s top 21 performing currencies, the combined estimated value of this basket is approximately **$2.3 trillion USD**, as of October 2025.

With a max supply of **100 billion SACE tokens**, the starting market price is approximately **$23 USD per SACE** — determined by market conditions to reflect the proportional value of the underlying currency basket.

For a full in-depth analysis, valuation breakdown, and long-term growth projections, see the dedicated document:  
📄 [SACE_BASKET_VALUE.md](./SACE_BASKET_VALUE.md)

---

## SACE Tokenomics & IEO

The **Synthetic African Currency Exchange (SACE)** is a BEP-20 token representing a weighted basket of Africa’s top 21 currencies, collectively valued at **$2.3 trillion USD**. SACE offers a unified, tradable benchmark for Africa’s currency strength, enhances market efficiency, and facilitates cross-border trade.  

- **Max Supply:** 100 Billion SACE 
- **IEO Allocation:** 2.5 Billion SACE    
- **Token Price:** $23 per SACE  

For full details on **tokenomics, IEO framework, distribution, utility, and governance**, see the [SACE TOKENOMICS & IEO FRAMEWORK](./SACE_TOKENOMICS_IEO_FRAMEWORK.md) document.

---

## 🧾 Independent Financial Review  
An independent analytical report, modeled after McKinsey & Company and PwC standards, provides an in-depth financial and strategic evaluation of the Synthetic African Currency Exchange (SACE). The review explains the foundation of SACE’s $2.3 trillion USD FDV, linking it to Africa’s aggregated GDP and its role as the world’s first pan-African synthetic currency exchange.  
See full report: [SACE_PROJECT_INDEPENDENT_REVIEW.md](./SACE_PROJECT_INDEPENDENT_REVIEW.md)

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
