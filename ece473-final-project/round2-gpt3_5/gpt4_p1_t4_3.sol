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

    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address _toAddress, uint256 _valueTransfer) public returns (bool success) {
        require(balanceOf[msg.sender] >= _valueTransfer);
        balanceOf[msg.sender] -= _valueTransfer;
        balanceOf[_toAddress] += _valueTransfer;
        emit Transfer(msg.sender, _toAddress, _valueTransfer);
        return true;
    }

    function approve(address _spenderAddress, uint256 _valueToApprove) public returns (bool success) {
        allowance[msg.sender][_spenderAddress] = _valueToApprove;
        emit Approval(msg.sender, _spenderAddress, _valueToApprove);
        return true;
    }

    function transferFrom(address _fromAddress, address _toAddress, uint256 _valueTransferFrom) public returns (bool success) {
        require(_valueTransferFrom <= balanceOf[_fromAddress]);
        require(_valueTransferFrom <= allowance[_fromAddress][msg.sender]);
        balanceOf[_fromAddress] -= _valueTransferFrom;
        balanceOf[_toAddress] += _valueTransferFrom;
        allowance[_fromAddress][msg.sender] -= _valueTransferFrom;
        emit Transfer(_fromAddress, _toAddress, _valueTransferFrom);
        return true;
    }
}
