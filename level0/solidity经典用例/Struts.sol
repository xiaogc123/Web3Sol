// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

struct Todo {
    string text;
    bool completed;
}
contract Todos{


    Todo[] public todos;
    function create(string calldata _text) public {
        todos.push(Todo(_text, false));

        todos.push(Todo({text:_text, completed:false}));
        Todo memory todo;
        todo.text=_text;
        todos.push(todo);
    }

    function get(uint256 _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function updateText(uint256 _index, string calldata _text) public  {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }

}


contract DataLocations {
    uint256[] public arr;
    mapping (uint256=>address) myMap;
    struct MyStruct {
        uint256 foo;
    }

    mapping (uint256=>MyStruct) myStructs;

    function f() public {
        _f(arr, myMap, myStructs[1]);
        MyStruct storage myStruct = myStructs[1];
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint256[] storage _arr,
        mapping (uint256=>address) storage _map,
        MyStruct storage _myStruct
    ) internal {

    }

    function g(
        uint256[] memory _arr
    ) public  returns (uint256[] memory) {

    }

    function h(
        uint256[] calldata _arr
    ) external  {

    }
}


interface ITest {
    function val() external view returns (uint256);
    function test() external;
}


contract Callback {
    uint256 public val;

    fallback() external {
        val = ITest(msg.sender).val();
    }

    function test(address target) external {
        ITest(target).test();
    }
}

contract TestStorage {
    uint256 public val;

    function test() public {
        val = 123;
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract TestTransientStorage {
    bytes32 constant SLOT = 0;

    function test() public {
        assembly {
            tstore(SLOT, 321)
        }
        bytes memory b = "";
        msg.sender.call(b);
    }

    function val() public view returns (uint256 v) {
        assembly {
            v := tload(SLOT)
        }
    }
}

contract ReentrancyGuard {
    bool private locked;

    modifier lock() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    // 35313 gas
    function test() public lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract ReentrancyGuardTransient {
    bytes32 constant SLOT = 0;

    modifier lock() {
        assembly {
            if tload(SLOT) { revert(0, 0) }
            tstore(SLOT, 1)
        }
        _;
        assembly {
            tstore(SLOT, 0)
        }
    }

    // 21887 gas
    function test() external lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}