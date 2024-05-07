// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ERC20Token {
    // Token properties
    string public constant name = 'erc20 Essentials';
    string public constant symbol = 'ERC20';
    uint8 public constant decimals = 18;
    uint256 public totalSupply;

    // Mapping that stores the balance of each address
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        totalSupply = 10000 * (10 ** uint256(decimals));

        // Initially assign all tokens to the contract's creator.
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address toAddress, uint256 transferValue) public returns (bool success) {
        require(balanceOf[msg.sender] >= transferValue, 'Not enough balance');
        
        // Subtract from the sender
        balanceOf[msg.sender] -= transferValue;
        
        // Add the same to the recipient
        balanceOf[toAddress] += transferValue;

        emit Transfer(msg.sender, toAddress, transferValue);
        return true;
    }
}