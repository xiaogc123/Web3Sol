// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Variables {
    // State variables are stored on the blockchain.
    string public text = "Hello";
    uint256 public num = 123;

  function doSth() public {
     uint256 i = 456;
     uint256 timestamp = block.timestamp;
     address sender = msg.sender;
  }
}

contract Constants {
    address public constant MY_ADDRESS =
        0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint256 public constant MY_UINT = 123;
}

contract Immutable {
    // coding convention to uppercase constant variables
    address public immutable MY_ADDRESS;
    uint256 public immutable MY_UINT;
    uint8 public immutable ANOTHER_UINT;

    constructor(uint256 _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
        ANOTHER_UINT = 1;
    }
}

contract SimpleStorage {
    uint256 public num;
    function set(uint256 _num) public {
        num = _num;
    }
    function get() public view returns (uint256)  {
        return num;
    }
}