// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract ERC20 is IERC20 {
    function totalSupply() public pure override returns (uint256) {
        return 0;
    }

    function balanceOf(address account) public pure override returns (uint256) {
        return 0;
    }

    function transfer(address recipient, uint256 amount) public pure override returns (bool) {
        return false;
    }

    function allowance(address owner, address spender) public pure override returns (uint256) {
        return 0;
    }

    function approve(address spender, uint256 amount) public pure override returns (bool) {
        return false;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public pure override returns (bool) {
        return false;
    }
}
