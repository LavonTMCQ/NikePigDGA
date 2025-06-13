# 12. NikePig dApp Development Environment Setup

This document outlines the recommended setup for developing the NikePig dApp, focusing on Cardano smart contract development with Aiken, and considerations for interacting with the Cardano network.

## 1. Core Philosophy: Local-First Development & Testing

While services like Blockfrost and public API endpoints (like the one you mentioned: `http://95.217.227.244:8051/rpc/address_txs`) are excellent for querying blockchain data and submitting transactions from a live application (frontend/backend), they are not ideal as the primary interface during the core smart contract development and iterative testing phases.

For robust smart contract development with Aiken, a local or dedicated test environment offers significant advantages:

*   **Control:** Full control over the network state, allowing for repeatable tests and specific scenario simulations.
*   **Speed:** Faster deployment and testing cycles without network latency or external service dependencies.
*   **Cost-Effectiveness:** No transaction fees during development and testing on a local or private testnet.
*   **Debugging:** Easier to inspect contract state and transaction details directly.

Therefore, this guide will focus on setting up an environment conducive to Aiken smart contract development, while acknowledging the role of services like Blockfrost for later stages (frontend integration, off-chain components).

## 2. Cardano Node Options

While you *can* interact with the Cardano network without running your own full node by using services like Blockfrost, for smart contract development and thorough testing, having access to a node environment is highly beneficial.

*   **Option A: Full Cardano Node (Recommended for advanced users/specific needs)**
    *   **Pros:** Complete control, access to all CLI functionalities, ability to participate in the network.
    *   **Cons:** Resource-intensive (disk space, bandwidth, RAM), longer sync times.
    *   **Setup:** Involves downloading, compiling, and configuring the `cardano-node` and `cardano-cli`. (Detailed steps can be found in official Cardano documentation).

*   **Option B: Cardano Testnet / Local Development Cluster (Recommended for most developers)**
    *   **`cardano-wallet` + `cardano-node` on Testnet:** Connect to the public Cardano testnet. This allows you to test with realistic network conditions and use testnet ADA.
    *   **Demeter.run / Similar PaaS:** Platforms like Demeter.run offer managed Cardano nodes (including testnet access) and development environments, which can significantly simplify setup.
    *   **Local Private Testnet (using `cardano-cli`):** For maximum control and speed during initial development, you can set up a local private testnet. This is excellent for rapid iteration with Aiken.

*   **Option C: Using Blockfrost or other API Services (Primarily for Off-Chain/Frontend)**
    *   **Blockfrost.io:** A popular API service providing access to Cardano blockchain data and transaction submission capabilities.
        *   **Pros:** No need to run a node, easy to integrate, good for querying data for UIs.
        *   **Cons:** Rate limits, potential costs, less control for deep smart contract debugging, not a replacement for a development/testing node environment for contract compilation and initial deployment testing.
    *   **Public Endpoints (e.g., `http://95.217.227.244:8051/rpc/address_txs`):** These can be useful for quick queries but come with caveats:
        *   **Reliability & Availability:** Public nodes may not always be available or performant.
        *   **Trust:** You are trusting a third-party provider.
        *   **Functionality:** May not expose all necessary endpoints for comprehensive dApp interaction or development tooling.

**Conclusion on Nodes:** For Aiken smart contract development, aim to use a local development cluster or a dedicated testnet node. Blockfrost will be invaluable for your frontend to query blockchain state and submit transactions once contracts are deployed.

## 3. Aiken Language & Toolkit Setup

Aiken is designed for a streamlined developer experience. (Refer to `02_Smart_Contract_Development.md` for more on Aiken).

