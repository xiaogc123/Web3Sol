// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Mapping{
    mapping (address=>uint256) public myMap;
    function get(address _addr) public view returns (uint256) {
        return myMap[_addr];
    }

    function set(address _addr, uint256 _i) public  {
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        delete myMap[_addr];
    }
}

contract NestdMapping{
    mapping (address=> mapping (uint256 => bool)) public nested;
    function get(address _addr, uint256 _i) public view returns (bool) {
        return nested[_addr][_i];
    }

    function set(address _addr, uint256 _i, bool _bool) public  {
        nested[_addr][_i] = _bool;
    }

    function remove(address _addr, uint256 _i) public {
        delete nested[_addr][_i];
    }
}


contract Array{
    uint256[] public arr;
    uint256[] public arr2=[1,2,3];
    uint256[10] public myArray;
    function get(uint256 i) public view returns(uint256) {
        return arr[i];
    }

    function getArr() public view returns(uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        arr.push(i);
    }

    function pop() public {
        arr.pop();
    }

    function getArrLength() public view returns (uint256){
        return arr.length;
    }

    function remove(uint256 index) public {
        delete arr[index];
    }
    function examples() external {
        // create array in memory, only fixed size can be created
        uint256[] memory a = new uint256[](5);
    }

}


contract ArrayRemoveByShifting {
    uint256[] public arr;
    function remove(uint256 _index) public {
        require(_index < arr.length, "out of range");
        for (uint256 i=_index; _index<arr.length; i++) 
        {
            arr[i]=arr[i+1];
        }
        arr.pop();
    }
    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}


contract Enum {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    function get() public view  returns(Status) {
        return status;
    }

    function set(Status _status) public {
        status=_status;
    }

    function cancel() public {
        status=Status.Canceled;
    }

    function reset() public {
       delete status;
    }
}