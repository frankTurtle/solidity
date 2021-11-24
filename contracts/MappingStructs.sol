//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract MappingsStructExample {

    // Mapping to hold the address and amount paid into the contract
    mapping (address => uint) paymentsMade;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        paymentsMade[msg.sender] += msg.value;
    }

    function withdrawAllMoney(address payable _to) public {
        // Using the Checks-Effects-Interaction pattern 👇
        uint moneyToSend = paymentsMade[_to]; // get the amount the user has sent in already
        paymentsMade[_to] = 0; // wipe it out so they can't withdraw again
        _to.transfer(moneyToSend); // send it to them
    }
}
