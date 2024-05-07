// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleToken {
    // Track how many tokens are owned by each address.
    mapping (address => uint256) public balanceOf;

    string public constant name = "SimpleToken";
    string public constant symbol = "SIM";
    uint8 public constant decimals = 18;
    
    uint256 public immutable totalSupply;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        // Initially assign all tokens to the contract's creator.
        totalSupply = 10000 * (uint256(10) ** decimals);
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value);

        balanceOf[msg.sender] -= value; // deduct from sender's balance
        balanceOf[to] += value;         // add to recipient's balance

        emit Transfer(msg.sender, to, value);
        return true;
    }
    
    function balance(address owner) public view returns (uint256) {
        return balanceOf[owner];
    }
}
