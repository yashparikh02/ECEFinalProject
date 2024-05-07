pragma solidity ^0.8.24;

interface IERC20 {
    function balanceOf(address _owner) external view returns (uint256 balance);
    function transfer(address _to, uint256 _amount) external returns (bool success);
    function transferFrom(address _from, address _to, uint256 _amount) external returns (bool success);
    function approve(address _spender, uint256 _amount) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);
}
