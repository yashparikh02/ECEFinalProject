// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract ERC20Token {
    // Mapping that stores the balance of each address
    mapping (address => uint256) public balanceOf;

    // Token properties
    string constant public name = 'erc20 Essentials';
    string constant public symbol = 'ERC20';
    uint8 constant public decimals = 18;
    uint256 immutable public totalSupply;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        totalSupply = 10000 * (10 ** uint256(decimals));
        // Initially assign all tokens to the contract's creator.
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, 'Not enough balance');
        
        // Subtract from the sender
        balanceOf[msg.sender] -= value;
        
        // Add the same to the recipient
        balanceOf[to] += value;

        emit Transfer(msg.sender, to, value);
        return true;
    }
}