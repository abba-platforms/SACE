# SACE Contracts Summary

This document provides a clear explanation of the main SACE contracts deployed on BNB Smart Chain, their roles, and what they mean for investors, traders, stakeholders, and the general audience. It is written to be technically accurate but understandable for non-technical readers.

---

## 1. SACE Proxy Contract
Address: 0x3Bb737BFaCfA48e912014686D051D6f39c747802

- Role: This is the main contract that users interact with when using SACE. It handles trading, minting, and burning of synthetic assets.  
- Proxy Pattern: The SACE Proxy does not contain the core logic itself. Instead, it delegates all operations to the Implementation Contract.  
- Why it exists: Using a proxy allows the SACE team to upgrade the logic in the future without changing the address that users interact with. This ensures continuity and trust — users and traders always use the same contract address even when improvements are made.  
- Transparency: The proxy is verifiable on BscScan and points to the verified implementation. Users can confirm that the proxy calls the intended implementation logic.

---

## 2. SACE Implementation Contract
Address: 0x7E1633443a50866847C92A580FbD9c531107061b

- Role: This is the “brain” of SACE. All trading, price calculations, and core logic reside here.  
- Interaction: The Proxy contract forwards all calls to this Implementation. This separation allows upgrades without affecting user balances or historical transactions.  
- Verification: The implementation contract is verified on BscScan. Anyone can read the source code, see how trades are executed, and audit the logic directly.  
- Trust Factor: Investors and traders can confirm that the SACE exchange behaves exactly as described, and there is no hidden functionality.

---

## 3. SACE Oracle Registry Proxy
Address: 0x03233fb8cf478Fb6c3BB284bC82f1df3CA39d480

- Role: This contract stores price feeds for all currencies supported on SACE. It acts as the official source for synthetic asset valuations.  
- Hybrid System:  
  - Tier 1 currencies (like ZAR) use Chainlink price feeds for reliable, decentralized pricing.  
  - Tier 2 currencies use a **hybrid on-chain model**. Instead of manual input, SACE runs an automated feed system that continuously retrieves and validates prices from multiple trusted global sources such as **XE**, **OANDA**, **Bloomberg**, and **Open Exchange Rates** APIs. These prices are aggregated, normalized, and posted on-chain through verifiable transactions signed by authorized feed operators.  
  - This ensures that Tier 2 prices remain accurate and transparent even in regions where Chainlink does not yet provide direct feeds. Every price update emits an event visible on-chain, meaning any investor, trader, or auditor can independently track and verify all feed changes in real time.  
- Proxy-Based Upgradeable: Like SACE, the Oracle Registry can be upgraded in the future, but its address remains the same for users and other contracts to interact with.  
- Verification: The Oracle contract (proxy and/or implementation) should be verified on BscScan to allow traders and stakeholders to check how prices are set and updated.

---

## Key Takeaways for Investors and Traders

1. Upgradeable & Secure: SACE uses a proxy + implementation architecture, allowing future improvements without disrupting users.  
2. Verified Components: The SACE implementation is verified on BscScan; verification of proxy + oracle improves transparency for third-party auditors and traders.  
3. Transparent Price Feeds:  
   - Tier 1 prices come from decentralized Chainlink oracles.  
   - Tier 2 prices come from an automated hybrid network fetching data from institutional sources such as XE, OANDA, and Bloomberg — updated on-chain and auditable through events.  
4. Investor Confidence: The separation of proxy, implementation, and oracle registry ensures trust, reliability, and alignment with DeFi best practices.  
5. User Simplicity: From a trader’s perspective, interactions occur through the same Proxy address — no need to track multiple contract addresses for everyday use.

---

## Detailed Plain-English Explanation (for non-technical stakeholders)

What a proxy is, and why we use it:  
A proxy contract is like a mailbox address that never changes. You always send messages (transactions) to the same mailbox. Behind that mailbox sits a worker who actually handles the request — that worker is the implementation contract. When we need to change how work is done (fix a bug, add a feature, or improve performance), we swap the worker behind the mailbox while keeping the mailbox address the same. This avoids breaking integrations and maintains user trust.

What the implementation contract does:  
The implementation contract contains the business rules: how synthetic assets are created, how trades are matched and settled, how fees are calculated, and how access and roles are enforced. It is the code that runs your exchange logic. Because this is verified on BscScan, anyone can read and audit the logic.

What the Oracle Registry does:  
The Oracle Registry provides price information. The SACE implementation queries this registry to value assets. For currencies like the South African Rand (ZAR), we rely on Chainlink so the price source is decentralized and widely trusted.  

