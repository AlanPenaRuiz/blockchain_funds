// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ethSend {
    constructor() payable {}
    receive() external payable {}

    //events
    event sendStatus(bool);
    event callStatus(bool, bytes);

    /*
    transfer
    address.transfer()
    throws on failure
    forwards 2,300 gas stipend (not adjustable), safe against reentrancy
    should be used in most cases as it's the safest way to send ether
    */
    function sendViatransfer(address payable _to) public payable {
        _to.transfer(1 ether);
    }

    /*
    send
    address.send()
    returns false on failure
    forwards 2,300 gas stipend (not adjustable), safe against reentrancy
    should be used in rare cases when you want to handle failure in the contract
    */
    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(1 ether);
        emit sendStatus(sent);
        require(sent == true, "transaction failed");    }

    /*
    call
    address.call.value().gas()()
    returns false on failure
    forwards all available gas (adjustable), not safe against reentrancy
    should be used when you need to control how much gas to forward when sending ether or to call a function of another contract
    */
    function sendViaCall(address payable _to) public payable {
        (bool sucess, bytes memory data) = _to.call{value: 1 ether}("");
        emit callStatus(sucess, data);
        require(sucess == true, "transaction failed");
    }
}

contract ethReceiver {
    event log(uint amount, uint gas);

    receive() external payable {
        emit log(address(this).balance, gasleft());
    }
}
