# 17. UX/UI Specifications - Last Pigs Standing

**📱 Frontend Design Requirements**  
**🎨 Visual References:** `/Documentation/ux-ui-examples/`  
**🎯 Focus:** Clean, impactful, trust-building interface

## 1. Design Philosophy

### **🎯 Core Principles**
- **Simplicity:** Focus on main prize pool to avoid confusion
- **Transparency:** Clear display of all game mechanics
- **Trust:** Historical data and precise information
- **Urgency:** Timer-driven excitement and engagement

### **🎨 Visual Style**
Based on provided examples in `/Documentation/ux-ui-examples/`:
- **Clean, modern interface** (reference: `ui.png`)
- **Pig-themed branding** with professional execution
- **High-contrast elements** for readability
- **Mobile-responsive design**

## 2. Main Landing Page Layout

### **🏆 Primary Focus: Main Prize Pool**
**Reference:** `ui.png` for overall layout inspiration

#### **Central Element:**
- **Large Prize Pool Display:** Dominant visual element
- **Real-time ADA amount** with smooth animations
- **72-hour countdown timer** (or Reset Killer countdown)
- **Deposit button** prominently placed

#### **Key Information Panel:**
- **Current timer status**
- **Number of depositors in last 100**
- **Next Reset Killer countdown** (persistent display)

### **📊 Secondary Information**
- **Last 100 Deposits table** (reference: `last100.png`)
  - High-precision timestamps (fractions of seconds)
  - Wallet addresses (truncated for privacy)
  - Deposit amounts
  - Position in queue

## 3. Detailed Component Specifications

### **⏰ Timer Display Requirements**

#### **Normal Operation:**
```
🕐 72:00:00
Time Remaining
```

#### **Reset Killer Active:**
```
⚡ RESET KILLER ACTIVE
🕐 00:45:23
Each deposit reduces timer by 1 second!
```

#### **Next Reset Killer Countdown:**
```
📅 Next Reset Killer in: 28 days, 14:32:15
```

### **💰 Prize Pool Visualization**
- **Main Pool:** Large, animated counter
- **Visual Effects:** Smooth number transitions
- **Currency Display:** ADA symbol and amount
- **Growth Indicator:** Recent deposit activity

### **📋 Last 100 Deposits Table**
**Reference:** `last100.png`

| Position | Wallet Address | Amount | Timestamp |
|----------|----------------|---------|-----------|
| 1 | addr1...xyz123 | 50 ADA | 14:32:15.847 |
| 2 | addr1...abc456 | 25 ADA | 14:31:42.123 |

**Requirements:**
- **High-precision timestamps** (milliseconds)
- **Real-time updates** as new deposits arrive
- **Responsive design** for mobile viewing
- **Smooth animations** for new entries

### **🎮 Action Button Design**
**Reference:** `playbutton.webp`

#### **Primary Deposit Button:**
- **Large, prominent placement**
- **Clear call-to-action text**
- **Visual feedback on hover/click**
- **Disabled state during processing**

#### **Button States:**
```
Normal: "DEPOSIT ADA"
Processing: "PROCESSING..."
Success: "DEPOSIT CONFIRMED!"
Error: "RETRY DEPOSIT"
```

## 4. Secondary Pages

### **📊 "Stats and Daily Raffle" Page**
**Accessible via dedicated button/icon**

#### **Pool Visualizations:**
- **Daily Winner Pool:** Smaller piggy bank visualization
- **Token Holder Pool:** $NIKEPIG and $MISTER distributions
- **NFT Holder Pool:** Nikeverse and Mister NFT rewards
- **Historical charts** of pool growth

#### **Statistics Display:**
- **Total deposits today**
- **Active participants**
- **Average deposit size**
- **Pool distribution percentages**

### **📜 Payout History Page**
**Build trust through transparency**

#### **Historical Records:**
- **Date of payout**
- **Total prize pool amount**
- **Number of winners**
- **Individual payout amounts**
- **Transaction hashes** for verification

#### **Filtering Options:**
- **Date range selection**
- **Payout type** (Main pool, Daily, Token, NFT)
- **Search by wallet address**

## 5. Information Architecture

### **🔍 Information Display**
**Reference:** `info.webp` for styling

#### **FAQ Section (Bottom of Main Page):**
**Expandable/collapsible format**

```
❓ Are there refunds?
   No, your contributions are swallowed up into the void and there is no reversing it.

❓ Who built Last Pigs Standing?
   NikePig and Mister teams.

❓ Does Last Pigs Standing have a maximum lifespan?
   No, it will continue until either no deposit is made in 72 hours, or a Reset Killer is reached.

❓ What happens during a Reset Killer?
   Each deposit resets the timer to 1 second less.

❓ When are Reset Killers scheduled?
   At 1 month after launch, and then 6 monthly after.
```

### **⚠️ Critical Warnings**
**Prominent placement required:**

```
🚨 IMPORTANT WARNING 🚨
Do NOT use a CEX (Centralized Exchange) to deposit your funds
(because the payout will go to the CEX wallet that deposited, 
and not your own CEX receiving wallet).
```

## 6. User Experience Flow

### **🎯 Primary User Journey**
**Reference:** `ux.png` for flow inspiration

1. **Landing:** User sees main prize pool and timer
2. **Decision:** User decides to participate
3. **Warning:** Clear CEX warning displayed
4. **Deposit:** Wallet connection and deposit process
5. **Confirmation:** Transaction confirmed, position shown
6. **Tracking:** User can track their position in Last 100

### **📱 Mobile Optimization**
- **Touch-friendly buttons** (minimum 44px)
- **Readable text** at all screen sizes
- **Simplified navigation** for mobile users
- **Fast loading times** for timer updates

## 7. Technical Requirements

### **⚡ Real-time Updates**
- **WebSocket connections** for live timer updates
- **Smooth animations** for prize pool changes
- **Instant feedback** for user actions
- **Offline handling** with reconnection logic

### **🔒 Security Considerations**
- **Wallet integration** security
- **Transaction validation** before submission
- **Error handling** for failed transactions
- **User education** about wallet security

### **📊 Performance Requirements**
- **Page load time:** < 3 seconds
- **Timer accuracy:** ±1 second precision
- **Update frequency:** Real-time for critical elements
- **Mobile performance:** Optimized for all devices

## 8. Accessibility & Compliance

### **♿ Accessibility Standards**
- **WCAG 2.1 AA compliance**
- **Screen reader compatibility**
- **Keyboard navigation support**
- **High contrast mode support**

### **🌍 Internationalization**
- **Multi-language support** (future consideration)
- **Currency display** flexibility
- **Time zone handling** for global users

## 9. Implementation Priority

### **🚀 Phase 1: Core Interface**
1. Main prize pool display
2. Timer functionality
3. Last 100 deposits table
4. Basic deposit functionality

### **📈 Phase 2: Enhanced Features**
1. Stats and Daily Raffle page
2. Payout history
3. Advanced animations
4. Mobile optimization

### **🎨 Phase 3: Polish & Optimization**
1. Advanced visual effects
2. Performance optimization
3. Accessibility improvements
4. User testing and refinements

**🎯 DESIGN GOAL: Create the most transparent, engaging, and trustworthy lottery dApp interface in the Cardano ecosystem**
