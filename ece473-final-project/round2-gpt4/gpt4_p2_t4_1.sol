pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20Detailed.sol";


contract MyBitToken is ERC20, ERC20Detailed {

    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 totalSupply
    )
        ERC20Detailed(name, symbol, decimals)
        public
    {
        _mint(_msgSender(), totalSupply);
    }
}
