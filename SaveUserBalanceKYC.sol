// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract SaveUserBalanceKYC {
    struct UserDetail {
        string userName;
        uint256 userAge;
    }

    // Mapping of address to Struct
    mapping(address => UserDetail) public usersDetail;

    //mapping of address to uint256
    mapping(address => uint256) public balances;
    address public owner = msg.sender;

    // functions that saves the amount a user is depositing into a mapping
    function deposit(uint256 amount) public {
        balances[msg.sender] += amount;
    }

    // function that searches for user balance inside the mapping and returns the balance of who calls the contract.
    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // function that saves the details of the user calling the smart contract into defined struct
    function setUserDetails(string calldata name, uint256 age) public {
        usersDetail[msg.sender] = UserDetail({userName: name, userAge: age});
    }

    // function retrieves and returns the details saved for the user calling the contract.
    function getUserDetail() public view returns (string memory, uint256) {
        UserDetail memory userDetail = usersDetail[msg.sender];
        return (userDetail.userName, userDetail.userAge);
    }
}
