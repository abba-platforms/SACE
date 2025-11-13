# CHANGELOG

All notable changes to Synthetic Africa Currency Exchange (SACE) are documented in this file.  
This includes releases, upgrades, and important updates to the tokenomics and related frameworks.

**Project:** Synthetic Africa Currency Exchange (SACE)  
**Author:** Simon Kapenda  
**Organization:** Abba Platforms Inc.  
**License:** MIT  
**Start Date:** October 6, 2025

---

## [v1.2.0] - 2025-11-13
### Added
- First Initial Exchange Offering (IEO) framework for SACE on P2B Exchange (300 million SACE tokens at $23 USD per token).  
- README.md updated with a summary and backlink to the SACE IEO Listing Framework.

---

## [v1.2.0] - 2025-11-13

### Summary
This version delivers major updates across the SACE Oracle architecture, deployment verification, and documentation.  
It finalizes the transition to the **SACE Price Feed System**, with improved clarity, consistency, and verified smart contract references on BSC.

### Added
- **SACE_CONTRACT_FLOW.md**  
  - Introduced full ASCII architecture diagram describing the SACE Oracle Proxy → Registry → Multi-tier feed flow.  
  - Provides detailed explanation of the system’s data flow, components, and upgradeability design.

### Changed
- **Contract Verification & Deployment**
  - Successfully deployed new **SACE Oracle Proxy (UUPS)** and **SACEOracleRegistry** contracts on BSC.
  - Verified implementation `0xAA1b92910370853E0E97E63670ef7B0d072cBF3a` on BSCScan.
  - Investigated verification mismatch and ensured correct linkage for the active proxy `0x6Ee1ec18C3629B4Dea00703286DcA3BEEE49F122`.

- **Contract Source Update**
  - Renamed `SACEOracleRegistry_flat.sol` → `SACEOracleRegistry.sol` to align with the new architecture.
  - Refactored and upgraded contract logic for multi-tier data aggregation and improved modularity.

- **Documentation**
  - Updated:
    - `README.md` – Added concise summary of the SACE Price Feed System with backlink to the detailed flow.
    - `SACE_PROJECT_INDEPENDENT_REVIEW.md` – Refreshed contract addresses and technical references.
    - `SACE_CONTRACTS_SUMMARY.md` – Updated contract deployment addresses and network details.
  - Improved clarity in commit message formatting for consistency across all repositories.

### Version Bump
- Release incremented from **v1.1.0 → v1.2.0**.

### Notes
This release finalizes all registry upgrades and verification cleanups needed to prepare for audit and upcoming integration testing.  
It establishes a stable, verifiable baseline for all SACE smart contracts on BSC.

---

## [v1.1.0] - 2025-11-11
### Added
- **SACE_BENCHMARK.md** — Introduced a detailed analysis and documentation explaining how SACE is benchmarked against the U.S. Dollar Index (DXY) instead of a single U.S. Dollar.  
  - Describes the use of on-chain, upgradeable UUPS architecture to integrate DXY price feeds from trusted oracles.  
  - Provides real-world reference modeling for macroeconomic alignment between SACE and the DXY basket (EUR, JPY, GBP, CAD, SEK, CHF).  
  - Includes detailed examples and calculation ratios to illustrate SACE-to-DXY pairing dynamics.  

### Updated
- Repository documentation improved to reflect SACE’s data-driven valuation model and benchmark methodology.  
- README updated with summary of the independent review and benchmarking linkage to DXY.

### Summary
This release formalizes SACE’s macroeconomic benchmarking structure, ensuring the token’s value is transparently aligned with global currency strength while maintaining Africa-centric representation through its synthetic basket of 21 national currencies.

---

## [v1.1.0] - 2025-11-10
### Added
- **Treasury & Growth Fund Allocation:** Introduced a new section detailing the allocation of **17.5 billion SACE** (estimated at **$402.5 billion USD**) to the **SACE Treasury and Ecosystem Growth Fund**.  
- The fund is dedicated to financing and deploying **AfrailX smart-rail infrastructure systems** across Africa, supporting regional integration and sustainable mobility through blockchain innovation.

### Updated
- Enhanced **Tokenomics Summary** for clarity and consistency with current ecosystem and IEO structure.
- Improved financial representation to better align with total ecosystem valuation of **$2.3 trillion USD**.

### Version Note
This release refines SACE’s on-chain economic model documentation and strengthens its alignment with real-world infrastructure funding goals.

---

## [v1.0.9] - 2025-11-04

### Added
- **SACE_PROJECT_INDEPENDENT_REVIEW.md**: Independent financial and strategic review of SACE, including market potential, tokenization strategy, FDV valuation ($2.3 trillion USD), and funding plan for AfrailX without external borrowing.
- Updated README with a short summary of the independent review for investors, stakeholders, and traders.

### Release
- New release **v1.0.9** created to include the independent review and project updates.

---

## [v1.0.8] - 2025-11-02  
### Comprehensive Documentation and Oracle Transparency Update for SACE Contracts

#### Added
- **SACEOracleRegistry.sol** added under `contracts/` (flattened version) for public verification on BscScan.  
  This contract manages hybrid and Chainlink-based price feeds for African currencies.
