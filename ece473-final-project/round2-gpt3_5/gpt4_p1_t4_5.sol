// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract MyToken {
    string public constant name = "MyToken";
    string public constant symbol = "MYT";
    uint8 public constant decimals = 18;
    uint256 public immutable totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address toAddress, uint256 valueTransfer) public returns (bool success) {
        require(balanceOf[msg.sender] >= valueTransfer);
        balanceOf[msg.sender] -= valueTransfer;
        balanceOf[toAddress] += valueTransfer;
        emit Transfer(msg.sender, toAddress, valueTransfer);
        return true;
    }

    function approve(address spenderAddress, uint256 valueToApprove) public returns (bool success) {
        allowance[msg.sender][spenderAddress] = valueToApprove;
        emit Approval(msg.sender, spenderAddress, valueToApprove);
        return true;
    }

    function transferFrom(address fromAddress, address toAddress, uint256 valueTransferFrom) public returns (bool success) {
        require(valueTransferFrom <= balanceOf[fromAddress]);
        require(valueTransferFrom <= allowance[fromAddress][msg.sender]);
        balanceOf[fromAddress] -= valueTransferFrom;
        balanceOf[toAddress] += valueTransferFrom;
        allowance[fromAddress][msg.sender] -= valueTransferFrom;
        emit Transfer(fromAddress, toAddress, valueTransferFrom);
        return true;
    }
}
