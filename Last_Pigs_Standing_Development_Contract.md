# SMART CONTRACT DEVELOPMENT AGREEMENT
## Last Pigs Standing Decentralized Application

---

**CONTRACT DATE:** June 20, 2025

**PARTIES:**
- **CLIENT:** Dr Caleb L ("Client")
- **DEVELOPER:** $cashcoldgame ("Developer")
- **PROJECT:** Last Pigs Standing dApp Smart Contract Implementation

---

## 1. PROJECT OVERVIEW

### 1.1 Project Description
This Agreement governs the development of smart contracts for the "Last Pigs Standing" decentralized application (formerly "NikePig"), an experimental decentralized contribution and ranking game on the Cardano blockchain featuring innovative Reset Killer mechanics and transparent prize distribution systems.

### 1.2 Project Repository
**GitHub Repository:** https://github.com/LavonTMCQ/NikePigDGA.git
**Documentation:** 17+ comprehensive technical specification files located in `/Documentation/` folder
**Development Environment:** Aiken v1.1.7 smart contract language on Cardano blockchain

### 1.3 Project Status
- **Phase 1:** Foundation & Documentation (100% COMPLETE)
- **Phase 2:** Development Environment Setup (100% COMPLETE)  
- **Phase 3:** Smart Contract Implementation (CURRENT - Subject of this Agreement)

---

## 2. SCOPE OF WORK

### 2.1 Smart Contract Components
Developer agrees to implement the following six (6) core smart contract components:

#### 2.1.1 Main Prize Pool Contract
- 72-hour countdown timer with reset functionality
- **Reset Killer Mechanic™** - Timer decreases by 1 second per deposit during special periods
- Last 100 contributors tracking with high-precision timestamps (millisecond accuracy)
- Prize pool management and winner determination logic
- Integration with all other contract components

#### 2.1.2 Daily Prize Contract  
- Daily community participation incentive distribution
- Token holder reward calculations ($NIKEPIG, $MISTER)
- NFT holder reward calculations (Nikeverse, Mister NFTs)
- Random winner selection with weighted contribution activity

#### 2.1.3 Reset Killer Scheduler Contract
- Automated Reset Killer event scheduling (1 month after launch, then every 6 months)
- Reset Killer activation and deactivation logic
- Timer modification controls during Reset Killer periods

#### 2.1.4 Token Integration Contracts
- Integration with existing $NIKEPIG tokens (already minted on blockchain)
- Integration with existing $MISTER tokens (already minted on blockchain)
- Smart contract logic for token holder identification and reward calculations
- Token balance verification and distribution mechanisms

#### 2.1.5 NFT Integration Contracts
- Integration with existing Nikeverse NFT collection (already minted on blockchain)
- Integration with existing Mister NFT collection (already minted on blockchain)
- Smart contract logic for NFT holder identification and reward calculations
- NFT ownership verification and rarity-based distribution mechanisms

#### 2.1.6 Treasury/Fee Contract
- 1% transaction fee collection and management
- 5% team cut collection from prize pools
- Revenue distribution mechanism to Client (Dr Caleb L)
- Transparent fund management and withdrawal controls

### 2.2 Technical Requirements
- **Programming Language:** Aiken v1.1.7
- **Blockchain:** Cardano (Plutus v3)
- **Architecture:** Implementation of all solutions documented in `/Documentation/13_Architecture_Solutions.md`
- **Token Integration:** Smart contract integration with existing $NIKEPIG and $MISTER tokens on Cardano blockchain
- **NFT Integration:** Smart contract integration with existing Nikeverse and Mister NFT collections on Cardano blockchain
- **Scalability:** Implementation of linked UTXO chains, Merkle proof systems, and batch processing
- **Security:** Implementation of commit-reveal randomness and comprehensive validation logic
- **Testing:** Comprehensive unit tests and integration tests for all components

### 2.3 Documentation Requirements
- Complete code documentation with inline comments
- Deployment scripts and instructions
- Testing documentation and results
- Security audit preparation materials
- User interaction guides and API documentation

---

## 3. PAYMENT TERMS

### 3.1 Total Contract Value
**TOTAL COMPENSATION:** Eight Thousand Dollars ($8,000.00 USD)

### 3.2 Payment Schedule
Payment shall be made in four (4) equal installments of Two Thousand Dollars ($2,000.00 USD) each, contingent upon completion and Client approval of the following milestones:

