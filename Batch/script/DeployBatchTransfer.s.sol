// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/BatchTransfer.sol";

contract DeployBatchTransfer is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        BatchTransfer batchTransfer = new BatchTransfer();

        console.log("BatchTransfer deployed to:", address(batchTransfer));

        vm.stopBroadcast();
    }
}