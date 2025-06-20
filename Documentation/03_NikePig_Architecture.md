# 3. Last Pigs Standing Smart Contract Architecture

This section outlines the proposed smart contract architecture for the Last Pigs Standing dApp (formerly NikePig) on the Cardano blockchain. The architecture is designed to implement the core game mechanics, prize distribution, Reset Killer mechanic, and token/NFT interactions as described in the project brief, leveraging Aiken smart contracts and Cardano's eUTXO model.

## 3.1. Core Components

The Last Pigs Standing dApp will primarily consist of the following smart contract components:

1.  **Main Prize Pool Contract:** Manages the primary ADA prize pool, deposit logic, 72-hour countdown timer with Reset Killer mechanic, and winner determination/payout for the main game.
2.  **Daily Prize Contract:** Handles the daily distribution of a portion of contributions to a random daily winner, token holders ($NIKEPIG, $MISTER), and NFT holders (Nikeverse, Mister NFTs).
3.  **Reset Killer Scheduler Contract:** Manages the scheduling and activation of Reset Killer events (1 month after launch, then every 6 months).
4.  **Token Minting Policies:** Separate minting policies for $NIKEPIG and $MISTER tokens.
5.  **NFT Minting Policies:** Minting policies for Nikeverse and Mister NFTs, potentially incorporating rarity logic.
6.  **Treasury/Fee Contract (Optional but Recommended):** A contract or mechanism to manage the collection and distribution of team revenue (transaction fees, prize pool cut).

## 3.2. Main Prize Pool Contract (Plutus)

This is the central contract of the NikePig dApp.

*   **State Management (Datum):** The contract's UTXO will hold a datum containing:
    *   `current_prize_pool_ada`: Total ADA accumulated.
    *   `countdown_end_timestamp`: The exact timestamp when the countdown will end if no new deposits are made.
    *   `reset_killer_active`: Boolean indicating if Reset Killer mode is currently active.
    *   `reset_killer_next_timestamp`: Timestamp of the next scheduled Reset Killer event.
    *   `current_reset_duration`: Current timer reset duration (decreases by 1 second each deposit during Reset Killer).
    *   `last_100_depositors`: A list (or a more optimized data structure) storing information about the last 100 depositors. Each entry should include:
        *   `wallet_address`: The depositor's wallet address.
        *   `amount_deposited`: The ADA amount deposited by this wallet that is currently part of the "last 100" qualifying deposits.
        *   `deposit_timestamp`: High-precision timestamp (with fractions of seconds) of their last qualifying deposit.
    *   `hardcoded_deadline_timestamp`: The timestamp for the one-year (or other set period) deadline after which the diminishing reset mechanic activates.
    *   `current_reset_reduction`: The current reduction value (in seconds/minutes) for the countdown timer reset (applies after the hardcoded deadline).

*   **Redeemers (Actions):**
    *   **`DepositADA`:**
        *   Accepts ADA from a user.
        *   Validates the deposit amount (e.g., minimum if any).
        *   Updates `current_prize_pool_ada`.
        *   Updates `last_100_depositors` (adds new depositor, potentially removes the oldest if list exceeds 100).
        *   Resets `countdown_end_timestamp`: Adds 72 hours (or the diminished amount post-deadline) to the current time.
        *   If past `hardcoded_deadline_timestamp`, applies `current_reset_reduction` to the 72-hour reset and potentially increments `current_reset_reduction`.
        *   Takes the 1% transaction fee for the team.
        *   Allocates portions of the deposit for the Daily Prize contract (see 3.3).
    *   **`ClaimMainPrize`:**
        *   Can only be successfully executed if `current_timestamp >= countdown_end_timestamp`.
        *   Calculates the proportional payout for each of the `last_100_depositors`.
        *   Takes the 5% team cut from the `current_prize_pool_ada` before distribution.
        *   Distributes the remaining ADA to the 100 winners according to their proportions.
        *   Resets the contract state for a new game (or deploys a new instance).

*   **Logic Considerations:**
    *   **Managing `last_100_depositors`:** This list needs careful implementation to be efficient within Cardano's transaction size and computation limits. Storing full wallet addresses and amounts for 100 entries directly in the datum might be challenging. Alternatives could involve linked lists of UTXOs, or a more compressed representation.
    *   **Proportional Payout Calculation:** Must be done accurately and deterministically on-chain.
    *   **Diminishing Reset:** The logic for reducing the reset timer after the hardcoded deadline needs to be clearly defined and implemented.
    *   **Seeding:** The initial 100 ADA seed by the team will be the first deposit.

## 3.3. Daily Prize Contract (Plutus)

This contract (or a set of functions within the Main Prize Pool contract interacting with specific outputs) manages the daily rewards.

*   **Funding:** Receives a portion of each deposit from the Main Prize Pool contract (e.g., 5% for random winner, 10% for token holders, 1% for NFT holders).
*   **State Management (Datum):** Could track daily accumulated amounts for each prize category if payouts are batched, or payouts could be triggered per deposit for simplicity (though less efficient).
    *   `daily_random_winner_pot`: ADA accumulated for the daily random winner.
    *   `daily_token_holder_pot`: ADA accumulated for token holders.
    *   `daily_nft_holder_pot`: ADA accumulated for NFT holders.
    *   `last_daily_payout_timestamp`: To manage the 24-hour cycle.

