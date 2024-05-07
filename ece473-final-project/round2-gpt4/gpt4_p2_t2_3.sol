// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}
```

Before you compile this code, make sure you have OpenZeppelin contracts installed in your project:

```bash
npm install @openzeppelin/contracts
```

And here is the corrected version of the second contract:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.26;

import "./SafeMath.sol";

contract MyToken {

    string public constant name = "MyToken";
    string public constant symbol = "MTK";
    uint8 public constant decimals = 18;

    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);

    mapping(address => uint256) balances;

    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_;

    using SafeMath for uint256;

    constructor(uint256 total) public {
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_;
    }

...
}
