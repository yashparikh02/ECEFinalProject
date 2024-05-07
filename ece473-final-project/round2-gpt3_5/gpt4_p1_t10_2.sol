// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract ERC20Token {
    // Mapping that stores the balance of each address
    mapping (address => uint256) public balanceOf;

    // Token properties
    string public name = 'erc20 Essentials';
    string public symbol = 'ERC20';
    uint8 public decimals = 18;
    uint256 public totalSupply = 10000 * (10 ** uint256(decimals));

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        // Initially assign all tokens to the contract's creator.
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, 'Not enough balance');
        
        // Subtract from the sender
        balanceOf[msg.sender] -= _value;
        
        // Add the same to the recipient
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
