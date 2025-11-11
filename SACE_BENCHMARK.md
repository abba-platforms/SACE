# SACE Benchmarking Against DXY

## Overview

Synthetic African Currency Exchange (SACE) is benchmarked against the **U.S. Dollar Index (DXY)** rather than a single U.S. Dollar (USD). This pairing anchors SACE’s value to the real-world strength of the U.S. Dollar relative to a basket of six major global currencies — EUR, JPY, GBP, CAD, SEK, and CHF. By doing so, SACE provides a transparent and macroeconomically grounded on-chain benchmark for Africa's top 21 performing national currencies.

SACE is designed as an **on-chain, upgradeable UUPS token**, integrating price feeds from trusted oracles to ensure alignment with global market movements, transparency, and stability.

---

## SACE/DXY Pairing

SACE’s initial price is **$23 USD** per token, while DXY is expressed as an index value (e.g., ~99). The pairing is calculated as follows:

>SACE/DXY ratio = SACE Price in USD ÷ DXY Index Value


**Example:**

- SACE Price: $23 USD  
- DXY Value: 99  

>SACE/DXY ratio = 23 ÷ 99 ≈ 0.2323

This means 1 SACE ≈ 0.2323 DXY units in index-adjusted terms.

---

## Dynamic Movements

SACE’s relative performance against DXY will change according to:

1. **DXY fluctuations**  
   - If DXY rises (USD strengthens globally), the SACE/DXY ratio decreases.  
   - If DXY falls (USD weakens), the SACE/DXY ratio increases.

2. **SACE valuation changes**  
   - If SACE appreciates due to Africa’s macroeconomic strength or market activity, the SACE/DXY ratio rises.  
   - If SACE depreciates, the ratio declines.

**Illustrative Table:**

| Scenario          | DXY Value | SACE Price | SACE/DXY Ratio | Interpretation                          |
|------------------|-----------|------------|----------------|----------------------------------------|
| Base Case         | 99        | $23        | 0.2323         | Benchmark level                         |
| DXY Rises         | 110       | $23        | 0.209          | USD strengthens, SACE relatively weaker |
| DXY Falls         | 90        | $23        | 0.255          | USD weakens, SACE relatively stronger  |
| SACE Appreciates  | 99        | $28        | 0.282          | SACE outperforms USD basket             |

---

## Practical Implications

- **Global Comparability:** SACE/DXY allows investors, fund managers, and analysts to measure Africa’s aggregated currency performance relative to USD strength globally.  
- **Macroeconomic Benchmarking:** By reflecting the collective economic strength of Africa’s top 21 performing national currencies, SACE offers a data-driven and credible digital asset benchmark.  
- **Transparency & Stability:** On-chain oracle feeds combined with upgradeable UUPS architecture ensure SACE remains aligned with global market movements and macroeconomic conditions.

---

## Conclusion

SACE’s pairing with DXY provides a **robust and transparent benchmark** for tracking the relative strength of African currencies versus global monetary standards. It allows on-chain investors to understand both absolute and relative value, establishing SACE as the first synthetic African currency index with global macroeconomic relevance.

For further details on SACE tokenomics, allocation, and technical design, see the [SACE Tokenomics](https://github.com/abba-platforms/SACE/blob/main/SACE_TOKENOMICS_IEO_FRAMEWORK.md).
