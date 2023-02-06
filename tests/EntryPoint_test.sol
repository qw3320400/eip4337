pragma solidity ^0.8.7;

import "../contracts/EntryPoint.sol";
import "hardhat/console.sol";

contract EntryPointTest {
    function runTest() public {
        EntryPoint ep = new EntryPoint();
        UserOperation[] memory ops = new UserOperation[](1);
        ops[0] = UserOperation(
            0x75De99Aeed9f2C11ca99906bEe209Fa03979518C,
            0,
            '',
            '',
            10000,
            10000,
            10000,
            10000,
            10000,
            '',
            ''
            );
        ep.handleOps(ops, payable(0));
    }
}