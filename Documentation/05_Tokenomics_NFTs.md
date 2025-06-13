# 5. Tokenomics and NFTs in NikePig

The NikePig dApp incorporates two fungible tokens ($NIKEPIG, $MISTER) and two NFT collections (Nikeverse, Mister NFTs) as integral parts of its daily reward system. This section details their proposed tokenomics, minting, and utility within the Cardano ecosystem.

## 5.1. Fungible Tokens: $NIKEPIG and $MISTER

These tokens are primarily used to reward past participants of the NikePig game.

*   **Purpose:** To incentivize long-term engagement and reward community members who have previously participated in the main prize pool.
*   **Utility:** Holding $NIKEPIG or $MISTER tokens makes past participants eligible for a share of 10% of the daily ADA contributions to the NikePig pool. The payout is proportional to the combined value of their holdings.
*   **Asset Type:** Cardano Native Tokens. <mcreference link="https://docs.cardano.org/native-tokens/learn/" index="2">2</mcreference>

### 5.1.1. Minting Policy

*   Separate minting policies will be created for $NIKEPIG and $MISTER. <mcreference link="https://docs.cardano.org/native-tokens/learn/" index="2">2</mcreference>
*   **Control:** The minting policy script will define who has the authority to mint new tokens (e.g., a team-controlled multi-sig wallet or a specific address).
*   **Supply:** The total supply and initial distribution strategy need to be defined:
    *   **Fixed Supply:** A predetermined maximum number of tokens is minted at once or over time.
    *   **Dynamic Supply:** Tokens could be minted based on certain game events or milestones (more complex and requires careful economic modeling).
    *   **Initial Distribution:** How will the tokens initially enter circulation? Airdrops to early users? Sold? Earned through other activities?
*   **Burning:** The policy should also define if and how tokens can be burned.

### 5.1.2. Distribution for Daily Rewards

*   **Eligibility:** Users must have deposited into the main NikePig pool at least once in the past.
*   **Mechanism:** The Daily Prize Contract will need to:
    1.  Identify wallets of past participants.
    2.  Query the $NIKEPIG and $MISTER balances of these wallets.
    3.  Calculate the "combined value" of holdings. This is a critical point:
        *   If values are pegged to ADA, the calculation is straightforward.
        *   If tokens have floating market values, an oracle would be needed to determine their current price in ADA for fair proportional distribution, adding complexity and a point of centralization/trust.
        *   Alternatively, a predefined weighting system could be used (e.g., 1 $NIKEPIG = X ADA value, 1 $MISTER = Y ADA value for reward calculation purposes).
    4.  Distribute 10% of the daily ADA contributions proportionally.

### 5.1.3. Tokenomic Considerations

*   **Inflation/Deflation:** The minting/burning mechanism will determine if the tokens are inflationary or deflationary.
*   **Value Accrual:** The primary value driver for these tokens is their ability to earn a share of the daily ADA rewards. The attractiveness of holding them will depend on the activity of the NikePig game.
*   **Liquidity:** Will there be liquidity pools on Cardano DEXs for these tokens? This would affect their market value if one is intended beyond the internal reward calculation.

## 5.2. Non-Fungible Tokens (NFTs): Nikeverse and Mister NFTs

These NFT collections also serve to reward past participants.

*   **Purpose:** Similar to the fungible tokens, to incentivize long-term engagement and reward community members who own specific NFTs and have participated in the main prize pool.
*   **Utility:** Holding Nikeverse or Mister NFTs makes past participants eligible for a share of 1% of the daily ADA contributions. Distribution is weighted based on NFT rarity tiers.
*   **Asset Type:** Cardano Native Tokens (specifically, non-fungible tokens). <mcreference link="https://docs.cardano.org/native-tokens/learn/" index="2">2</mcreference>

### 5.2.1. Minting Policy

*   Separate minting policies will be created for the Nikeverse NFT collection and the Mister NFT collection. <mcreference link="https://docs.cardano.org/native-tokens/learn/" index="2">2</mcreference>
*   **Control:** The policy will define minting authority.
*   **Supply & Rarity:**
    *   Each collection will have a defined number of NFTs.
    *   Rarity tiers must be established (e.g., Common, Uncommon, Rare, Legendary).
    *   The minting policy or associated metadata must clearly define the rarity of each NFT.
    *   **Enforcing Rarity On-Chain:** This can be done by minting specific asset names with metadata indicating rarity, or by having the minting script itself assign rarity based on some logic (more complex).
*   **Metadata:** NFT metadata (name, image, attributes, rarity tier) will be stored, typically using IPFS for images/media and on-chain for essential traits or pointers.

### 5.2.2. Distribution for Daily Rewards

*   **Eligibility:** Users must have deposited into the main NikePig pool at least once in the past and hold one or more relevant NFTs.
*   **Mechanism:** The Daily Prize Contract will need to:
    1.  Identify wallets of past participants.
    2.  Query which Nikeverse and Mister NFTs these wallets hold.
    3.  Determine the rarity tier of each held NFT.
    4.  Distribute 1% of the daily ADA contributions, weighted by rarity. A clear weighting scheme is needed (e.g., Legendary NFT = 10 points, Rare = 5 points, etc., then distribute ADA based on total points per user).

### 5.2.3. NFT Considerations

*   **Initial Sale/Distribution:** How will these NFTs be initially distributed? Sold in a public mint? Airdropped? Rewarded for specific actions?
*   **Marketplace Integration:** They should be standard Cardano NFTs, tradable on marketplaces like JPG.store, CNFT.io, etc.
*   **Art and Theme:** The visual design and thematic concept of Nikeverse and Mister NFTs will be important for their appeal.

## 5.3. General Considerations for Token/NFT Rewards

*   **Scalability of Holder Identification:** As mentioned in the architecture section, identifying all past participants and their token/NFT holdings for daily rewards is a significant on-chain challenge. Solutions might include:
    *   **Off-chain computation with on-chain claims:** Users meeting criteria claim their daily share.
    *   **Snapshot-based distribution:** Periodic off-chain snapshots determine eligibility, with rewards airdropped (can be costly).
    *   **Staking contracts:** Users could optionally stake their $NIKEPIG/$MISTER tokens or NFTs in a separate contract to register for daily rewards, simplifying the identification process for the Daily Prize Contract.
*   **Clarity for Users:** The rules for eligibility and how rewards are calculated must be extremely clear to users.
*   **ADA as the Reward:** The fact that rewards are paid in ADA (a liquid and valuable asset) is a strong incentive.

---

Next: [06_Scalability_Performance.md](./06_Scalability_Performance.md)