- **AggregatorV3Interface.sol** added under `contracts/interfaces/` to support Chainlink oracle data structure.
- **docs/SACE_CONTRACTS_SUMMARY.md** introduced — a detailed, investor-oriented explanation of how SACE works.  
  It describes the interrelation between the **SACE Proxy**, **Implementation**, and **Oracle Registry**,  
  including how on-chain and hybrid price feeds are securely managed.
- New **Oracle Trust Model** section detailing how Tier 2 (Hybrid) prices are retrieved from trusted data sources (XE, OANDA, etc.)  
  and updated on-chain to ensure real-time reliability and transparency.

#### Updated
- **README.md** updated with a concise summary of the SACE contract architecture and oracle reliability assurance.  
  This provides investors, stakeholders, and traders with a quick understanding of how the system maintains trustworthy exchange rates.
- Internal documentation cleaned and standardized to reflect the verified contract addresses:
  - **SACE Proxy:** `0x3Bb737BFaCfA48e912014686D051D6f39c747802`
  - **SACE Implementation:** `0x7E1633443a50866847C92A580FbD9c531107061b`
  - **SACE Oracle Registry:** `0x03233fb8cf478Fb6c3BB284bC82f1df3CA39d480`

#### Technical Notes
- SACE Proxy is now fully operational and mapped to the verified implementation address on BNB Smart Chain.  
- The **SACE Oracle Registry** feeds live rates from trusted external sources and Chainlink,  
  ensuring that all hybrid (Tier 2) currency values remain current and verifiable.  
- Verification workflows streamlined for future deployment consistency.

#### Significance
This release represents a major step toward **full transparency, investor confidence, and ecosystem trust**.  
It bridges the technical depth of SACE’s on-chain architecture with public understanding,  
demonstrating a strong commitment to verifiable data integrity, financial accuracy, and cross-border currency transparency.

---

[v1.0.7] – 2025-10-28

