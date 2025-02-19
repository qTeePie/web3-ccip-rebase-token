// ============================
// Foundry Test Script
// ============================
// Save this as `test/RebaseToken.t.sol`

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/RebaseToken.sol";

contract RebaseTokenTest is Test {
    RebaseToken token;
    address owner = address(1);

    function setUp() public {
        vm.startPrank(owner);
        token = new RebaseToken();
        vm.stopPrank();
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), 10000 * 10 ** token.decimals());
    }

    function testRebaseIncrease() public {
        vm.startPrank(owner);
        token.rebase(true);
        vm.stopPrank();
        assertGt(token.totalSupply(), 10000 * 10 ** token.decimals());
    }

    function testRebaseDecrease() public {
        vm.startPrank(owner);
        token.rebase(false);
        vm.stopPrank();
        assertLt(token.totalSupply(), 10000 * 10 ** token.decimals());
    }
}
