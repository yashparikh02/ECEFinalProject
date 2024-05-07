// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.11;

contract MyContract {
    uint256 number = 0;

    function setNumber(uint256 _number) public {
        number = _number;
    }

    function getNumber() public view returns (uint256){
        return number;
    }
}
