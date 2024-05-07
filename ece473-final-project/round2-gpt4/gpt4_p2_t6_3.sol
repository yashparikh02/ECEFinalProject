// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("StarDust", "STRD") {
        _mint(msg.sender, initialSupply);
    }
}
```

However, it could be that your environment doesn't recognize the "@openzeppelin" package notation. For that case, use the relative path to the OpenZeppelin contracts in your project module:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("StarDust", "STRD") {
        _mint(msg.sender, initialSupply);
    }
}