#### 3.2.1 Milestone 1 Payment ($2,000.00)
**DUE:** Upon contract execution and commencement of work
**DELIVERABLES:**
- Signed development contract
- Comprehensive architecture review and written approval
- Detailed implementation plan for Reset Killer mechanic
- Team alignment confirmation on all technical requirements
- Project timeline confirmation

#### 3.2.2 Milestone 2 Payment ($2,000.00)  
**DUE:** Completion of Start Date deliverables
**DELIVERABLES:**
- Main Prize Pool Contract with Reset Killer mechanic (complete implementation)
- Daily Prize Contract (complete implementation)
- Reset Killer Scheduler Contract (complete implementation)
- Comprehensive unit tests for all implemented contracts
- Code review completion and approval
- Documentation for implemented components

#### 3.2.3 Milestone 3 Payment ($2,000.00)
**DUE:** Completion of Week 4 deliverables
**DELIVERABLES:**
- Token Integration Contracts ($NIKEPIG, $MISTER) - complete implementation
- NFT Integration Contracts (Nikeverse, Mister NFTs) - complete implementation
- Treasury/Fee Contract - complete implementation
- Complete testnet deployment of all contracts
- Integration testing completion and results documentation
- Security testing completion and results documentation
- Performance validation and optimization
- Testnet user acceptance testing completion

#### 3.2.4 Milestone 4 Payment ($2,000.00)
**DUE:** Completion of Week 6 deliverables
**DELIVERABLES:**
- Mainnet-ready smart contracts (all 6 components)
- Complete deployment documentation and scripts
- Security audit preparation package
- Final comprehensive code review and approval
- Complete testing suite with documentation
- Team handover documentation and training
- All source code and intellectual property transfer

### 3.3 Payment Method
Payments shall be made via [USDM] within five (3) business days of milestone completion and Client approval.

---

## 4. PROJECT TIMELINE

### 4.1 Development Schedule
**TOTAL DURATION:** Six (6) weeks from contract execution, or upon completion of all deliverables, whichever occurs first
**START DATE:** Contract signing date: contract execution date, 2025
**COMPLETION DATE:** Six (6) weeks after start date OR when all parties agree Milestone 4 deliverables are complete: delivery date, 2025

### 4.2 Milestone Timeline
- **Week 1:** Milestone 1 - Architecture Review & Planning
- **Week 2:** Milestone 2 - Core Contract Implementation  
- **Week 4:** Milestone 3 - Complete Implementation & Testnet Deployment
- **Week 6:** Milestone 4 - Mainnet-Ready Delivery & Final Documentation

### 4.3 "Measure Twice, Cut Once" Protocol
Given the immutable nature of blockchain smart contracts, both parties acknowledge and agree to the following protocol:

#### 4.3.1 Pre-Implementation Approval
- All architectural decisions must receive written Client approval before implementation
- No coding shall commence until comprehensive planning phase is complete and approved
- All technical specifications must be finalized and approved at Milestone 1

#### 4.3.2 No Major Revisions Policy  
- Once a milestone is approved and payment is made, no major architectural changes will be accepted
- Minor bug fixes and optimizations are acceptable and included in scope
- Any requested changes beyond minor fixes will require a separate contract amendment
- This policy protects both parties from scope creep and ensures project completion within timeline

#### 4.3.3 Approval Process
- Each milestone requires written approval from Client before proceeding to next phase
- Client has five (5) business days to review and approve each milestone
- Failure to respond within review period constitutes approval
- All approvals must reference specific deliverables and acceptance criteria

---

## 5. TECHNICAL SPECIFICATIONS

### 5.1 Reference Documentation
All development shall be conducted in accordance with the comprehensive technical specifications contained in the project's documentation system, including but not limited to:

- `/Documentation/03_NikePig_Architecture.md` - Core system architecture
- `/Documentation/13_Architecture_Solutions.md` - Scalability and technical solutions
- `/Documentation/16_Project_Updates_June_2025.md` - Latest project requirements
- `/Documentation/17_UX_UI_Specifications.md` - Frontend integration requirements
- All additional documentation files in the `/Documentation/` folder (17+ files total)

### 5.2 Quality Standards
- All code must follow Aiken best practices and style guidelines
- Comprehensive error handling and validation must be implemented
- All functions must include appropriate documentation and comments
- Code must pass all automated tests before milestone approval
- Security considerations must be implemented according to documented specifications

### 5.3 Repository Management
- All development work shall be conducted in feature branches
- Regular commits with meaningful commit messages are required
- All code changes require review and approval before merging
- Final code delivery includes complete Git history and documentation

