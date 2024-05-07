// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}
```

You can install necessary OpenZeppelin contracts by running one of the following commands in your terminal:
`npm install @openzeppelin/contracts`
or
`yarn add @openzeppelin/contracts`

Then, check solidity compiler version by running
`solc --version`

To compile your contract run:
```bash
solc MyToken.sol --combined-json abi,ast,bin,bin-runtime,srcmap,srcmap-runtime,userdoc,devdoc,hashes --allow-paths .
