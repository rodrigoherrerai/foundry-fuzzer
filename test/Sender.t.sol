// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Sender.sol";

contract SenderTest is Test {
    Sender public sender;

    function setUp() public {
        sender = new Sender();
    }

    function testFuzz(uint256 x) public {
        // We first send 1 Eth to the Sender contract.
        (bool success,) = address(sender).call{value: 1 ether}("");
        assertTrue(success);

        // We try to drain the contract.
        sender.guess(x);

        assertEq(address(sender).balance, 1 ether);
    }
}
