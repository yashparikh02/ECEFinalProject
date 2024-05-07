// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ERC20Token {
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply = 1000000;

    string public name;
    string public symbol;
    uint8 public decimals = 18;

    constructor(string memory tokenName, string memory tokenSymbol) {
        name = tokenName;
        symbol = tokenSymbol;
        _balances[msg.sender] = _totalSupply;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address tokenOwner) public view returns (uint256) {
        return _balances[tokenOwner];
    }

    function transfer(address receiver, uint256 numTokens) public returns (bool) {
        require(numTokens <= _balances[msg.sender]);
        _balances[msg.sender] -= numTokens;
        _balances[receiver] += numTokens;
        return true;
    }

    function approve(address delegate, uint256 numTokens) public returns (bool) {
        _allowances[msg.sender][delegate] = numTokens;
        return true;
    }

    function allowance(address owner, address delegate) public view returns (uint) {
        return _allowances[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint256 numTokens) public returns (bool) {
        require(numTokens <= _balances[owner]);    
        require(numTokens <= _allowances[owner][msg.sender]);

        _balances[owner] -= numTokens;
        _balances[buyer] += numTokens;
        _allowances[owner][msg.sender] -= numTokens;
        return true;
    }
}
