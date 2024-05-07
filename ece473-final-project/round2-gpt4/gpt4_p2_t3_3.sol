// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

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
    
    function transfer(address _toAddress, uint256 _valueAmount) public returns (bool success) {
        require(balanceOf[msg.sender] >= _valueAmount, "Not enough balance");
        balanceOf[msg.sender] -= _valueAmount;
        balanceOf[_toAddress] += _valueAmount;
        emit Transfer(msg.sender, _toAddress, _valueAmount);
        return true;
    }
    
    function approve(address _spenderAddress, uint256 _valueAmount) public returns (bool success) {
        allowance[msg.sender][_spenderAddress] = _valueAmount;
        emit Approval(msg.sender, _spenderAddress, _valueAmount);
        return true;
    }
    
    function transferFrom(address _fromAddress, address _toAddress, uint256 _valueAmount) public returns (bool success) {
        require(_valueAmount <= balanceOf[_fromAddress], "Not enough balance");
        require(_valueAmount <= allowance[_fromAddress][msg.sender], "Transfer amount exceeds allowance");
        balanceOf[_fromAddress] -= _valueAmount;
        balanceOf[_toAddress] += _valueAmount;
        allowance[_fromAddress][msg.sender] -= _valueAmount;
        emit Transfer(_fromAddress, _toAddress, _valueAmount);
        return true;
    }
}
