# Foundry Fuzz example 

Basic fuzzing example using Foundry. 

The fuzzer needs to find an input "x" that its hash matches a target hash:

```solidity 
 function guess(uint256 x) external {
        bytes32 res = keccak256(abi.encode(x));
        bytes32 target = 0x7deec352094c4f5d50b0fe6c562906680f1d94c31271fee888a7033a8c6bbe6b;

        if (res == target) {
            (bool success,) = msg.sender.call{value: address(this).balance}("");
            require(success, "Transfer failed.");
        }
    }
```

* The fuzzer finds it because the target for x is relatively small (111111), it would not find a big and random enough parameter.

## Note
It can take a couple of minutes (depending on your machine) to find the target. If it doesn't find it increase the number of runs or run it again. 

