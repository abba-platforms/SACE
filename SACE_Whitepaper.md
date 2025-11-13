# Synthetic African Currency Exchange (SACE) — Whitepaper

**Ticker:** SACE  
**Creator:** [Simon Kapenda](https://linkedin.com/in/simonkapenda)   
**Version:** 1.2  
**Date:** October 6, 2025 (Revised: October 28, 2025)  

---

## 1. Executive Summary

The **Synthetic African Currency Exchange (SACE)** represents a groundbreaking blockchain-native financial innovation designed to unify and track the collective strength of Africa’s top-performing national currencies. Modeled on the principles of the **U.S. Dollar Index (DXY)**, **S&P 500**, **Dow Jones Industrial Averages (DJIA)**, and **NASDAQ 100**, SACE serves as a synthetic benchmark that reflects and tracks Africa’s macroeconomic performance within a transparent, tradable, and algorithmically balanced digital asset.

Developed by **Simon Kapenda**, Founder of **Abba Platforms Inc.**, and creator of **CillarCoin (CILLAR)** and **Namibia Digital Dollar (NADD)** (Namibia’s first blockchain-native stablecoin), SACE establishes a digital bridge between Africa’s diverse currency landscape and the global market economy.

By aggregating a **weighted basket of 21 African currencies**, SACE introduces a new paradigm for cross-border trade efficiency, investment exposure, and currency stability — making it the **first synthetic currency index for Africa**.

Upon the debut of SACE’s Initial Exchange Offering (IEO), SACE is projected to enter the global digital economy with a **valuation exceeding $2.3 trillion USD**, positioning **Abba Platforms Inc.** among the world’s most valuable technology and fintech companies. Each of its **42 founding staff and management members** is projected to hold a net worth exceeding **$230 million USD**, making them among the wealthiest individuals across Africa and the United States.

### Basic Project Information
**Token Name:** Synthetic African Currency Exchange (SACE)  
**Symbol:** SACE  
**Network:** BEP-20 (BNB Smart Chain)  
**SACE Proxy (Main):** `0x3Bb737BFaCfA48e912014686D051D6f39c747802`  
**SACE Implementation (Verified):** `0xAA1b92910370853E0E97E63670ef7B0d072cBF3a`  
**SACE Oracle Proxy:** `0x6Ee1ec18C3629B4Dea00703286DcA3BEEE49F122`  
**GitHub Repo:** [https://github.com/abba-platforms/SACE](https://github.com/abba-platforms/SACE)  

---

## 2. Abstract

The **Synthetic African Currency Exchange (SACE)** is a blockchain-native BEP-20 token engineered to represent a **weighted basket of Africa’s top-performing currencies**. By creating a synthetic currency index for Africa, SACE delivers a unified benchmark for tracking the continent’s currency strength. Inspired by the proven model of the **U.S. Dollar Index (DXY)**, **S&P 500**, **Dow Jones Industrial Averages (DJIA)**, and **NASDAQ 100**, SACE offers a transparent, tradable instrument that reflects Africa’s collective economic performance, facilitates cross-border trade, and provides **traders and investors** a powerful tool for exposure and hedging within the **African forex landscape**.

SACE is a development brand of **Abba Payments Ltd.**, a wholly-owned subsidiary of **Abba Platforms Inc.**, created by **Simon Kapenda**, the creator of **CillarCoin (CILLAR)** — a utility token — and **Namibia Digital Dollar (NADD)**, Namibia's first blockchain-native stablecoin pegged 1:1 to the Namibian Dollar. Simon Kapenda holds a Bachelor of Science degree in Economics from **The Ohio State University in Columbus, Ohio, USA**, where he graduated in 2008 alongside **JD Vance, Vice President of the United States**.

SACE will serve as:
- **A tradable synthetic index** paired against USD or other basket currencies.
- **A transparent liquidity instrument** for African currencies.
- **A governance-driven financial infrastructure** to track Africa’s overall economic strength, performance, and movement.

---

## 3. Project Vision

Africa is home to **54 countries with over 40 active currencies**, each with unique macroeconomic drivers. SACE aggregates Africa's **top 21 performing national currencies**, creating a stable and transparent synthetic index to:
- Increase intra-African trade efficiency.
- Provide a unified reference point for African forex.
- Empower financial products and derivatives.
- Enable investors to hedge or gain exposure to African currency movements.

---

## 4. SACE Currency Basket

As of **September 25, 2025**, SACE’s initial basket includes:

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

## 5. Tokenomics

- **Token Name:** Smart African Currency Exchange  
- **Ticker:** SACE  
- **Total Supply:** 100,000,000,000 SACE  
- **Decimals:** 18  
- **Token Type:** BEP-20 Upgradeable  
- **Initial Mint:** All tokens minted to Treasury Wallet upon deployment.  

### Treasury Wallet
A single wallet address provided at deployment will hold the entire supply. The treasury manages distribution, liquidity, and governance.

---

## 6. Technical Design

SACE uses **OpenZeppelin’s Upgradeable BEP-20 implementation**, UUPS upgrade pattern, and integrates **Chainlink Oracles** for real-time currency rate feeds.

### Key Features:
1. **Currency Basket Management** — Dynamic add/remove currency logic.  
2. **Weighted Index Calculation** — Based on currency weights and rates.  
3. **Deviation Protection** — Ensures feed prices do not deviate beyond a configurable threshold.  
4. **Oracle Heartbeat** — Ensures price feeds are current.  
5. **Upgradeable Contract** — Governance controlled updates.  
6. **Transparent Events** — Logs all changes and updates.  

---

## 7. Oracle Integration

SACE integrates **Chainlink price feeds** for all currencies.

Key features:
- **Heartbeat Check:** Rejects stale feeds older than configurable time (default: 1 hour).  
- **Deviation Check:** Rejects sudden feed deviations beyond **5%** by default.  
- **Last Valid Price Storage:** Maintains resilience against faulty or malicious feeds.  
- **Feed Validation:** Ensures valid feed addresses before updates.  

---

## 8. Governance

SACE is **governance-controlled** via an ownership model with recommendations for:
- **Timelock mechanisms** for sensitive operations.  
- **Multi-sig wallets** for treasury and upgrade control.  
- **Basket rebalancing governance** to adjust weights and currencies.  
- **Deviation parameter control** for Oracle protection.  

---

## 9. Economic Impact

SACE creates a unified currency index for Africa with significant incentives:
- **Market Efficiency:** Single tradable instrument for African forex exposure.  
- **Hedging:** Enables investors and institutions to hedge against African currency volatility.  
- **Liquidity:** Increases cross-border liquidity for African currencies.  
- **Transparency:** Provides clear tracking of African currency movements.  

---

## 10. SACE Basket Value

### Overview

The **Synthetic African Currency Exchange (SACE)** represents a **weighted basket of Africa’s top 21 performing currencies**, capturing Africa’s collective monetary strength within a single blockchain-based index token.

As of **October 2025**, the combined estimated value of this 21-currency basket is approximately **$2.3 trillion USD**.

Based on this aggregate valuation and the **maximum supply of 100 billion SACE tokens**, the **market-derived indicative value** of one SACE is estimated at **around $23 USD**.

This value is **not a fixed or imposed price**, but rather a **proportional reflection** of the overall strength and capitalization of Africa’s top currencies relative to the U.S. Dollar (USD).

It provides a transparent benchmark for traders and investors — allowing SACE to naturally price itself in open markets according to currency performance and market demand.

---

### Market Cap and Index Valuation

- **Basket Combined Value:** $2.3 trillion USD  
- **Max Supply:** 100,000,000,000 SACE  
- **Starting Price per Token:** $23 USD  

This gives an approximate **market capitalization** at launch of:

>100,000,000,000 SACE × $23 = $2,300,000,000,000 USD

This aligns SACE’s total market cap proportionally with the estimated value of the African currency basket it represents.

---

### Proportional Movements Relative to USD

SACE’s price is designed to reflect the performance of the African currency basket.  
This means price movement relative to USD will follow changes in the basket’s value:

- **If the basket strengthens** relative to USD → SACE price increases.  
- **If USD strengthens** relative to the basket → SACE price decreases.  

Example:  
If African currencies collectively appreciate by 5% vs USD, SACE’s price could rise from $23 → **$24.15**.

This creates a **naturally hedged asset** against USD volatility.

---

### Long-Term Performance Simulation

Looking at historical growth patterns of indexes like NASDAQ 100 and S&P 500, Africa’s currency basket could similarly grow over time.

| Year | Low Growth (5%) | Moderate Growth (10%) | High Growth (15%) |
|------|-------------------|------------------------|---------------------|
| 0    | $23.00           | $23.00                 | $23.00             |
| 1    | $24.15           | $25.30                 | $26.45             |
| 2    | $25.36           | $27.83                 | $30.42             |
| 3    | $26.63           | $30.61                 | $35.00             |
| 4    | $27.96           | $33.67                 | $40.25             |
| 5    | $29.36           | $37.04                 | $46.29             |
| 6    | $30.83           | $40.74                 | $53.23             |
| 7    | $32.37           | $44.81                 | $61.21             |
| 8    | $34.00           | $49.29                 | $70.39             |
| 9    | $35.70           | $54.22                 | $80.95             |
| 10   | $37.49           | $59.64                 | $93.10             |

**Interpretation:**  
- **Low growth (5%)** → $37.49 after 10 years (+63%).  
- **Moderate growth (10%)** → $59.64 after 10 years (+159%).  
- **High growth (15%)** → $93.10 after 10 years (+305%).  

These scenarios suggest SACE could follow a sustained upward trajectory akin to major global indexes, driven by Africa’s economic growth and adoption of SACE.

---

### Strategic Insight

SACE is designed as a **dynamic index** and a **transparent tradable instrument** that tracks Africa’s collective currency strength.  
Its price movement will be proportional to the basket’s performance versus USD, offering a natural hedge and exposure to Africa’s currency markets.

#### Key Points:
- Starting price of $23 per SACE is **proportional to the USD value of the basket**.  
- With 100B max supply, the total market cap is aligned with the basket’s estimated $2.3 trillion value.  
- Price will fluctuate with the basket’s performance, offering a **hedging mechanism**.  
- Long-term growth potential mirrors indexes like NASDAQ 100 and S&P 500, driven by African economic growth and adoption.

---

### Reference Currencies in SACE Basket (As of October 2025)

1. Tunisian Dinar (TND)  
2. Libyan Dinar (LYD)  
3. Moroccan Dirham (MAD)  
4. Ghanaian Cedi (GHS)  
5. Botswana Pula (BWP)  
6. Seychelles Rupee (SCR)  
7. Eritrean Nakfa (ERN)  
8. Namibian Dollar (NAD)  
9. Swazi Lilangeni (SZL)  
10. South African Rand (ZAR)  
11. Lesotho Loti (LSL)  
12. São Tomé and Príncipe Dobra (STN)  
13. Zambian Kwacha (ZMW)  
14. Mauritanian Ouguiya (MRU)  
15. Egyptian Pound (EGP)  
16. Algerian Dinar (DZD)  
17. Mauritian Rupee (MUR)  
18. West African CFA Franc (XOF)  
19. Central African CFA Franc (XAF)  
20. Kenyan Shilling (KES)  
21. Rwandan Franc (RWF)  

---

## 11. Conclusion

SACE is positioned to redefine African forex by introducing a **single tradable synthetic currency** representing Africa’s collective currency strength. It provides a powerful tool for traders, investors, and governments alike to measure, hedge, and trade African currencies in a standardized way.

With its **$2.3 trillion valuation**, robust technical framework, and visionary governance model, SACE stands as one of Africa’s most ambitious blockchain-based financial innovations — bridging Africa’s economies to global capital markets through transparency, technology, and trust.

---

**Author:** [Simon Kapenda](https://linkedin.com/in/simonkapenda)  
**Founder & Creator of SACE**  
**Abba Platforms Inc.**  
**GitHub Repository:** [https://github.com/abba-platforms/SACE](https://github.com/abba-platforms/SACE)
