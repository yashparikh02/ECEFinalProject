// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.3;

contract SimpleStorage {
    uint data;
 
    function set(uint x) public {
        data = x;
    }

    function get() public view returns (uint) {
        return data;
    }
}
