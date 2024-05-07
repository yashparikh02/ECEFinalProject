// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

abstract contract ERC20 is IERC20 {
    mapping (address => uint256) private _balances;
    uint256 private _TOTAL_SUPPLY;

    function totalSupply() public view override returns (uint256) {
        return _TOTAL_SUPPLY;
    }

    function balanceOf(address owner) public view virtual override returns (uint256) {
        return _balances[owner];
    }

    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        // Needs to be implemented
    }

    function approve(address spender, uint256 value) public virtual override returns (bool) {
        // Needs to be implemented
    }

    function transfer(address to, uint256 value) public virtual override returns (bool) {
        // Needs to be implemented
    }

    function transferFrom(address from, address to, uint256 value) public virtual override returns (bool) {
        // Needs to be implemented
    }
}
