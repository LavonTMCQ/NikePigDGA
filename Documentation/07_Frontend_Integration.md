# 7. Frontend Integration for NikePig

The frontend of the NikePig dApp is crucial for user experience, providing a clear and engaging interface to interact with the smart contracts. This section outlines how the frontend will connect to and display data from the Cardano blockchain and the NikePig smart contracts.

## 7.1. Core Frontend Requirements (from Project Brief)

The frontend must display:

1.  **Current Main ADA Prize Pool Size:** Real-time update of the total ADA in the main pool.
2.  **72-Hour Countdown Timer:** Clearly visible and updating in real-time.
3.  **Public Leaderboard (Last 100 Depositors):**
    *   Wallet addresses of the last 100 depositors.
    *   Their respective contribution amounts (relevant to their position in the last 100).
    *   The percentage of the prize pool they stand to win if the countdown ended at that moment.

## 7.2. Connecting to Cardano

The frontend will need to interact with the Cardano blockchain. This is typically achieved through:

*   **Wallet Connectors:** Libraries that allow users to connect their Cardano wallets (e.g., Nami, Eternl, Flint, Yoroi) to the dApp. This enables the dApp to:
    *   Read the user's wallet address and ADA balance.
    *   Request transaction signatures from the user for actions like depositing ADA.
*   **Cardano Blockchain Query Layer / APIs:** Services that provide an API to query blockchain data without running a full Cardano node. Examples include:
    *   **Blockfrost.io**
    *   **Koios.rest**
    *   **Dandelion APIs**
    *   Or a self-hosted Cardano DB Sync instance.
    These APIs are used to fetch contract datums, transaction histories, token balances, etc.
*   **JavaScript/TypeScript SDKs:** Libraries like Lucid, Mesh, or the Cardano Serialization Library help in building and serializing transactions, and interacting with smart contract data in a web environment.

## 7.3. Displaying Real-Time Data

*   **Main Prize Pool Size & Countdown Timer:**
    *   The frontend will query the datum of the Main Prize Pool Contract UTXO at regular intervals (e.g., every few seconds or on new block events).
    *   The datum contains `current_prize_pool_ada` and `countdown_end_timestamp`.
    *   The prize pool size is displayed directly.
    *   The frontend calculates the remaining time by subtracting the current browser/client time from `countdown_end_timestamp` and displays it as a live countdown.
        *   **Time Synchronization:** Be mindful of potential discrepancies between client-side time and blockchain slot times. The `countdown_end_timestamp` from the contract is the source of truth.
*   **Leaderboard (Last 100 Depositors):**
    *   The `last_100_depositors` list is also part of the Main Prize Pool Contract's datum.
    *   The frontend fetches this list.
    *   For each entry (wallet address, amount deposited):
        *   Display the wallet address (potentially with an option to show a user-friendly alias if an identity service is integrated, or link to Cardanoscan).
        *   Display their qualifying deposit amount.
        *   Calculate and display their potential win percentage: `(depositor_amount / sum_of_all_100_depositors_amounts) * 100%`.
            *   This calculation needs to be done dynamically on the frontend based on the current state of the `last_100_depositors` list in the datum.

## 7.4. User Interactions

*   **Depositing ADA:**
    1.  User enters the amount of ADA to deposit.
    2.  Frontend constructs a transaction targeting the `DepositADA` redeemer of the Main Prize Pool Contract.
    3.  The transaction will include the ADA to be deposited and any required datum/redeemer information.
    4.  The user signs the transaction using their connected wallet.
    5.  Frontend submits the signed transaction to the network via a connected node or API service.
    6.  Frontend provides feedback on transaction submission and confirmation.
*   **Claiming Main Prize (if applicable via UI):**
    *   If the countdown has ended, a button to `ClaimMainPrize` might be available (though this could also be triggered by a keeper bot).
    *   If triggered by a user, the frontend constructs the transaction with the `ClaimMainPrize` redeemer.
*   **Displaying Daily Prize Information (Optional but good UX):**
    *   Information about recent daily winners.
    *   User's eligibility for token/NFT holder rewards (this would require querying their wallet for past participation and token/NFT holdings).

## 7.5. Technical Stack Considerations for Frontend

*   **Frameworks:** React, Vue, Angular, Svelte are common choices for building dApp frontends.
*   **State Management:** Libraries like Redux, Zustand, or Vuex to manage application state, especially blockchain data that updates frequently.
*   **Real-time Updates:** WebSockets (if supported by the chosen API service) or frequent polling for data like prize pool size and timer.
*   **UI Libraries:** Component libraries (e.g., Material UI, Tailwind CSS) for a well-designed and responsive interface.

## 7.6. Key Frontend Challenges

*   **Data Synchronization:** Ensuring the displayed data is as up-to-date as possible with the blockchain state.
*   **User Experience for Transactions:** Making the process of signing and submitting transactions smooth and understandable.
*   **Error Handling:** Gracefully handling network errors, transaction failures, and wallet connection issues.
*   **Security:** Protecting against common web vulnerabilities (XSS, CSRF) and ensuring secure interaction with user wallets.
    *   Never ask for or store private keys.
    *   Clearly communicate what actions a user is signing.
*   **Displaying Large Lists:** If any lists (e.g., transaction history related to the dApp) become very long, implement pagination or virtual scrolling for performance.

By combining robust wallet integration, efficient data fetching from Cardano APIs, and a clear, reactive UI, the NikePig frontend can provide the engaging experience outlined in the project brief.

---

Next: [08_Compliance_Legal.md](./08_Compliance_Legal.md)