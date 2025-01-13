# Smart-Contracts_Upgrade

## Overview
This project demonstrates the upgrade functionality of smart contracts from CircleV1 to CircleV2 using Universal Upgradeable Proxies implemented with OpenZeppelin’s `ERC1967` standard.

The primary purpose of this project is to showcase how to manage and implement upgrades seamlessly while maintaining proxy-based access to contract functionality.

## Key Features
1. **Universal Upgradeable Proxies:** Utilizes OpenZeppelin's `ERC1967` implementation for smooth upgrades.
2. **CircleV1 and CircleV2 Compatibility:** CircleV1 returns version 1, while CircleV2 introduces version 2 functionality, ensuring a straightforward demonstration of upgrades.

## Tools and Frameworks
- **Foundry:** A blazing fast, portable, and modular toolkit for Ethereum application development.
- **DevOpsTools:** For automating deployment and testing processes.

## Testing and Deployment
- The project leverages Foundry for testing the upgrade process and ensuring the proxy points to the correct logic contract.
- Users can utilize the provided `Makefile` for seamless interaction and execution of tasks.

## Acknowledgments
Special thanks to [Cyfrin’s Foundry Full Course](https://github.com/Cyfrin/foundry-full-course-cu) for providing invaluable educational resources and insights into smart contract development and upgrade mechanisms.

