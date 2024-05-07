// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.25;

contract ERC20Token {
  mapping (address => uint256) public balanceOf;

  constructor(uint256 initialSupply) {
    balanceOf[msg.sender] = initialSupply;
  }

  function transfer(address _to, uint256 _value) public returns (bool success) {
    require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
    balanceOf[msg.sender] -= _value;            // Subtract from the sender
    balanceOf[_to] += _value;                   // Add the same to the recipient
    return true;
  }
}