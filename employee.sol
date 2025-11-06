// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployeeData {

    // Structure to store Employee information
    struct Employee {
        uint256 id;
        string name;
        uint8 age;
        string department;
        uint256 salary;
    }

    // Array to store multiple employees
    Employee[] public employees;

    // Event for logging new employee addition
    event EmployeeAdded(uint256 id, string name);

    // Function to add a new employee
    function addEmployee(
        uint256 _id,
        string calldata _name,
        uint8 _age,
        string calldata _department,
        uint256 _salary
    ) external {
        Employee memory newEmployee = Employee({
            id: _id,
            name: _name,
            age: _age,
            department: _department,
            salary: _salary
        });

        employees.push(newEmployee);
        emit EmployeeAdded(_id, _name);
    }

    // Function to get total number of employees
    function getEmployeeCount() external view returns (uint256) {
        return employees.length;
    }

    // Function to get an employee by index
    function getEmployee(uint256 index) external view returns (
        uint256,
        string memory,
        uint8,
        string memory,
        uint256
    ) {
        require(index < employees.length, "Invalid index");
        Employee storage e = employees[index];
        return (e.id, e.name, e.age, e.department, e.salary);
    }

    // Fallback function to accept Ether
    fallback() external payable {
        // Do nothing, just accept ETH
    }

    // Receive function to handle plain Ether transfers
    receive() external payable {
        // Accept ETH silently
    }

    // Function to get contract balance
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}