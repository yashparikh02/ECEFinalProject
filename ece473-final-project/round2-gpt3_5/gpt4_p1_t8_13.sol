// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}
```

Make sure to install the necessary OpenZeppelin contracts using npm or yarn:

```bash
npm install @openzeppelin/contracts
```
or

```bash
yarn add @openzeppelin/contracts
```

And run the solidity compiler with the following command:

```bash
solc --version
```

Then compile your contract:

```bash
solc gpt4_p1_t8_12.sol --combined-json abi,ast,bin,bin-runtime,srcmap,srcmap-runtime,userdoc,devdoc,hashes --allow-paths .