*   **Redeemers (Actions) / Triggered Logic:**
    *   **`DistributeDailyPrizes`:**
        *   Triggered automatically (e.g., by a keeper bot) or by any user after a 24-hour period has passed since `last_daily_payout_timestamp`.
        *   **Random Winner (5%):**
            *   Requires a source of randomness (challenging on-chain). Could use a commit-reveal scheme, an oracle, or a pseudo-random selection based on transaction details from that day (less secure).
            *   Probability proportional to ADA deposited that day. This requires tracking daily deposits and depositors.
        *   **Token Holder Payout (10%):**
            *   Scans wallets of all past participants (requires a list of all unique depositors ever, which could become very large).
            *   Checks $NIKEPIG and $MISTER token balances in those wallets.
            *   Distributes proportionally to the combined value of their holdings (requires a price feed or defined value for tokens if not ADA-denominated).
        *   **NFT Holder Payout (1%):**
            *   Scans wallets of all past participants.
            *   Checks for Nikeverse and Mister NFTs.
            *   Distributes based on rarity tiers (requires on-chain or off-chain verifiable rarity information).
        *   Updates `last_daily_payout_timestamp`.

*   **Logic Considerations:**
    *   **List of Past Participants:** Maintaining and querying a growing list of all past participants for daily token/NFT rewards is a significant scalability challenge on-chain. This might require off-chain computation with on-chain verification, or a different mechanism (e.g., users actively claiming daily rewards if eligible).
    *   **Randomness:** Secure on-chain randomness is a hard problem. The project needs to decide on an acceptable solution.
    *   **Proportionality and Value:** Calculating payouts based on combined token value and NFT rarity adds complexity and may require oracles or predefined parameters.
    *   **Eligibility:** Ensuring a user has deposited at least once in the past before receiving token/NFT rewards. This links back to the list of past participants.

## 3.4. Token Minting Policies ($NIKEPIG, $MISTER - Plutus)

*   Standard native asset minting policies.
*   **Rules:**
    *   Define who can mint/burn tokens (e.g., a specific team-controlled key).
    *   Define total supply (if fixed) or conditions for minting (if dynamic).
*   These tokens will be used for the daily prize distribution.

## 3.5. NFT Minting Policies (Nikeverse, Mister NFTs - Plutus)

*   Standard native asset minting policies, but can be more complex to handle collections and rarity.
*   **Rules:**
    *   Define who can mint NFTs.
    *   Define how many NFTs in a collection.
    *   **Rarity:** Rarity can be enforced by:
        *   Pre-defining metadata and minting specific quantities of each.
        *   On-chain logic that assigns rarity based on certain conditions during minting (more complex).
*   These NFTs will be used for the daily prize distribution.

## 3.6. Treasury/Fee Contract (Plutus - Optional)

*   A dedicated contract could receive the 1% transaction fees and the 5% prize pool cut.
*   **Datum:** Could store balances for Dr Caleb L and $cashcoldgame.
*   **Redeemer:** `DistributeProfits` - allows authorized wallets (or a multi-sig) to withdraw accumulated fees according to the 50/50 split.
*   Alternatively, fees could be sent directly to team wallets from the Main Prize Pool contract, but a dedicated treasury contract offers more transparency and potential for future governance.

## 3.7. Interactions and Flow

1.  User deposits ADA into the Main Prize Pool Contract.
2.  Main contract validates, updates state, resets timer, takes 1% fee (to Treasury/team), and allocates portions to Daily Prize contract/outputs.
3.  Daily Prize contract/logic accumulates these portions.
4.  Periodically (daily), the `DistributeDailyPrizes` logic is triggered.
    *   Selects random winner.
    *   Identifies eligible token/NFT holders from past participants and distributes rewards.
5.  If the 72-hour timer in the Main Prize Pool Contract expires, `ClaimMainPrize` can be called.
    *   Team takes 5% cut (to Treasury/team).
    *   Remaining pool is distributed to the last 100 depositors.

## 3.8. Key Challenges & Considerations for NikePig Architecture

*   **Scalability of `last_100_depositors` list:** Needs an efficient on-chain representation.
*   **Scalability of `past_participants` list for daily rewards:** This is a major hurdle. An opt-in claim system for daily rewards might be more feasible than scanning all past wallets.
*   **On-chain Randomness:** Requires a secure and fair mechanism.
*   **Transaction Size and Computation Limits:** All on-chain logic must fit within Cardano's limits. Complex calculations or large data structures can be problematic.
*   **Oracle Dependency:** If token values (other than ADA) or external data for NFT rarity are needed, oracles will be required, introducing centralization points and additional trust assumptions.
*   **Gas Fees:** While eUTXO can be efficient, complex logic will still incur costs. The 1% transaction fee must cover these and generate profit.

---

Next: [04_Security_Considerations.md](./04_Security_Considerations.md)