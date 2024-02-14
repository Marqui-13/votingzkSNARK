# zkSNARK Voting System Example

This repository contains a suite of smart contracts designed to demonstrate a secure voting system leveraging zkSNARKs for privacy-preserving vote submission and tallying on the Ethereum blockchain. The system includes mechanisms for private transactions, vote commitment and revelation, and verification of zkSNARK proofs without revealing the voter's choice.

## Prerequisites

Before interacting with these contracts, ensure you have:

- [Node.js](https://nodejs.org/) installed (version 12.x or later recommended).
- [Truffle Suite](https://www.trufflesuite.com/) for smart contract compilation and deployment.
- [Ganache](https://www.trufflesuite.com/ganache) for a local Ethereum blockchain instance.
- [MetaMask](https://metamask.io/) or another Ethereum wallet for interacting with the blockchain.

## Installation

### Clone this repository to start working with the zkSNARK voting system:

git clone https://github.com/Marqui-13/zkSNARK-voting-system.git

### Navigate to the cloned directory and install the necessary dependencies:

cd zkSNARK-voting-system
npm install

## Smart Contracts Overview

- `PrivateTransaction.sol`: Implements a simple private transaction mechanism using zkSNARK for proof verification.
- `PrivateVote.sol`: Facilitates a private voting process where voters submit commitments and reveal their votes alongside zkSNARK proofs.
- `Verifier.sol` & `ZkSnarkCircuit.sol`: Work together to verify zkSNARK proofs, ensuring that votes are valid without revealing their content.
- `votingSystem.sol`: Integrates zkSNARK proofs for a complete voting system, allowing proposal creation, voting, and final tally revelation in a privacy-preserving manner.

## Usage

### Compilation

Compile the smart contracts using Truffle:

truffle compile

### Deployment

Deploy the contracts to your local Ganache instance or to a testnet:

truffle migrate

### Interacting with the Contracts

Use Truffle's console or a frontend interface connected to MetaMask to interact with the deployed contracts. Example interactions include creating proposals, submitting votes, and revealing the vote tally.

## Contributing

Contributions to improve the smart contracts or enhance documentation are welcome. Please fork the repository, make your changes, and submit a pull request for review.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- The Ethereum community for resources on smart contract development.
- zkSNARKs researchers and developers for the foundational work on zero-knowledge proofs.