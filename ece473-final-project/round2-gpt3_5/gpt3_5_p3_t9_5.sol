// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20 {
    string private _name;
    string private _symbol;
    uint8 private immutable _decimals;
    uint256 private immutable _totalSupply;
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    constructor(string memory name_, string memory symbol_, uint8 decimals_, uint256 totalSupply_) {
        _name = name_;
        _symbol = symbol_;
        _decimals = decimals_;
        _totalSupply = totalSupply_ * 10**uint256(decimals_);
    }
}