//SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract FunctionScopes {

    mapping(address => uint) public balanceReceived;

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
