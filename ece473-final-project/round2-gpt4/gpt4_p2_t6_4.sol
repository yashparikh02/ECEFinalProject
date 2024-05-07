// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("StarDust", "STRD") {
        _mint(msg.sender, initialSupply);
    }
}
```
Or if your environment doesn't recognize the "@openzeppelin" package notation, use this:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("StarDust", "STRD") {
        _mint(msg.sender, initialSupply);
    }
}
