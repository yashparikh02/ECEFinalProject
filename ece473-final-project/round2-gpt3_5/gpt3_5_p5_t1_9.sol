// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

abstract contract IERC20 {
    function totalSupply() external view virtual returns (uint256);
    function balanceOf(address account) external view virtual returns (uint256);
    function transfer(address recipient, uint256 amount) external virtual returns (bool);
    function allowance(address owner, address spender) external view virtual returns (uint256);
    function approve(address spender, uint256 amount) external virtual returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external virtual returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

abstract contract MyToken is IERC20 {
    string public name;
    string public symbol;
    uint8 public immutable decimals;
    uint256 public immutable totalSupplyVar;
    mapping(address => uint256) private _balances;

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupplyVar = initialSupply * (10 ** uint256(_decimals));
        _balances[msg.sender] = totalSupplyVar;
        emit Transfer(address(0), msg.sender, totalSupplyVar);
    }

    function balanceOf(address account) external view override returns (uint256) {
        return _balances[account];
    }
    
    function allowance(address owner, address spender) external view override returns (uint256) {
        // Implement allowance function
        // Not implemented in the existing code
    }
    
    function approve(address spender, uint256 amount) external override returns (bool) {
        // Implement approve function
        // Not implemented in the existing code
    }
    
    function totalSupply() external view override returns (uint256) {
        // Implement totalSupply function
        // Not implemented in the existing code
    }
    
    function transfer(address recipient, uint256 amount) external override returns (bool) {
        // Implement transfer function
        // Not implemented in the existing code
    }
    
    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        // Implement transferFrom function
        // Not implemented in the existing code
    }
}