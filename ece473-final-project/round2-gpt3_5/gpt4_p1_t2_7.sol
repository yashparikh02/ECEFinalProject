// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
 
contract ERC20Token {
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply = 0;

     // the rest of your contract follows...
