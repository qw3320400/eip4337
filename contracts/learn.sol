// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../.deps/npm/hardhat/console.sol";

contract Learn {
    address public owner;

    constructor(address o) {
        owner = o;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address o) external onlyOwner {
        owner = o;
    }

    fallback() external payable {
        console.log("gasLeft: %d", gasleft());
        console.log("fallback");
    }

    receive() external payable {
        console.log("gasLeft: %d", gasleft());
        console.log("recieve");
    }
}