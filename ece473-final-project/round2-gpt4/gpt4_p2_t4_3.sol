// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;  

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";  

contract MyBitToken is ERC20 {     
    constructor(string memory name, string memory symbol, uint256 totalSupply) 
        ERC20(name, symbol) 
        public 
    {         
        _mint(_msgSender(), totalSupply);   
        _setupDecimals(18); 
    } 
}