### 5.4 Integration Requirements
- Smart contracts must integrate with existing token infrastructure rather than creating new tokens
- All token and NFT references must utilize existing on-chain assets
- Integration logic must support existing tokenomics and distribution mechanisms
- Compatibility with existing token holder and NFT holder identification systems

---

## 6. INTELLECTUAL PROPERTY RIGHTS

### 6.1 Work Product Ownership
Upon final payment of all milestone payments, all right, title, and interest in and to the smart contracts, documentation, and related work product developed under this Agreement shall transfer to and vest in Client.

### 6.2 Open Source Commitment
Client intends to release the smart contracts as open source software. Developer agrees to this open source release and waives any claims that might prevent such release.

### 6.3 Developer Portfolio Rights
Developer retains the right to reference this project in professional portfolio and marketing materials, provided no confidential information is disclosed.

---

## 7. WARRANTIES AND REPRESENTATIONS

### 7.1 Developer Warranties
Developer represents and warrants that:
- Developer has the necessary skills and experience to complete the work
- All work will be performed in a professional and workmanlike manner
- All work will be original and will not infringe upon any third-party rights
- Developer will comply with all applicable laws and regulations

### 7.2 Client Warranties  
Client represents and warrants that:
- Client has the authority to enter into this Agreement
- Client will provide timely feedback and approvals as required
- Client will make payments according to the agreed schedule
- Client has reviewed and approved all technical specifications

---

## 8. LIMITATION OF LIABILITY

### 8.1 Liability Cap
DEVELOPER'S TOTAL LIABILITY ARISING OUT OF OR RELATED TO THIS AGREEMENT SHALL NOT EXCEED THE TOTAL AMOUNT PAID BY CLIENT UNDER THIS AGREEMENT.

### 8.2 Consequential Damages
IN NO EVENT SHALL EITHER PARTY BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES, INCLUDING BUT NOT LIMITED TO LOSS OF PROFITS, DATA, OR USE, REGARDLESS OF THE THEORY OF LIABILITY.

### 8.3 Blockchain Risks
Client acknowledges that blockchain technology involves inherent risks, including but not limited to smart contract vulnerabilities, network congestion, and regulatory changes. Developer is not liable for losses resulting from these inherent blockchain risks.

---

## 9. TERMINATION

### 9.1 Termination for Convenience
Either party may terminate this Agreement with thirty (30) days written notice. Upon termination, Client shall pay for all work completed and approved up to the termination date.

### 9.2 Termination for Cause
Either party may terminate immediately upon written notice if the other party materially breaches this Agreement and fails to cure such breach within ten (10) days of written notice.

### 9.3 Effect of Termination
Upon termination, Developer shall deliver all completed work product to Client, and Client shall pay for all work completed and approved up to the termination date.

---

## 10. DISPUTE RESOLUTION

### 10.1 Governing Law
This Agreement shall be governed by and construed in accordance with the laws of the Commonwealth of Pennsylvania, with jurisdiction in Philadelphia, Pennsylvania.

### 10.2 Dispute Resolution Process
Any disputes arising under this Agreement shall be resolved through the following process:
1. Good faith negotiation between the parties
2. Mediation by a mutually agreed mediator
3. Binding arbitration if mediation fails
4. Court proceedings only as a last resort

---

## 11. GENERAL PROVISIONS

### 11.1 Entire Agreement
This Agreement constitutes the entire agreement between the parties and supersedes all prior negotiations, representations, or agreements relating to the subject matter.

### 11.2 Amendments
This Agreement may only be amended by written agreement signed by all parties.

### 11.3 Severability
If any provision of this Agreement is held invalid or unenforceable, the remainder shall continue in full force and effect.

### 11.4 Force Majeure
Neither party shall be liable for delays or failures in performance resulting from circumstances beyond their reasonable control.

---

## 12. EXECUTION

### 12.1 Counterparts
This Agreement may be executed in counterparts, including electronic signatures, each of which shall be deemed an original.

### 12.2 Effective Date
This Agreement becomes effective upon execution by all parties.

---

## SIGNATURE BLOCKS

**CLIENT:**

**Dr Caleb L**

Signature: _________________________________

Print Name: Dr Caleb L

Date: _____________________________________


**DEVELOPER:**

**$cashcoldgame**

Signature: _________________________________

Print Name: $cashcoldgame

Date: _____________________________________

---

**CONTRACT EXECUTION DATE:** _____________________

**PROJECT COMMENCEMENT DATE:** _____________________

---

*This Agreement has been reviewed and approved by all parties. By signing below, the parties agree to be bound by all terms and conditions set forth herein.*
