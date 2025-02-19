// ============================
// Foundry Deployment Script
// ============================
// Save this as `script/DeployRebase.s.sol`

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/RebaseToken.sol";

contract DeployRebase is Script {
    function run() external {
        vm.startBroadcast();
        new RebaseToken();
        vm.stopBroadcast();
    }
}
