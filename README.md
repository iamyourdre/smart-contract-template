# SMART CONTRACT
## Cheatsheet for Developing and Running a Smart Contract  

1. **Navigate to the Contract Directory**  
   ```cd contract```  

2. **Initialize Hardhat**  
   Initialize a Hardhat project to manage smart contract development.  
   ```npx hardhat init```  

3. **Create a Solidity Smart Contract**  
   Create a Solidity smart contract file inside the `contracts` directory. Example:  
   ```
   solidity
   // SPDX-License-Identifier: UNLICENSED
   pragma solidity ^0.8.28;

   contract DTHPurchase {
       // ... smart contract code ...
   }
   ```  

4. **Configure `.env` for Deployment**  
   ```
   NETWORK_URL=127.0.0.1:8545
   PRIVATE_KEY=0x40...3a48d
   ```  

5. **Compile the Smart Contract**  
   Compile the smart contract using Hardhat.  
   ```npx hardhat compile```  

6. **Deploy the Smart Contract**  
   Run the deployment script to distribute the smart contract to the local network.  
   ```npx hardhat run scripts/deploy.js --network localhost```  

## Directory Structure  
- `contracts/`: Stores Solidity smart contract files.  
- `scripts/`: Stores scripts for deployment and other tasks.  
- `test/`: Stores test files for the smart contract.  