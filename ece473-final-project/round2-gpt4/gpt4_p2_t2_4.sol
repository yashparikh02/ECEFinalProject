// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") public {
        _mint(msg.sender, initialSupply);
    }
}
```

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.26;

import "@openzeppelin/contracts/math/SafeMath.sol";

contract MyToken {
    using SafeMath for uint256;

    string public constant name = "MyToken";
    string public constant symbol = "MTK";
    uint8 public constant decimals = 18;

    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    uint256 totalSupply_;

    constructor(uint256 total) public {
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_;
    }

    // ... rest of the contract code
}

```

Also, remember to install OpenZeppelin contracts into your project using npm:

```bash
npm install @openzeppelin/contracts
