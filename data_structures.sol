// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract data_structures {

    // Struct customer data
    struct Customer {
        uint256 id;
        string name;
        string email;
    }

    // Variable custmer type
    Customer customer_1 = Customer(1,"Pepe", "pepe@gmail.com");

    // Fixed array 5 slots
    uint256 [5] public fixed_list_uints = [1,2,3,4,5];

    // Dinamic array
    uint256 [] dynamic_list_uints;

    // Dinamic array customer type
    Customer [] public dynamic_list_customer;

    // New data in array
    function array_modification (uint256 _id, string memory _name, string memory _email) public {
        dynamic_list_customer.push(Customer(_id, _name, _email));
    }

    // Mappings
    mapping (address => uint256) public address_uint;
    mapping (string => uint256 []) public string_list_uint;
    mapping (address => Customer) public address_data_structure;

    // Assign number to address
    function assignNumber (uint256 _number) public {
        address_uint[msg.sender] = _number;
    }

    // Assign several numbers to address
    function assignList (string memory _name, uint256 _number) public {
        string_list_uint[_name].push(_number);
    }

    // Assing structure to address
    function assignDataStructure (uint _id, string memory _name, string memory _email) public {
        address_data_structure[msg.sender] = Customer(_id, _name, _email);
    }
}
