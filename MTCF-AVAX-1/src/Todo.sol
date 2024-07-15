// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract Todo {

    error ONLY_THE_OWNER_CAN_CALL_THIS_FUNCTION();
    
    struct TodoList{
        string title;
        string description;
        bool isCompleted;
    }

    TodoList[] public todo;

    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function onlyOwner() private view {
        if (msg.sender != owner){
            revert ONLY_THE_OWNER_CAN_CALL_THIS_FUNCTION();
        }
    }

    function createTodo(string calldata _title, string calldata _description) external  {
        onlyOwner();
        todo.push(TodoList(_title,_description,false));
    }

    function updateTodo(uint _index, string calldata _title, string calldata _description) external  {
        onlyOwner();
        require(_index < todo.length, "Index out of bounds.");
        todo[_index] = TodoList(_title, _description, false);
    }

    function markTodo(uint _index) external  {
        onlyOwner();
        require(_index < todo.length, "Index out of bounds.");
        todo[_index].isCompleted =!todo[_index].isCompleted;
    }

    function getTodo(uint _index) external view returns(string memory, string memory, bool){
        require(_index < todo.length, "Index out of bounds.");
        TodoList memory todos = todo[_index];
        return (todos.title, todos.description, todos.isCompleted);
    }

    function deleteTodo(uint _index) external  {
        onlyOwner();
        require(_index < todo.length, "Index out of bounds.");
        delete todo[_index];
    }

    function getAllTodo() external view returns(TodoList[] memory){
        return todo;
    }

    // Internal consistency check using assert
    function checkConsistency() external view {
        onlyOwner();
        uint256 expectedLength = todo.length;
        for (uint i = 0; i < todo.length; i++) {
            assert(todo[i].isCompleted == false || todo[i].isCompleted == true);
        }
        if (expectedLength!= todo.length) {
            revert("Array length inconsistency detected.");
        }
    }

}