*   **3.1. Install Aiken:**
    *   Follow the official Aiken installation guide: [https://aiken-lang.org/installation-guide](https://aiken-lang.org/installation-guide)
    *   This typically involves downloading a precompiled binary or building from source.
    *   Verify installation: `aiken -V`

*   **3.2. Project Setup with Aiken:**
    *   Create a new Aiken project: `aiken new my_nikepig_project`
    *   This will scaffold a new project with a standard directory structure:
        *   `aiken.toml`: Project configuration file.
        *   `lib/`: For your Aiken source code (`.ak` files).
        *   `validators/`: Where your Plutus validator scripts will be defined.
        *   `test/`: For your Aiken test files.

*   **3.3. Key Aiken Commands:**
    *   `aiken build`: Compiles your Aiken code and generates the UPLC for your validators.
    *   `aiken test`: Runs your test suite.
    *   `aiken check`: Type-checks your project without building.
    *   `aiken docs`: Generates documentation for your project.

*   **3.4. Editor/IDE Integration:**
    *   Aiken has Language Server Protocol (LSP) support.
    *   Look for Aiken extensions for your preferred editor (e.g., VS Code) to get features like syntax highlighting, autocompletion, and error checking.

## 4. Version Control: Git & GitHub/GitLab

*   **4.1. Initialize Git Repository:**
    *   Navigate to your project directory: `cd my_nikepig_project`
    *   Initialize Git: `git init`
*   **4.2. Create a `.gitignore` file:**
    *   Add build artifacts and environment-specific files (e.g., `artifacts/`, `*.uplc`, potentially IDE configuration files).
    *   Example `.gitignore` for Aiken:
        ```
        # Aiken build artifacts
        /artifacts/
        *.uplc

        # OS-specific
        .DS_Store
        Thumbs.db

        # IDE specific
        .vscode/
        # Add other IDE specific files if needed
        ```
*   **4.3. Remote Repository:**
    *   Create a repository on GitHub, GitLab, or a similar platform.
    *   Link your local repository to the remote and push your initial commit.

## 5. Essential Cardano Tools

*   **5.1. `cardano-cli` (Cardano Command Line Interface):**
    *   Essential for interacting with the Cardano blockchain, building transactions, querying addresses, managing keys, and deploying scripts.
    *   Installation is usually part of the `cardano-node` setup. Ensure it's in your PATH.

*   **5.2. Wallet Software (for testing and interaction):**
    *   **Nami, Eternl, Flint, Yoroi, etc.:** Browser-based or desktop wallets.
    *   Useful for managing keys, signing transactions, and interacting with dApps on testnet/mainnet.
    *   Ensure you have wallets configured for the testnet you'll be using.

## 6. Off-Chain Code Environment (JavaScript/TypeScript Recommended)

While Aiken handles on-chain logic, you'll need an environment for off-chain code (building transactions, interacting with wallets, frontend logic).

*   **6.1. Node.js and npm/yarn:**
    *   Install Node.js (LTS version recommended) and a package manager (npm or yarn).
*   **6.2. Cardano Serialization Library (CSL) or SDKs:**
    *   **CSL (@emurgo/cardano-serialization-lib-nodejs / @emurgo/cardano-serialization-lib-browser):** Core library for building transactions and working with Cardano data structures in JavaScript/TypeScript.
    *   **Lucid, MeshJS, etc.:** Higher-level SDKs that simplify dApp development by providing abstractions over CSL and wallet interactions.
        *   **Lucid:** Popular for its ease of use and comprehensive features.
        *   **MeshJS:** Provides tools and UI components for building Cardano dApps.
    *   Choose one based on your project's needs and team familiarity.

## Next Steps

With this environment set up, you can begin:
1.  Writing your Aiken smart contracts in the `validators/` directory.
2.  Writing tests for your contracts in the `test/` directory.
3.  Using `aiken build` to compile your contracts to UPLC.
4.  Using `cardano-cli` (or SDKs) to deploy and interact with your contracts on a local testnet or the public testnet.

This setup provides a solid foundation for developing, testing, and eventually deploying the NikePig dApp. Remember to consult the official documentation for Aiken, Cardano, and any chosen SDKs for the most up-to-date information.