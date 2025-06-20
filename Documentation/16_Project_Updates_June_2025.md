# 16. Project Updates - June 2025

**📅 Update Date:** June 15-17, 2025  
**🎯 Status:** Critical Feature Additions & Refinements  
**📋 Priority:** HIGH - Requires immediate integration into development plan

## 1. Major Project Changes

### **🏷️ Official Name Change**
- **Previous:** NikePig dApp
- **Current:** **Last Pigs Standing**
- **Impact:** All documentation, contracts, and branding must be updated

### **⚡ New Core Feature: Reset Killer Mechanic**

#### **Purpose:**
Ensures the prize pool eventually pays out, creating predictable hype cycles and preventing indefinite accumulation.

#### **Mechanism:**
- **Normal Operation:** 72-hour timer resets to full 72 hours with each deposit
- **Reset Killer Active:** Each new deposit resets timer to **1 second less** than previous reset
- **Result:** Timer rapidly diminishes, making payout almost inevitable

#### **Schedule:**
- **First Reset Killer:** 1 month after launch
- **Subsequent Reset Killers:** Every 6 months thereafter
- **UI Requirement:** Persistent countdown showing time until next Reset Killer

#### **Smart Contract Impact:**
```aiken
// New datum fields required
type MainPoolDatum {
  // ... existing fields
  reset_killer_active: Bool,
  reset_killer_next_timestamp: Int,
  current_reset_duration: Int,  // Decreases by 1 second each deposit during Reset Killer
}
```

## 2. Enhanced UI/UX Requirements

### **🎯 Main Landing Page Focus**
- **Primary Focus:** Large, impactful visualization of Main Prize Pool only
- **Rationale:** Avoid user confusion about deposit destination
- **Secondary Pools:** Accessible via "Stats and Daily Raffle" button/page

### **⏱️ High-Precision Timestamps**
- **Requirement:** All deposit history must show timestamps with **fractions of a second**
- **Location:** "Last 100 Deposits" table and all transaction displays
- **Technical Need:** Critical for determining exact deposit order

### **📊 New Required Sections**
1. **Payout History Page:** Build user trust with transparent payout records
2. **Stats and Daily Raffle Page:** Display smaller pool sizes (Daily, Token, NFT pools)
3. **Enhanced FAQ Section:** Specific Q&A content (see Section 3)

### **🎨 Visual Design References**
Located in `/Documentation/ux-ui-examples/`:
- `ui.png` - Main interface design
- `ux.png` - User experience flow
- `last100.png` - Last 100 deposits table design
- `playbutton.webp` - Action button styling
- `info.webp` - Information display styling

## 3. Required Content Sections

### **❓ FAQ Section (Bottom of Main Page)**

**Q: Are there refunds?**
A: No, your contributions are swallowed up into the void and there is no reversing it.

**Q: Who built Last Pigs Standing?**
A: NikePig and Mister teams.

**Q: Does the Last Pigs Standing have a maximum lifespan?**
A: No, it will continue until either no deposit is made in 72 hours, or a Reset Killer is reached.

**Q: What happens during a Reset Killer?**
A: Each deposit resets the timer to 1 second less.

**Q: When are Reset Killers scheduled?**
A: At 1 month after launch, and then 6 monthly after.

### **⚠️ Critical User Warning**
**Prominent Display Required:**
> "Do NOT use a CEX (Centralized Exchange) to deposit your funds (because the payout will go to the CEX wallet that deposited, and not your own CEX receiving wallet)."

### **📄 "About Last Pigs Standing" Page**

#### **Legal Positioning Strategy:**
- **Frame as:** "Experimental decentralized contribution and ranking game"
- **NOT gambling:** Winner is "last 100 contributors," not "top 100"
- **Transparency:** All logic is on-chain and publicly auditable

#### **Daily Prizes Terminology:**
**Use:** "Daily reward draw weighted by contribution activity"
**Avoid:** "Lottery," "raffle," or gambling terms

**Official Language:**
> "Community Participation Incentives: In addition to the core ranking-based distribution mechanism, Last Pigs Standing includes daily community participation incentives... These incentives allocate small portions of daily contributions across multiple community-driven reward streams, which include: Proportional distributions to token holders, NFT-based community loyalty rewards, and Daily reward draws weighted by contribution activity..."

## 4. Technical Implementation Requirements

### **🔧 Smart Contract Updates Needed**

#### **Main Prize Pool Contract:**
1. Add Reset Killer state management
2. Implement decreasing timer logic during Reset Killer periods
3. Add Reset Killer scheduling mechanism
4. High-precision timestamp storage

#### **New Validator Logic:**
```aiken
// Reset Killer validation
fn validate_reset_killer_deposit(datum: MainPoolDatum, new_timer: Int) -> Bool {
  if datum.reset_killer_active {
    // Timer must be 1 second less than previous
    new_timer == datum.current_reset_duration - 1
  } else {
    // Normal 72-hour reset
    new_timer == 259200  // 72 hours in seconds
  }
}
```

### **📱 Frontend Requirements**
1. **Reset Killer Countdown:** Persistent display of next Reset Killer
2. **High-Precision Timestamps:** Millisecond accuracy in all displays
3. **Pool Visualization:** Focus on main pool, secondary stats page
4. **Payout History:** Complete historical payout records
5. **Legal Content:** FAQ, warnings, and about page integration

## 5. Development Impact Assessment

### **🎯 Priority Changes**
1. **HIGH:** Reset Killer mechanism implementation
2. **HIGH:** UI/UX updates for new requirements
3. **MEDIUM:** Legal content integration
4. **MEDIUM:** Enhanced timestamp precision

### **📊 Estimated Additional Development Time**
- **Smart Contract Updates:** +1-2 weeks
- **Frontend Enhancements:** +2-3 weeks
- **Testing & Integration:** +1 week
- **Total Additional:** +4-6 weeks

### **💰 Cost Impact**
- **Additional Development:** Within scope of original $8K (architectural changes only)
- **No additional fees** for feature refinements during planning phase

## 6. Next Steps

### **✅ Immediate Actions Required**
1. Update all documentation with "Last Pigs Standing" name
2. Integrate Reset Killer into smart contract architecture
3. Update UI/UX specifications with new requirements
4. Incorporate legal positioning into compliance documentation

### **📋 Updated Development Checklist**
- [ ] Update project name throughout all files
- [ ] Implement Reset Killer smart contract logic
- [ ] Design high-precision timestamp system
- [ ] Create enhanced UI mockups based on provided examples
- [ ] Draft legal content for About page
- [ ] Update FAQ section with new content
- [ ] Test Reset Killer mechanism on testnet

**🚀 PROJECT STATUS: Enhanced and ready for Phase 3 implementation with refined requirements**
