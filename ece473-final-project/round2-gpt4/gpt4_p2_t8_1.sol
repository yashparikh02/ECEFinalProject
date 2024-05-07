pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token is ERC20 {
    constructor() ERC20("My ERC20 Token", "MET") public {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
}
