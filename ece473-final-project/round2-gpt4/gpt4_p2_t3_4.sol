// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ERC20Token {
    string public name;
    string public symbol;
    uint256 public immutable decimals;
    uint256 public immutable totalSupply;
    
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    
    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }
    
    function transfer(address toAddress, uint256 valueAmount) public returns (bool success) {
        require(balanceOf[msg.sender] >= valueAmount, "Not enough balance");
        balanceOf[msg.sender] -= valueAmount;
        balanceOf[toAddress] += valueAmount;
        emit Transfer(msg.sender, toAddress, valueAmount);
        return true;
    }
    
    function approve(address spenderAddress, uint256 valueAmount) public returns (bool success) {
        allowance[msg.sender][spenderAddress] = valueAmount;
        emit Approval(msg.sender, spenderAddress, valueAmount);
        return true;
    }
    
    function transferFrom(address fromAddress, address toAddress, uint256 valueAmount) public returns (bool success) {
        require(valueAmount <= balanceOf[fromAddress], "Not enough balance");
        require(valueAmount <= allowance[fromAddress][msg.sender], "Transfer amount exceeds allowance");
        balanceOf[fromAddress] -= valueAmount;
        balanceOf[toAddress] += valueAmount;
        allowance[fromAddress][msg.sender] -= valueAmount;
        emit Transfer(fromAddress, toAddress, valueAmount);
        return true;
    }
}
