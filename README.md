# Rebase ERC-20 Token (Foundry Setup)

This project implements a simple **rebase ERC-20 token** with manual supply adjustments. The contract expands or contracts the token supply by **5% per rebase cycle**, controlled by the owner. The project is structured with **Foundry** for deployment and testing.

## Features 🚀

- **ERC-20 Token with Rebase Mechanism**
- **Manual Rebase Control** (Increase or Decrease supply by 5%)
- **Adjustable Rebase Interval** (Default: 1 day)
- **Foundry Deployment & Test Scripts**

## 🔧 Installation & Setup

### 1️⃣ Install Foundry

If you haven't already installed Foundry, do so with:

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### 2️⃣ Clone the Repository & Build

```bash
git clone YOUR_REPO_URL
cd YOUR_PROJECT_FOLDER
forge build
```

### 3️⃣ Deploy the Contract (Foundry Script)

```bash
forge script script/DeployRebase.s.sol --broadcast --rpc-url YOUR_RPC_URL
```

### 4️⃣ Run Tests

```bash
forge test
```

---

## 📜 Contract Overview

### **RebaseToken.sol** (Main Contract)

- **\_mint() & \_burn()** → Used for supply expansion/contraction.
- **rebase(bool increase)** → Owner-only function to adjust supply.
- **setRebaseInterval(uint256 interval)** → Adjust the interval between rebases.

### **DeployRebase.s.sol** (Foundry Script)

- Deploys `RebaseToken` on the blockchain using Foundry.

### **RebaseToken.t.sol** (Test Suite)

- **Tests for:**
  - Initial supply
  - Rebase increasing total supply
  - Rebase decreasing total supply

---

## 🛠️ Next Steps

- Experiment with different **rebase percentages**
- Try **automating rebase logic** based on external conditions
- Deploy it on a **testnet** and interact with the contract

🔥 **Now you're ready to deploy and test your own rebase token!** 🚀
