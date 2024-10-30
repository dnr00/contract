// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "../src/Faucet.sol";

contract DeployFaucet is Script {
    function run() external {
        vm.startBroadcast();
        new Faucet(); // Faucet 컨트랙트 배포
        vm.stopBroadcast();
    }
}