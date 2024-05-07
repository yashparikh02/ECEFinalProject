// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

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

contract SimpleERC20 is IERC20 {
    string public constant name = "SimpleERC20";
    string public constant symbol = "ERC20";
    uint8 public constant decimals = 18;
    uint256 public immutable totalTokenSupply;

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) public allowed;

    constructor(uint256 initialSupply) {
        totalTokenSupply = initialSupply * 10 ** uint256(decimals);
        balances[msg.sender] = totalTokenSupply;
    }

    function totalSupply() public view override returns (uint256) {
        return totalTokenSupply;
    }

    function balanceOf(address owner) public view override returns (uint256 balance) {
        return balances[owner];
    }

    function transfer(address to, uint256 value) public override returns (bool success) {
        require(balances[msg.sender] >= value);
        balances[msg.sender] -= value;
        balances[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public override returns (bool success) {
        uint256 allowedValue = allowed[from][msg.sender];
        require(balances[from] >= value && allowedValue >= value);
        balances[to] += value;
        balances[from] -= value;
        if (allowedValue < type(uint256).max) {
            allowed[from][msg.sender] -= value;
        }
        emit Transfer(from, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public override returns (bool success) {
        allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256 remaining) {
        return allowed[owner][spender];
    }
}
