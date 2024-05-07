// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MyToken {
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private immutable _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private immutable _decimals;

    constructor (string memory initName, string memory initSymbol, uint256 initTotalSupply) {
        _name = initName;
        _symbol = initSymbol;
        _decimals = 18; // commonly used value
        _totalSupply = initTotalSupply;
        _balances[msg.sender] = initTotalSupply; // all tokens to the owner at the beginning
    }

    function name() public view returns (string memory) { return _name; }

    function symbol() public view returns (string memory) { return _symbol; }

    function decimals() public view returns (uint8) { return _decimals; }

    function totalSupply() public view returns (uint256) { return _totalSupply; }

    function balanceOf(address account) public view returns (uint256) { return _balances[account]; }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(_balances[msg.sender] >= amount);
        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint256) { return _allowances[owner][spender]; }

    function approve(address spender, uint256 amount) public returns (bool) {
        _allowances[msg.sender][spender] = amount;
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        require(_balances[sender] >= amount && _allowances[sender][msg.sender] >= amount);
        _balances[sender] -= amount;
        _balances[recipient] += amount;
        _allowances[sender][msg.sender] -= amount;
        return true;
    }
}
