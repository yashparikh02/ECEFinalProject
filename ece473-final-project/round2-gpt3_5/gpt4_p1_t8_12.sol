// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}
```
Before you run this code, make sure to install OpenZeppelin contracts using either npm or yarn:

```bash
npm install @openzeppelin/contracts
```

or

```bash
yarn add @openzeppelin/contracts
