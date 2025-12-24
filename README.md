# Foundry Fund Me

This repository contains my implementation of the **Foundry Fund Me** project, developed while following the [Cyfrin Updraft Solidity Course](https://updraft.cyfrin.io/).

It is a crowdfunding smart contract built with **Foundry**, allowing users to donate ETH (denominated in USD) and enabling the owner to withdraw funds. It utilizes **Chainlink Price Feeds** for real-time currency conversion.

## 🌟 About The Project

This project demonstrates a professional smart contract development workflow using Foundry. Key features include:

* **Crowdfunding:** Users can fund the contract with ETH.
* **USD Denomination:** A minimum funding value is set in USD (e.g., $5), enforced via Chainlink Oracles.
* **Withdrawal Pattern:** Only the contract owner can withdraw the accumulated funds.
* **Gas Optimization:** Efficient data structures and storage management.
* **Cross-Chain Compatibility:** Configurations for local networks (Anvil), Testnets (Sepolia), and Layer 2s (zkSync).

## 🛠 Tech Stack

* **Solidity:** Smart Contract Language
* **Foundry:** Development Framework (Forge, Cast, Anvil)
* **Chainlink:** Decentralized Oracles for Price Feeds
* **Make:** Script automation

---

## 🚀 Getting Started

Follow these steps to set up the project locally.

### Prerequisites

Ensure you have the following installed:

* **[Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git):** `git --version`
* **[Foundry](https://getfoundry.sh/):** `forge --version`

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/GitAniket98/Foundry-Fund-Me.git](https://github.com/GitAniket98/Foundry-Fund-Me.git)
    cd Foundry-Fund-Me
    ```

2.  **Build the project:**
    ```bash
    make build
    ```
    *Or manually:* `forge build`

---

## 💡 Usage

### Deploy

To deploy to a local Anvil node (default):

```bash
forge script script/DeployFundMe.s.sol
```
### Testing
This project includes Unit and Forked tests.

Run all tests:

```bash

forge test
```

Run a specific test function:

```bash

forge test --match-test testFunctionName
```

Run Forked Tests (Sepolia):

```bash

forge test --fork-url $SEPOLIA_RPC_URL
```
Check Test Coverage:

```bash

forge coverage
```
### Gas Estimation

Generate a gas snapshot to check contract efficiency:

```bash

forge snapshot
```


### 🌍 Deployment
1. Setup Environment Variables
Create a .env file in the root directory (see .env.example). Warning: Do not share your private keys! Use a development wallet.

```bash

SEPOLIA_RPC_URL=[https://eth-sepolia.g.alchemy.com/v2/YOUR-API-KEY](https://eth-sepolia.g.alchemy.com/v2/YOUR-API-KEY)
PRIVATE_KEY=0xYOUR_PRIVATE_KEY
ETHERSCAN_API_KEY=YOUR_ETHERSCAN_KEY
```
2. Deploy to Sepolia Testnet
Load your variables and deploy using the script:

```bash

source .env
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

### 📜 Scripts
After deployment, you can interact with the contract using the included scripts.

Fund the Contract:

```bash

forge script script/Interactions.s.sol:FundFundMe --rpc-url sepolia --private-key $PRIVATE_KEY --broadcast
```
Withdraw Funds:

```bash

forge script script/Interactions.s.sol:WithdrawFundMe --rpc-url sepolia --private-key $PRIVATE_KEY --broadcast
```
## 🤝 Acknowledgements
Cyfrin Updraft: For the incredible educational content.

Patrick Collins: For the detailed walkthroughs and industry standards.

Chainlink: For the reliable price feeds.

*This is a learning project based on the Cyfrin Foundry Course.*