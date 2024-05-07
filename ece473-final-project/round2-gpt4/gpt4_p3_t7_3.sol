// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract MyToken {
    mapping (address => uint256) public balanceOf;
    string public name;
    string public symbol;
    uint8 public constant decimals = 18;
    uint256 public immutable totalSupply;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(uint256 initialSupply, string memory tokenName, string memory tokenSymbol) {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        name = tokenName;
        symbol = tokenSymbol;
    }

    function transfer(address _toAddress, uint256 _transferValue) public returns (bool success) {
        require(balanceOf[msg.sender] >= _transferValue);
        balanceOf[msg.sender] -= _transferValue;
        balanceOf[_toAddress] += _transferValue;
        emit Transfer(msg.sender, _toAddress, _transferValue);
        return true;
    }
}
