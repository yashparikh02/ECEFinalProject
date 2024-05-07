// SPDX-License-Identifier: MIT 
pragma solidity >=0.4.22 <0.8.26;

import "./node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) public ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }
} 

Here, I'm assuming that Solidity compiler run in a top-level directory, also where the node_modules directory exists, as created by npm, and it is able to resolve "./node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol" path. If your setup differs, please adjust the import directive path accordingly. Notice the change on line 4 with included path to ERC20.sol.