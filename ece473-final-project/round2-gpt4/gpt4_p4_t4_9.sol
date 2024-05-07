// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

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
  mapping (address => uint256) private _balances;
  uint256 private _totalSupply;

  function totalSupply() public view override returns (uint256) {
      return _totalSupply;
  }

  function balanceOf(address account) public view override returns (uint256) {
      return _balances[account];
  }

  function transfer(address recipient, uint256 amount) public override returns (bool) {
      require(_balances[msg.sender] >= amount, "Insufficient balance.");
      _balances[msg.sender] -= amount;
      _balances[recipient] += amount;
      emit Transfer(msg.sender, recipient, amount);
      return true;
  }

  function allowance(address owner, address spender) public view override returns (uint256) {
      // This function needs an additional mapping variable to work, which is not declared here.
  }

  function approve(address spender, uint256 amount) public override returns (bool) {
      // This function needs an additional mapping variable to work, which is not declared here.
  }

  function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
      // This function needs allowance and approve to be implemented, which are not implemented here.
  }
}