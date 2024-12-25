// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract EtherUnits {
    uint256 public oneWei = 1;
    bool public isOneWei=(oneWei == 1);
    uint256 public onGwei=1 gwei;
    bool public isOneGwei=(onGwei == 1e9);
    uint256 public oneEth=1 ether;
    bool public isOneEth=(oneEth == 1e18);

}

contract Gas {
    uint public  i = 0;
    function forever() public {
        while (true) {
            i+=1;
        }
    }
}

contract IfElse {
    function foo (uint256 x) public pure returns(uint256) {
        if(x<10) {
            return 0;
        } else if(x<20){
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint256 _x) public pure returns (uint256) {
        return _x <10 ? 1 : 2;
    }
}

contract Loop {
    function loop() public {
        for (uint256 i=0; i<10; i++) {
            if(i==3) {
                continue;
            }
            if(i==5) {
                break;
            }
            uint256 j;
            while (j<10) {
                j++;
            }
        }
    }
}