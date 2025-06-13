# 14. Off-Chain Infrastructure - Oracle Bot & Service Architecture

This document addresses the critical off-chain infrastructure requirements identified by team analysis, focusing on the "Oracle Bot" system and 24/7 service reliability.

## 1. Off-Chain Infrastructure Overview

### **The Reality: Not Everything Can Live On-Chain**
Your team member correctly identified that daily prize distribution requires sophisticated off-chain computation. The blockchain is "blind" to token holdings and cannot efficiently scan all past participants.

### **Core Off-Chain Components:**
1. **Oracle Bot Service** - Daily prize calculation and distribution
2. **Wallet Scanner Service** - Token holder identification
3. **Transaction Monitor** - Real-time game state tracking
4. **API Gateway** - Frontend data provision
5. **Database Layer** - Efficient data storage and querying

## 2. Oracle Bot Architecture

### **Primary Responsibilities:**
```typescript
interface OracleBotService {
  // Daily prize calculation
  scanPastParticipants(): Promise<Address[]>
  checkTokenHoldings(addresses: Address[]): Promise<TokenHolder[]>
  calculateDailyRewards(holders: TokenHolder[]): Promise<RewardDistribution>
  
  // Secure transaction execution
  constructPayoutTransaction(rewards: RewardDistribution): Promise<Transaction>
  submitToBlockchain(tx: Transaction): Promise<TxHash>
  
  // Monitoring and reliability
  healthCheck(): Promise<ServiceStatus>
  recoverFromFailure(): Promise<void>
}
```

### **Security Architecture:**
- **Air-Gapped Key Management:** Private keys stored in hardware security modules
- **Multi-Signature Requirements:** Critical operations require multiple approvals
- **Transaction Verification:** All payouts verified before submission
- **Audit Logging:** Complete transaction history for transparency

## 3. Daily Prize Distribution System

### **Challenge: Scanning All Past Participants**
The team member highlighted this as "massive data queries" - a critical scalability challenge.

### **Optimized Solution:**
```typescript
// Efficient participant tracking
class ParticipantTracker {
  // Incremental updates instead of full scans
  private lastProcessedBlock: number
  private participantCache: Map<Address, ParticipantData>
  
  async updateParticipants(): Promise<void> {
    // Only scan new blocks since last update
    const newBlocks = await getBlocksSince(this.lastProcessedBlock)
    const newParticipants = await extractParticipants(newBlocks)
    
    // Update cache incrementally
    this.updateCache(newParticipants)
    this.lastProcessedBlock = getCurrentBlock()
  }
}
```

### **Token Holdings Verification:**
```typescript
// Batch wallet scanning for efficiency
class TokenHoldingScanner {
  async scanHoldings(addresses: Address[]): Promise<TokenHolder[]> {
    // Batch requests to reduce API calls
    const batches = chunk(addresses, 100)
    const results = await Promise.all(
      batches.map(batch => this.scanBatch(batch))
    )
    
    return results.flat()
  }
  
  private async scanBatch(addresses: Address[]): Promise<TokenHolder[]> {
    // Use Cardano GraphQL for efficient queries
    const query = `
      query GetTokenHoldings($addresses: [String!]!) {
        utxos(where: {address: {_in: $addresses}}) {
          address
          tokens {
            asset {
              policyId
              assetName
            }
            quantity
          }
        }
      }
    `
    
    return await this.graphqlClient.query(query, { addresses })
  }
}
```

## 4. 24/7 Reliability & Monitoring

### **High Availability Architecture:**
- **Load Balancing:** Multiple service instances
- **Failover Systems:** Automatic switching to backup services
- **Health Monitoring:** Continuous service health checks
- **Alert Systems:** Immediate notification of failures

### **Monitoring Dashboard:**
```typescript
interface ServiceMetrics {
  uptime: number              // 99.9% target
  lastSuccessfulPayout: Date  // Must be < 24 hours
  participantScanStatus: 'healthy' | 'delayed' | 'failed'
  blockchainSyncStatus: 'synced' | 'syncing' | 'behind'
  errorRate: number          // < 0.1% target
}
```

### **Disaster Recovery:**
- **Automated Backups:** Daily database and configuration backups
- **Recovery Procedures:** Documented step-by-step recovery process
- **Testing:** Monthly disaster recovery drills

## 5. Security Considerations

### **Oracle Bot Security Model:**
The team member correctly identified this as a "centralized component" requiring special security attention.

#### **Key Security Measures:**
1. **Principle of Least Privilege:** Bot only has permissions for specific operations
2. **Transaction Limits:** Daily/hourly limits on payout amounts
3. **Multi-Factor Authentication:** All administrative access requires MFA
4. **Code Signing:** All deployments cryptographically signed
5. **Network Security:** VPN and firewall protection

#### **Attack Vector Mitigation:**
```typescript
class SecurityLayer {
  // Validate all transactions before submission
  async validateTransaction(tx: Transaction): Promise<boolean> {
    // Check transaction limits
    if (tx.amount > this.dailyLimit) return false
    
    // Verify recipient eligibility
    const isEligible = await this.verifyEligibility(tx.recipient)
    if (!isEligible) return false
    
    // Check for suspicious patterns
    const isSuspicious = await this.detectAnomalies(tx)
    if (isSuspicious) {
      await this.alertAdministrators(tx)
      return false
    }
    
    return true
  }
}
```

## 6. Cost & Operational Considerations

### **Infrastructure Costs:**
- **Server Hosting:** $500-1000/month for high-availability setup
- **Database Services:** $200-500/month for managed database
- **Monitoring Tools:** $100-300/month for comprehensive monitoring
- **Security Services:** $300-600/month for security tools and auditing

### **Ongoing Maintenance:**
- **24/7 Monitoring:** Dedicated DevOps support
- **Regular Updates:** Security patches and feature updates
- **Performance Optimization:** Continuous performance monitoring and tuning

## 7. Integration with Smart Contracts

### **On-Chain/Off-Chain Coordination:**
```aiken
// Smart contract interface for oracle integration
validator daily_prize_oracle {
  spend(datum: OracleDatum, redeemer: OracleRedeemer, context: ScriptContext) {
    // Verify oracle signature
    let oracle_signed = verify_oracle_signature(redeemer.signature, datum.oracle_pubkey)
    
    // Validate payout data
    let valid_recipients = validate_recipients(redeemer.payouts)
    
    // Check timing constraints
    let valid_timing = check_daily_timing(datum.last_payout, context.transaction.validity_range)
    
    oracle_signed && valid_recipients && valid_timing
  }
}
```

## 8. Development Phases

### **Phase 1: Core Oracle Bot (4-6 weeks)**
- Basic participant scanning
- Token holding verification
- Simple payout calculation

### **Phase 2: Security & Reliability (3-4 weeks)**
- Security hardening
- Monitoring implementation
- Disaster recovery setup

### **Phase 3: Optimization & Scaling (2-3 weeks)**
- Performance optimization
- Advanced caching
- Load testing

## 9. Success Metrics

### **Reliability Targets:**
- **Uptime:** 99.9% (8.76 hours downtime/year maximum)
- **Daily Payout Success Rate:** 99.95%
- **Data Accuracy:** 100% (zero tolerance for incorrect payouts)
- **Response Time:** < 5 seconds for API queries

### **Security Metrics:**
- **Zero Security Incidents:** No unauthorized access or fund loss
- **Audit Compliance:** Pass all security audits
- **Incident Response:** < 15 minutes to detect and respond to issues

This off-chain infrastructure is as critical as the smart contracts themselves and requires the same level of professional development and security consideration.
