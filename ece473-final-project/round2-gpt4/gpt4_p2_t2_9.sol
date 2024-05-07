// SPDX-License-Identifier: MIT 
pragma solidity >=0.4.22 <0.8.26;

import "./node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}