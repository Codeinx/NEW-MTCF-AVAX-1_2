# Todo Smart Contract

This Solidity smart contract implements a simple to-do list with functionality to create, update, mark, retrieve, and delete to-do items. The contract restricts these actions to the contract owner only.

## Table of Contents

- [Overview](#overview)
- [Contract Details](#contract-details)
- [Functions](#functions)
- [Error Handling](#error-handling)
- [License](#license)

## Overview

The `Todo` contract allows the owner to manage a list of tasks. Each task has a title, description, and completion status. The owner can perform the following actions:

- Create a new task
- Update an existing task
- Mark a task as completed or incomplete
- Retrieve details of a specific task
- Retrieve all tasks
- Delete a task
- Check internal consistency of the task list

## Contract Details

### State Variables

- `TodoList[] public todo`: An array of `TodoList` structs that holds the tasks.
- `address private owner`: The address of the contract owner.

### Structs

- `struct TodoList`: A structure representing a task with the following fields:
  - `string title`: The title of the task.
  - `string description`: The description of the task.
  - `bool isCompleted`: The completion status of the task.

## Functions

### Constructor

- `constructor()`: Sets the contract deployer as the owner.

### Modifiers

- `onlyOwner()`: Ensures that only the owner can call specific functions.

### Public and External Functions

- `function createTodo (string calldata _title, string calldata _description) external`: Creates a new task with the given title and description.
- `function updateTodo (uint _index, string calldata _title, string calldata _description) external`: Updates the task at the specified index with new title and description.
- `function markTodo (uint _index) external`: Toggles the completion status of the task at the specified index.
- `function getTodo (uint _index) external view returns (string memory, string memory, bool)`: Returns the details (title, description, completion status) of the task at the specified index.
- `function deleteTodo (uint _index) external`: Deletes the task at the specified index.
- `function getAllTodo () external view returns (TodoList[] memory)`: Returns all tasks.
- `function checkConsistency () external view`: Checks the internal consistency of the task list.

### Error Handling

- `error ONLY_THE_OWNER_CAN_CALL_THIS_FUNCTION()`: Reverts if a non-owner tries to call restricted functions.

### License

This contract is licensed under the MIT License. See the SPDX identifier at the top of the contract code for more details.