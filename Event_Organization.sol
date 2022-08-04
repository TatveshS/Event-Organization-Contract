// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract EventOrganization {

    struct Event{
        address Organizer;
        string name;
        uint date;
        uint price;
        uint ticketCount;
        uint ticketRemain;
    }

    mapping(uint => Event) public events;
    mapping(address => mapping(uint => uint)) public tickets; // key will be address and event id and value will be number of tickets

    uint public nextId = 1;

    function createEvent( string memory name, uint date, uint price, uint ticketCount) external {
        require(date > block.timestamp , "You can organize events only for future"); //date should with respect to block timestamp
        require( ticketCount > 0 , "You can organize event only if ticket count is more than 0" );

        events[nextId] = Event(msg.sender, name, date, price, ticketCount, ticketCount);
        nextId++;

    }

    function buyTicket(uint id , uint quantity) external payable{
        require(events[id].date != 0, "This event does not exist");
        require(events[id].date > block.timestamp , "This event has already occured");
        Event storage _event = events[id];
        require(msg.value  == (_event.price * quantity), "Ether is not enough");
        require(_event.ticketRemain >= quantity,"Not Enough Tickets");
        _event.ticketRemain -= quantity;
        tickets[msg.sender][id] = quantity;

    }

    function transferTicket(uint id, uint quantity, address to) external{
        require(events[id].date != 0, "This event does not exist");
        require(events[id].date > block.timestamp , "This event has already occured");
        require(tickets[msg.sender][id] >= quantity, "You do not have enough tickets");
        tickets[msg.sender][id] -= quantity;
        tickets[to][id] += quantity;
    }



} 