For less liquid or region-specific currencies, SACE’s **hybrid oracle layer** automatically gathers price data from multiple global FX data providers (XE, OANDA, and others), compares and cross-validates the rates, and publishes the final consensus price on-chain. This happens through a set of trusted update scripts operated by SACE’s verified signer keys — no manual overrides.  

Every price update generates a transaction and an on-chain event log, providing an immutable public trail. This means anyone can independently confirm when and how prices were updated, ensuring full transparency.

Why verification matters:  
Verification on BscScan ties bytecode to human-readable source code. That means auditors, exchanges, and regulators can confirm that the deployed bytecode matches the published source. Verified contracts improve confidence and help on-board institutional counterparties.

What can go wrong and how upgrades help:  
If a bug is found, a non-upgradeable contract would require redeploying everything and moving users — costly and disruptive. With proxy + implementation, we can patch the logic quickly and safely (through established upgrade procedures) without changing the user-facing address. Upgrades should be governed (multi-sig, timelock, or DAO process) to prevent misuse.

---

## Addresses (for public reference)

- SACE Proxy (user-facing): 0x3Bb737BFaCfA48e912014686D051D6f39c747802  
- SACE Implementation: 0x7E1633443a50866847C92A580FbD9c531107061b  
- SACE Oracle Proxy: 0x03233fb8cf478Fb6c3BB284bC82f1df3CA39d480

---

## Operational Notes for Auditors / DevOps

- Confirm the proxy admin and admin slot for each proxy to verify who can upgrade.  
- Confirm the implementation address in the EIP-1967 implementation slot.  
- Verify the implementation source on BscScan (done for SACE implementation).  
- Verify the proxy metadata mapping and proxy verification on BscScan to allow "Read/Write as Proxy" UI. If the proxy shows an unknown implementation, ensure the implementation mapping and metadata were uploaded to the explorer (force verify once mapping exists).  
- For the Oracle registry, confirm Chainlink feed addresses and the automated hybrid update system (review oracle scripts that aggregate data from XE, OANDA, and other verified sources). Each update emits an on-chain event with timestamp and price data.

---

## FAQ (short answers for stakeholders)

Q: Do I interact with the implementation?  
A: No. Interact with the Proxy address. The proxy forwards calls to the implementation.

Q: Can the code change after deployment?  
A: Yes — the implementation can be swapped by the proxy admin or via the upgrade mechanism. Proper governance should control upgrades.

Q: Why are there two addresses for SACE?  
A: One is the stable user-facing proxy, the other is the replaceable implementation (logic). This is standard upgradeable-contract architecture.

Q: Does the oracle control everything?  
A: No. The oracle provides prices. The SACE implementation enforces logic (trading rules, risk checks, settlements) and queries the oracle for valuations.

Q: How can I trust Tier 2 prices?  
A: Tier 2 prices are fetched automatically from multiple institutional FX sources (XE, OANDA, Bloomberg, etc.), verified by SACE’s on-chain oracles, and logged transparently. No manual editing is allowed; every update is visible and traceable on BNB Smart Chain.

---

## Appendix — Contract Interaction Diagram

         +----------------------------+
         |      User / Trader         |
         +-------------+--------------+
                       |
                       v
         +----------------------------+
         |      SACE Proxy            |
         | 0x3Bb737BFaCfA48e9120146.. |
         +-------------+--------------+
                       |
         Delegate calls (all user functions)
                       |
                       v
         +----------------------------+
         |  SACE Implementation       |
         | 0x7E1633443a50866847C92A.. |
         +-------------+--------------+
                       |
             Reads / uses prices
                       |
                       v
         +----------------------------+
         |  SACE Oracle Registry      |
         | 0x03233fb8cf478Fb6c3BB28.. |
         +----------------------------+
           | Tier 1: Chainlink feeds
           | Tier 2: Hybrid (automated fetchers from XE, OANDA, etc.)
           v
        Price feeds consumed by SACE implementation

Explanation of Diagram:  
- Users/Traders always interact with the SACE Proxy.  
- Proxy forwards all operations to the verified Implementation contract.  
- The Implementation performs logic and queries the Oracle Registry for currency prices.  
- The Oracle Registry supplies Tier 1 (Chainlink) and Tier 2 (Hybrid automated) prices.  
- This structure ensures upgradeability, auditability, and transparent pricing.

### Author:         

Simon Kapenda, SACE Creator

---

End of file.
