//SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract FunctionScopes {

    // contract storage - called class variables in OOP
    mapping(address => uint) public balanceReceived;

    // stores the address of the owner of the contract
    // this will be used in the constructor
    address payable public owner;

    // constructors are only called once during contract deployment
    // this will set the storage variable owner to the person who deploys it
    constructor() {
        owner = payable(msg.sender);
    }

    // function to destroy the contract!
    // it verifies the transaction is coming from the owner
    function destroySmartContract() public {
        require(msg.sender == owner, "you're not the owner, you can not destroy this contract!");
        selfdestruct(owner);
    }

    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enough funds.");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    // update to the anonymous function
    // if this didn't exist you would not be able send money to this contract
    // considered a 'fallback' function
    receive() external payable {
        receiveMoney();
    }
}
