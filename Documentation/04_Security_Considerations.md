# 4. Security Considerations for NikePig Smart Contracts

Security is paramount for any smart contract, especially for a high-stakes dApp like NikePig that handles significant user funds and involves complex game mechanics. This section details key security considerations, common vulnerabilities, and audit preparation for Cardano smart contracts, with a focus on Plutus and the NikePig architecture.

## 4.1. General Smart Contract Security Principles

These apply broadly but are critical for Cardano:

*   **Minimize Attack Surface:** Keep contracts as simple as possible. Every line of code is a potential vulnerability.
*   **Fail Safely:** Design contracts to fail in a safe state if an error occurs, preventing loss of funds.
*   **Handle All States and Edge Cases:** Thoroughly consider all possible inputs, transaction orderings, and contract states.
*   **Avoid External Calls Where Possible:** If external calls (e.g., to oracles) are necessary, be aware of their trust assumptions and potential points of failure.
*   **Clarity and Readability:** Well-documented and clearly written code is easier to audit and reason about.
*   **Immutability:** Once deployed, Plutus scripts are immutable. Upgradability patterns (if needed) must be carefully designed and also audited.

## 4.2. Cardano-Specific Vulnerabilities (eUTXO & Plutus)

While the eUTXO model offers some security advantages (like predictability), specific vulnerabilities can arise:

*   **Transaction Ordering Dependence (Less Common but Possible):** While individual script validation is deterministic, the overall outcome of a sequence of transactions interacting with multiple UTXOs could still be manipulated if not carefully designed.
*   **Datum Manipulation:** Ensure that datum values are correctly validated and cannot be maliciously crafted to exploit contract logic.
*   **Redeemer Exploits:** Attackers might try to craft redeemers that satisfy validation logic in unintended ways.
*   **Time-Based Attacks (e.g., on the Countdown Timer):**
    *   **Timestamp Dependence:** Relying on `POSIXTime` (slot times) can be tricky. Ensure the logic correctly handles slot length variations and potential (though limited) validator manipulation of time ranges.
    *   The 72-hour countdown and its reset mechanism are critical. Ensure that the timestamp validation is robust and cannot be bypassed or unfairly influenced.
*   **Re-entrancy (Different from Account Model):** While classic re-entrancy attacks seen in Ethereum are not directly applicable due to eUTXO's nature, be cautious with complex interactions where one script's output becomes another's input in a chain, ensuring no unintended recursive spending paths.
*   **Denial of Service (DoS):**
    *   **Locking Funds Indefinitely:** Ensure there's always a path to retrieve funds or progress the contract state. Avoid conditions where UTXOs can become permanently unspendable due to flawed logic.
    *   **Making Contract Unusable:** An attacker might try to put the contract into a state where no valid transactions can be made (e.g., by consuming a critical UTXO or manipulating datum to an invalid state).
*   **Oracle Manipulation:** If using oracles (e.g., for token prices in daily rewards, or for randomness), they become a point of trust and a potential attack vector.
*   **Minting Policy Exploits:**
    *   **Infinite Minting:** If the minting policy for $NIKEPIG, $MISTER, or NFTs is flawed, an attacker might be able to mint an unlimited supply.
    *   **Unintended Burning:** Ensure tokens/NFTs cannot be burned maliciously or accidentally by unauthorized parties.

## 4.3. Security for NikePig's Specific Mechanics

*   **Main Prize Pool Payout:**
    *   **Winner List (`last_100_depositors`):** Ensure this list cannot be unfairly manipulated. The logic for adding/removing depositors must be robust.
    *   **Proportional Payout Calculation:** This calculation must be precise and immune to rounding errors or manipulation that could favor certain winners or siphon funds.
    *   **Correctness of `ClaimMainPrize`:** The conditions for claiming (timer expired) must be strictly enforced.
*   **Daily Prize Distribution:**
    *   **Random Winner Selection:** On-chain randomness is notoriously difficult. If a pseudo-random method is used, analyze its exploitability. If an oracle is used, vet its security. The mechanism must be fair and transparent.
    *   **Participant List for Token/NFT Rewards:** As highlighted in the architecture, managing and querying a list of all past participants is a challenge. If an off-chain solution is used for this, ensure the on-chain verification part is secure and cannot be gamed.
    *   **Token/NFT Value Calculation:** If payouts depend on external values, secure oracles are essential.
*   **Fee Collection:** Ensure the 1% transaction fee and 5% prize pool cut are correctly calculated and transferred to the team/treasury without vulnerabilities.
*   **Diminishing Reset Mechanic:** The logic for reducing the timer reset value must be implemented correctly and not allow for premature or delayed payouts.

## 4.4. Development and Testing Best Practices for Security

*   **Rigorous Testing:**
    *   **Unit Tests:** Test individual functions and components of the Plutus scripts.
    *   **Property-Based Testing:** Use tools like QuickCheck (available in Haskell) to test that properties of the contract hold true for a wide range of inputs.
    *   **Integration Tests:** Test the interaction between different contract components and with off-chain code.
    *   **Scenario-Based Testing:** Simulate various user interactions and attack scenarios on a testnet or emulator.
*   **Code Reviews:** Conduct internal code reviews with multiple developers.
*   **Static Analysis:** Utilize any available static analysis tools for Plutus/Haskell to catch common errors.
*   **Formal Verification (If Feasible):** For critical parts of the logic, explore formal verification techniques to mathematically prove correctness. Cardano's research focus supports this. <mcreference link="https://www.antiersolutions.com/cardano-blockchain-development-a-comprehensive-guide/" index="1">1</mcreference>
*   **Keep Dependencies Updated:** If using third-party libraries or tools, keep them updated to patch known vulnerabilities.

## 4.5. Security Audit Preparation (e.g., with Anastasia Labs)

The project brief specifically mentions a security audit by Anastasia Labs. <mcreference link="https://www.antiersolutions.com/cardano-blockchain-development-a-comprehensive-guide/" index="1">1</mcreference>

*   **Clear Documentation:** Provide auditors with comprehensive documentation:
    *   High-level architecture of NikePig.
    *   Detailed specification of each smart contract's intended behavior.
    *   Rationale behind design decisions, especially those related to security.
    *   Description of how state is managed in the eUTXO model.
    *   Flow diagrams for user interactions and contract logic.
*   **Well-Commented Code:** The Plutus (Haskell) code should be thoroughly commented to explain logic and assumptions.
*   **Complete Test Suite:** Share the full test suite and evidence of testing.
*   **Threat Model:** Prepare a document outlining potential threats and attack vectors you've considered and how the design mitigates them.
*   **Known Issues/Limitations:** Be transparent about any known issues, complexities, or areas of concern.
*   **Deployment and Upgrade Strategy:** If any upgrade mechanisms are planned, they must also be part of the audit scope.
*   **Scope Definition:** Clearly define the scope of the audit with the auditors.
*   **Access to Code and Environment:** Provide auditors with access to the codebase (e.g., private Git repo) and a test environment.
*   **Timelines and Communication:** Establish clear communication channels and timelines for the audit process.

## 4.6. Post-Audit Actions

*   **Address Findings:** Diligently address all issues and recommendations raised by the auditors.
*   **Re-Audit (If Necessary):** For significant changes made post-audit, consider a re-audit of the modified components.
*   **Bug Bounty Program:** Consider implementing a bug bounty program after launch to incentivize ongoing security research by the community.

By prioritizing security throughout the development lifecycle and undergoing a rigorous external audit, the NikePig dApp can build trust and protect user funds.

---

Next: [05_Tokenomics_NFTs.md](./05_Tokenomics_NFTs.md)