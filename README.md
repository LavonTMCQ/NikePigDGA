# NikePig dApp - Perpetual High-Stakes Lottery on Cardano

![Cardano](https://img.shields.io/badge/Cardano-0033AD?style=for-the-badge&logo=cardano&logoColor=white)
![Aiken](https://img.shields.io/badge/Aiken-v1.1.7-blue?style=for-the-badge)
![Plutus](https://img.shields.io/badge/Plutus-v3-green?style=for-the-badge)

## 🎲 Project Overview

NikePig is a perpetual, high-stakes lottery dApp on the Cardano blockchain featuring:

- **72-hour countdown timer** that resets with each deposit
- **Last 100 depositors** share the prize pool when timer expires
- **Daily rewards** for token holders ($NIKEPIG, $MISTER) and NFT holders
- **Built using Aiken** smart contract language for modern development

## 🏗️ Architecture

### Core Components
1. **Main Prize Pool Contract** - 72-hour timer, winner determination
2. **Daily Prize Contract** - Token/NFT holder rewards
3. **Token Minting Policies** - $NIKEPIG, $MISTER tokens
4. **NFT Minting Policies** - Nikeverse, Mister NFTs
5. **Treasury/Fee Contract** - Revenue management

### ✅ Solved Scalability Challenges
- **Depositor List Scalability** → Linked UTXO chain solution
- **Past Participants Scalability** → Opt-in claim system with Merkle proofs
- **On-chain Randomness** → Commit-reveal with block hash entropy
- **Transaction Size Limits** → Batch processing optimization

## 📁 Repository Structure

```
NikePigDGA/
├── Documentation/           # Comprehensive knowledge base (14 files)
│   ├── README.md           # Project overview and navigation
│   ├── 13_Architecture_Solutions.md  # Critical scalability solutions
│   └── ...                 # Complete documentation system
├── contracts/              # Aiken smart contract project
│   ├── aiken.toml         # Project configuration
│   ├── validators/        # Smart contract validators
│   ├── lib/              # Core Aiken source code
│   └── plutus.json       # Generated blueprint
└── README.md              # This file
```

## 🚀 Development Status

### ✅ Phase 1: Foundation & Documentation (COMPLETED)
- Comprehensive 14-file knowledge base
- Architecture challenges identified and solved
- Smart contract language chosen: **Aiken**

### ✅ Phase 2: Development Environment (COMPLETED)
- Aiken v1.1.7 installed and verified
- NikePig project structure created
- Test validator compiled successfully
- Git repository initialized

### 🎯 Phase 3: Smart Contract Implementation (READY)
- Implementation of architectural solutions
- Core contract development
- Testing and optimization

## 🛠️ Development Setup

### Prerequisites
- [Aiken v1.1.7+](https://aiken-lang.org/installation-guide)
- Git
- Cardano CLI (optional, for testnet deployment)

### Quick Start
```bash
# Clone the repository
git clone https://github.com/LavonTMCQ/NikePigDGA.git
cd NikePigDGA

# Navigate to contracts
cd contracts

# Check compilation
aiken check

# Build contracts
aiken build
```

## 📚 Documentation

Complete documentation is available in the `/Documentation/` folder:

- **[Architecture Solutions](Documentation/13_Architecture_Solutions.md)** - Scalability solutions
- **[Development Checklist](Documentation/11_Development_Checklist.md)** - Comprehensive roadmap
- **[Security Considerations](Documentation/04_Security_Considerations.md)** - Security best practices

## 💰 Revenue Model

- **1% transaction fee** per deposit
- **5% team cut** from prize pool when claimed
- **50/50 split** between Dr Caleb L and $cashcoldgame

## 🔒 Security

- **Formal Security Audit** by Anastasia Labs (planned)
- **Open Source** smart contracts for transparency
- **Battle-tested** architectural patterns

## 🤝 Team Collaboration

### Contributing
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

### Code Review Process
- All smart contract changes require review
- Reference `/Documentation/` for architectural guidance
- Maintain professional standards

## 📞 Contact

- **Repository:** https://github.com/LavonTMCQ/NikePigDGA.git
- **Team:** Dr Caleb L, $cashcoldgame
- **Development:** Professional Aiken smart contract development

## 📄 License

Apache-2.0 License - See project configuration for details.

---

**Built with ❤️ on Cardano using Aiken**
