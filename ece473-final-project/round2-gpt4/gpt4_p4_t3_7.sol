// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;  // updated version of Solidity without severe issues

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
    uint256 private constant _totalSupply = 0; // declared _totalSupply as constant

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    // ... rest of the code remains the same
}
