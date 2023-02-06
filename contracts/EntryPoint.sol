pragma solidity ^0.8.7;

import "hardhat/console.sol"; // todo remove

struct UserOperation {
    address sender;
    uint256 nonce;
    bytes initCode;
    bytes callData;
    uint256 callGasLimit;
    uint256 verificationGasLimit;
    uint256 preVerificationGas;
    uint256 maxFeePerGas;
    uint256 maxPriorityFeePerGas;
    bytes paymasterAndData;
    bytes signature;
}

contract EntryPoint {

    struct ReturnInfo {
      uint256 preOpGas;
      uint256 prefund;
      bool sigFailed;
      uint64 validAfter;
      uint64 validUntil;
      bytes paymasterContext;
    }

    struct StakeInfo {
      uint256 stake;
      uint256 unstakeDelaySec;
    }

    struct AggregatorStakeInfo {
        address actualAggregator;
        StakeInfo stakeInfo;
    }

    function handleOps(UserOperation[] calldata ops, address payable beneficiary) public {
        console.log(ops.length);
        console.log(ops[0].sender);
    }

    function handleAggregatedOps(
        UserOpsPerAggregator[] calldata opsPerAggregator,
        address payable beneficiary
    ) public {

    }

    struct UserOpsPerAggregator {
        UserOperation[] userOps;
        IAggregator aggregator;
        bytes signature;
    }

    function simulateValidation(UserOperation calldata userOp) public {

    }

    error ValidationResult(ReturnInfo returnInfo,
        StakeInfo senderInfo, StakeInfo factoryInfo, StakeInfo paymasterInfo);

    error ValidationResultWithAggregation(ReturnInfo returnInfo,
        StakeInfo senderInfo, StakeInfo factoryInfo, StakeInfo paymasterInfo,
        AggregatorStakeInfo aggregatorInfo);

}

interface IAggregator {

    function validateUserOpSignature(UserOperation calldata userOp) external view returns (bytes memory sigForUserOp);

    function aggregateSignatures(UserOperation[] calldata userOps) external view returns (bytes memory aggregatesSignature);

    function validateSignatures(UserOperation[] calldata userOps, bytes calldata signature) view external;
}