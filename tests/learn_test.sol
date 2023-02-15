// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../contracts/learn.sol";
import "../.deps/npm/hardhat/console.sol";


contract LearnTest {

    /// #value: 10000
    function runTest() public payable {
        Learn l = new Learn(address(this));

        console.log("gasLeft: %d", gasleft());
        // bytes memory payload = abi.encodeWithSignature("test()");
        bytes memory payload;
        (bool success, bytes memory data) = address(l).call{gas: 2300, value: 100}(payload);
        console.log("gasLeft: %d", gasleft());
        console.log("success: %s", success);
    }
}
