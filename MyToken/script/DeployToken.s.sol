// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Script.sol";
import "../src/MyToken.sol";

contract DeployMyToken is Script {
    
    function run() external {
        uint256 initialSupply = 1000000 * 10 ** 18; // 초기 공급량
        vm.startBroadcast();
        new MyToken(initialSupply);
        vm.stopBroadcast();
    }
}