- Updated social media announcement for SACE to include direct link to [Simon Kapenda's LinkedIn](https://linkedin.com/in/simonkapenda).
- Added full SACE Whitepaper URL: https://github.com/abba-platforms/SACE/blob/main/SACE_Whitepaper.md.
- Ensures proper attribution to the creator and provides readers with access to comprehensive project details, tokenomics, and economic impact.

---

## [v1.0.7] – 2025-10-28

### Added
- Introduced a "Whitepaper Summary" section in the README to provide a concise overview of SACE, including its purpose, tokenomics, governance, and projected $2.3 trillion USD valuation.
- Added link to the full Whitepaper for detailed technical and economic analysis.

---

## [v1.0.7] - 2025-10-28

### Added
- Expanded SACE Whitepaper with new details on valuation, tokenomics, and market impact.
- Added comprehensive section highlighting SACE’s $2.3 trillion USD debut valuation and projected $230 million USD net worth per founding member.
- Included verified contract addresses (Proxy & Implementation) and GitHub repository link.
- Added “Basic Project Information” section with key technical details for Coinbase listing.
- Prepared documentation alignment for upcoming IEO launch.

### Updated
- Enhanced narrative and formatting consistency across all Whitepaper sections.
- Improved overall readability and global presentation quality.

### Repository
- **GitHub:** [https://github.com/abba-platforms/SACE](https://github.com/abba-platforms/SACE)

---

## [v1.0.6] – 2025-10-27  
**Updated:** Executive Summary in `README.md` to include the **$2.3 trillion USD valuation** of the SACE currency basket.  
- Added explicit reference to the total valuation of Africa’s top 21 national currencies represented by SACE.  
- Improved narrative clarity around SACE’s macroeconomic role and its benchmarking to indices like the **U.S. Dollar Index (DXY)**.  
- Maintained original tone, formatting, and structure while reinforcing SACE’s position as a foundational financial instrument in Africa’s digital economy.  

---

## [v1.0.6] – 2025-10-27
- Updated SACE.sol in the repository to match the latest verified implementation on BSC Mainnet.
- Ensures the repository reflects the production-ready, safe implementation.
- Aligns the codebase with Proxy and Implementation contract addresses:
  - Proxy: 0x3Bb737BFaCfA48e912014686D051D6f39c747802
  - Implementation: 0x7E1633443a50866847C92A580FbD9c531107061b

---

## [v1.0.6] – 2025-10-27

* Added verified **SACE implementation address** (`0x7E1633443a50866847C92A580FbD9c531107061b`) to the README under Mainnet Deployment.
* Clarified that the proxy is currently pointing to the safe verified implementation.
* No other changes to code, documentation, or tokenomics.

---

## [v1.0.5] - 2025-10-17

### Updated

* **SACE.sol**: Enhanced contract architecture to support a corrected proxy linkage and verified upgrade path on BSC.
* Improved UUPS upgrade logic and proxy initialization checks to ensure accurate implementation address mapping.
* Cleaned up redundant dependency references and reinforced upgrade safety mechanisms.

### Fixed

* Proxy verification issue that caused the contract to point to the wrong implementation address.
* Compilation warnings related to overlapping artifacts (`SACE.sol` and `SACE_flattened.sol`).

---

## [v1.0.4] - 2025-10-15

### Added
- Introduced **SACE TOKENOMICS & IEO FRAMEWORK** detailing supply allocation, pricing model, governance, and compliance structure.
- Added new **IEO release notes** outlining the $23 per token valuation and ecosystem target exchanges (KuCoin, P2B, BitMart, MEXC).
- Included SACE deployment confirmation on **BSC Mainnet** with verified proxy address.
- Updated **README** to include deployment details and project ecosystem summary.
- Published **release v1.0.4** with full documentation and public announcement references.

### Changed
- Merged descriptions of **SACE**, **CillarCoin (CILLAR)**, and **Namibia Digital Dollar (NADD)** into one cohesive paragraph in README for consistency and improved readability.
- Revised branding references to highlight **Abba Platforms Inc.** as the umbrella organization.
- Enhanced formatting and internal linking across documentation.

### Fixed
- Minor text and formatting inconsistencies in prior README version.

---

## [v1.0.4] - 2025-10-15
### Added
- Released **SACE TOKENOMICS & IEO FRAMEWORK** document.
- Detailed token distribution, founder, team, management, treasury, and IEO allocations.
- Established **IEO parameters**: price ($23 per SACE), soft cap ($5B USD), hard cap ($57.5B USD), vesting schedule, and target exchanges.
- Defined SACE **utility**: medium of exchange, governance, staking, and collateral use.
- Governance structure and compliance guidelines under **Abba Platforms Inc.** and **SASE Governance Board**.
- Mainnet deployment details: verified **BSC Mainnet** smart contract, upgradeable proxy, and implementation contract address.

### Updated
- README summary with back link to the full Tokenomics & IEO document.

### Notes
- SACE represents a weighted basket of Africa’s top 21 currencies, with a combined valuation of **$2.3 trillion USD**.

---

## [v1.0.3] - 2025-10-08
### Release Overview
This release refines the SACE documentation for accuracy and transparency regarding market valuation dynamics.

### Added / Updated
- **New Release:** v1.0.3 — Documentation and valuation clarification update.
- Clarified that the **$23 per SACE** valuation is **market-derived**, not a fixed or preset price by the SACE development team.
- Updated **SACE_BASKET_VALUE.md** introduction to emphasize that pricing reflects proportional market equilibrium between:
  - SACE’s 100 billion max supply  
  - Africa’s $2.3 trillion combined currency basket value
- Improved language consistency across documentation for better comprehension and investor clarity.

---

## [v1.0.2] - 2025-10-07
### Added
- Added new file `SACE_BASKET_VALUE.md` detailing the economic analysis of the SACE currency basket, pricing model, proportional movements, and long-term performance simulation.

### Changed
- Updated `README.md` and `Whitepaper.md` to reflect new max supply: **100,000,000,000 SACE** instead of 10,000,000,000.
- Clarified wording in `README.md`: "As of October 2025, SACE includes the following currencies:" → "As of October 2025, SACE Currency Basket Index includes the following currencies:".

### Fixed
- Corrected numerical formatting and consistency in documentation.

---

## [v1.0.1] - 2025-10-06 - Update
- Updated README.md wording for clarity:
  - Changed "As of October 2025, SACE includes the following currencies:"  
    to "As of October 2025, SACE Currency Basket Index includes the following currencies:"  
  - Improves precision in describing the scope of the SACE project.
 
---

## Version 1.0 — October 6, 2025
**Status:** Initial release / repository bootstrap

**Summary:**  
Initial project creation and repository bootstrap for the Synthetic Africa Currency Exchange (SACE). This is the first commit and contains the core artifacts needed to continue development, auditing, and deployment planning.

### ✅ Added
- `contracts/SACE.sol` — Finalized smart contract (initial production draft).  
- `contracts/SACE.sol.md` — Documented contract source and developer notes.  
- `SACE_Whitepaper.md` — Full whitepaper (vision, tokenomics, technical design).  
- `SACE_Analysis.md` — Economic & strategic analysis for SACE.  
- `SACE_Audit_Report.md` — Deep OpenZeppelin-style audit report and scorecard.  
- `README.md` — Repository README with setup, docs and links.  
- `LICENSE` — MIT license attributed to Abba Platforms Inc., created by Simon Kapenda.  
- `CHANGELOG.md` — This changelog (initial version).  
- CI / deployment scaffolding (if present) — initial scripts & templates.

### 🔧 Notes
- All files reflect project start date (Oct 6, 2025). No prior history or versions are included — this repo begins today.
- Smart contract is written as an upgradeable BEP-20 with oracle integration and audit recommendations; further governance hardening (multisig/timelock) and expanded tests are planned.

---

## Upcoming / Roadmap (short-term)
- Add multisig timelock governance for admin & upgrade operations.  
- Implement comprehensive unit & integration test suite (oracle mocks included).  
- Add multi-feed oracle redundancy and monitoring endpoints.  
- Finalize deployment scripts for BSC mainnet / testnet.  
- Publish audited release tag once tests and governance are in place.

---

© 2025 Abba Platforms Inc.  
Created by **Simon Kapenda**
