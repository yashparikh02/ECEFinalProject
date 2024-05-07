// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MyContract {
    uint256 private value;

    function setValue(uint256 newValue) public {
        value = newValue;
    }

    function getValue() public view returns (uint256) {
        return value;
    }
}
