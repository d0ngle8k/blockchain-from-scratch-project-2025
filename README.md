# Blockchain Solo Project 2025

A comprehensive learning repository documenting my blockchain development journey through Cyfrin Updraft and freeCodeCamp courses. This repo contains interactive demos, cryptographic algorithm implementations, and Solidity smart contracts.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📚 Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Projects](#projects)
  - [Blockchain Demo](#1-blockchain-demo)
  - [SHA-256 Algorithm](#2-sha-256-algorithm)
  - [Solidity Smart Contracts](#3-solidity-smart-contracts)
- [Getting Started](#getting-started)
- [Learning Resources](#learning-resources)
- [License](#license)

---

## 🎯 Overview

This repository serves as a comprehensive portfolio and learning documentation for blockchain technology, covering:

- **Interactive blockchain visualization** - Understand immutable ledgers, mining, and distributed systems
- **Cryptographic fundamentals** - Deep dive into SHA-256 hashing with visual animations
- **Smart contract development** - Solidity contracts demonstrating core concepts and patterns

Each project is self-contained with its own documentation, setup instructions, and learning objectives.

---

## 📁 Repository Structure

```
blockchain-solo-project-2025/
├── blockchain-demo/          # Interactive web-based blockchain demonstration
│   ├── public/              # Frontend assets (JS, CSS, images)
│   ├── routes/              # Express.js routes
│   ├── views/               # Pug templates
│   └── locales/             # i18n translations (14 languages)
│
├── sha256 algorithm/         # Visual SHA-256 hash function implementation (Ruby)
│   ├── *.rb                 # Individual SHA-256 operation scripts
│   └── images/              # Animation GIFs and diagrams
│
├── Solidity Code/           # Smart contract examples
│   └── s1mple storage/      # Storage pattern contracts
│       ├── 1_Storage.sol    # Basic storage contract
│       ├── 2_Owner.sol      # Ownable contract pattern
│       ├── 3_Ballot.sol     # Voting system
│       └── S1mpleStorage.sol # Extended storage example
│
└── image/                   # Project documentation images
```

---

## 🚀 Projects

### 1. Blockchain Demo

**📂 Location:** `blockchain-demo/`  
**🛠 Tech Stack:** Node.js, Express, JavaScript  
**🎓 Learning Focus:** Blockchain fundamentals, proof-of-work, distributed consensus

An interactive web application that visualizes blockchain concepts including:
- ✅ Hash functions and data integrity
- ✅ Immutable ledgers and block chaining
- ✅ Mining and proof-of-work (adjustable difficulty)
- ✅ Distributed blockchain networks
- ✅ Coinbase transactions and tokens

#### Quick Start

```bash
# Navigate to project
cd blockchain-demo

# Install dependencies
npm install

# Start the server
npm start

# Open browser
http://localhost:3000
```

#### Docker Setup (Alternative)

```bash
cd blockchain-demo
docker-compose up -d
```

#### Features
- Adjustable mining difficulty (4-15 leading zeros)
- Multiple blockchain pages: Hash, Block, Blockchain, Distributed, Coinbase, Tokens
- Real-time nonce calculation and hash visualization
- Multi-language support (14 languages)

**📖 Full Documentation:** [blockchain-demo/README.md](blockchain-demo/README.md)

---

### 2. SHA-256 Algorithm

**📂 Location:** `sha256 algorithm/`  
**🛠 Tech Stack:** Ruby  
**🎓 Learning Focus:** Cryptographic hash functions, bitwise operations, SHA-256 internals

A terminal-based animation demonstrating the SHA-256 hash function step-by-step, including:
- ✅ Bitwise operations (SHR, ROTR, XOR, AND, OR, NOT)
- ✅ Sigma functions (σ₀, σ₁, Σ₀, Σ₁)
- ✅ Choice and Majority functions
- ✅ Message padding and scheduling
- ✅ Compression rounds
- ✅ Double-SHA256 (Bitcoin-style)

#### Quick Start

```bash
# Navigate to algorithm directory
cd "sha256 algorithm"

# Run basic hash
ruby sha256.rb abc

# Hash binary/hex data
ruby sha256.rb 0b01100001
ruby sha256.rb 0xaabbccdd

# Control animation speed
ruby sha256.rb abc fast      # Fast mode
ruby sha256.rb abc enter     # Step-through mode

# Bitcoin double-SHA256 (hex input)
ruby hash256.rb 0100000000000000000000000000000000000000000000000000000000000000000000003ba3edfd7a7b12b27ac72c3e67768f617fc81bc3888a51323a9fb8aa4b1e5e4a29ab5f49ffff001d1dac2b7c
```

#### Individual Operations

Test specific SHA-256 operations:

```bash
ruby shr.rb 11111111111111110000000000000000 22      # Right shift
ruby rotr.rb 11111111111111110000000000000000 22     # Rotate right
ruby sigma0.rb 11111111111111110000000000000000     # σ₀ function
ruby ch.rb 11111111 11110000 00001111                # Choice function
ruby maj.rb 11111111 11110000 00001111               # Majority function
```

**📖 Full Documentation:** [sha256 algorithm/README.md](sha256%20algorithm/README.md)

---

### 3. Solidity Smart Contracts

**📂 Location:** `Solidity Code/s1mple storage/`  
**🛠 Tech Stack:** Solidity ^0.8.0  
**🎓 Learning Focus:** Smart contract development, storage patterns, access control, voting systems

Collection of educational Solidity contracts demonstrating fundamental patterns:

#### Contracts

| Contract | Description | Key Concepts |
|----------|-------------|-------------|
| **1_Storage.sol** | Basic storage contract | State variables, getters/setters |
| **2_Owner.sol** | Ownable pattern | Access control, modifiers, ownership transfer |
| **3_Ballot.sol** | Voting system | Structs, mappings, voting logic, delegation |
| **S1mpleStorage.sol** | Extended storage | View/pure functions, visibility specifiers |

#### Compile Contracts

**Using Solidity Compiler (solc):**

```bash
# Install solc globally
npm install -g solc

# Compile a contract
cd "Solidity Code/s1mple storage"
solcjs --bin --abi --output-dir ./compiled S1mpleStorage.sol

# Output: 
# - compiled/*.bin (bytecode)
# - compiled/*.abi (ABI interface)
```

**Using Remix IDE (Recommended for Beginners):**

1. Visit [Remix IDE](https://remix.ethereum.org)
2. Upload `.sol` files from `Solidity Code/s1mple storage/`
3. Compile in the "Solidity Compiler" tab
4. Deploy and test in the "Deploy & Run Transactions" tab

**Using Hardhat (Professional Setup):**

```bash
# Setup Hardhat project (from repo root)
npm init -y
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox

# Initialize Hardhat
npx hardhat

# Copy contracts to contracts/ directory
# Then compile
npx hardhat compile
```

#### Contract Examples

**SimpleStorage.sol** - Basic storage contract:
```solidity
contract SimpleStorage {
    uint256 public favoriteNumber;
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }
}
```

**Key Learning Points:**
- State variables and data types
- Function visibility (public, private, external, internal)
- View and pure function modifiers
- Access control patterns (Ownable)
- Complex data structures (structs, mappings, arrays)
- Event logging
- Voting mechanisms and delegation

---

## 🛠 Getting Started

### Prerequisites

- **Node.js** (v14+) - For blockchain demo
- **Ruby** (v3.0+) - For SHA-256 animations
- **Solidity Compiler** (optional) - For smart contract compilation
- **Git** - For cloning the repository

### Clone Repository

```bash
git clone https://github.com/d0ngle8k/blockchain-solo-project-2025.git
cd blockchain-solo-project-2025
```

### Quick Setup

```bash
# Setup blockchain demo
cd blockchain-demo
npm install
npm start

# Test SHA-256 animation (separate terminal)
cd "../sha256 algorithm"
ruby sha256.rb "blockchain"

# Compile Solidity contracts
cd "../Solidity Code/s1mple storage"
solcjs --bin --abi S1mpleStorage.sol
```

---

## 📖 Learning Resources

This project is built following these courses and resources:

### Courses
- 🎓 [Cyfrin Updraft](https://updraft.cyfrin.io/) - Comprehensive blockchain development
- 🎓 [freeCodeCamp Solidity Course](https://www.youtube.com/watch?v=M576WGiDBdQ) - 32-hour Solidity masterclass
- 🎓 [Blockchain 101 Demo](https://www.youtube.com/watch?v=_160oMzblY8) - Visual blockchain concepts

### Documentation
- 📚 [Solidity Docs](https://docs.soliditylang.org/) - Official Solidity documentation
- 📚 [Ethereum.org](https://ethereum.org/developers) - Ethereum developer resources
- 📚 [NIST FIPS 180-4](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf) - SHA-256 specification

### Tools
- 🔧 [Remix IDE](https://remix.ethereum.org/) - Browser-based Solidity IDE
- 🔧 [Hardhat](https://hardhat.org/) - Ethereum development environment
- 🔧 [Foundry](https://getfoundry.sh/) - Fast Solidity testing framework

---

## 🎯 Learning Objectives Achieved

- ✅ Understanding blockchain immutability and consensus mechanisms
- ✅ Deep knowledge of cryptographic hash functions (SHA-256)
- ✅ Proficiency in Solidity smart contract development
- ✅ Implementing common contract patterns (storage, ownership, voting)
- ✅ Deployment strategies and testing methodologies
- ✅ Web3 fundamentals and decentralized application architecture

---

## 🤝 Contributing

This is a personal learning repository, but suggestions and improvements are welcome! Feel free to:
- 🐛 Report bugs or issues
- 💡 Suggest improvements or additional examples
- 📖 Share additional learning resources

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Individual sub-projects may have their own licenses:
- **blockchain-demo**: MIT License (Anders Brownworth)
- **sha256 algorithm**: MIT License

---

## 🙏 Acknowledgments

- **Anders Brownworth** - Original blockchain demo creator
- **Cyfrin Updraft** - Comprehensive blockchain education
- **Patrick Collins** - freeCodeCamp Solidity course
- **Ethereum Community** - Extensive documentation and resources

---

## 📞 Contact

**GitHub:** [@d0ngle8k](https://github.com/d0ngle8k)  
**Repository:** [blockchain-solo-project-2025](https://github.com/d0ngle8k/blockchain-solo-project-2025)

---

*Last Updated: October 2025*  
*Status: 🚀 Active Learning & Development*
