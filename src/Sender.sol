// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

contract Sender {
    receive() external payable {}

    function guess(uint256 x) external {
        bytes32 res = keccak256(abi.encode(x));
        bytes32 target = 0x7deec352094c4f5d50b0fe6c562906680f1d94c31271fee888a7033a8c6bbe6b;

        if (res == target) {
            (bool success,) = msg.sender.call{value: address(this).balance}("");
            require(success, "Transfer failed.");
        }
    }
}

