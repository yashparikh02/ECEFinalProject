// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SimpleContract {
    string public message;

    constructor(string memory initMessage) {
        message = initMessage;
    }

    function updateMessage(string memory newMessage) public {
        message = newMessage;
    }
}
