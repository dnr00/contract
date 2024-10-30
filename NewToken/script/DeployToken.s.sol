// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Script.sol";
import "../src/NewToken.sol";

contract DeployToken is Script {
    function setUp() public {
    }

    function run() public {
        // Setup
        vm.startBroadcast();

        // Deploy
        NewToken newtoken = new NewToken("NewToken", "NEW", 10000000000);

        // Verify + End
        console2.log(newtoken.totalSupply());
        vm.stopBroadcast();
    }
}