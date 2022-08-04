# Event-Organization-Contract

# 3 main subjects - Event, Organizer , Buyer

To begin with first we create a struct Event which includes all the attributes of Event.

Then we create 2 mappings:-
   i) uint to event
   ii) key will be address and event id and value will be number of tickets
   
Next we initialize a var NextId = 1 and begin with our function createEvent (to be used by Organizer)
   - We check the date and ticketcount
   - Map that event to our id and increase id by 1
   
Our next function will be buyTicket which the buyer will use to buy tickets of a particular event
  - Make this function payable as there will be transfer of Eth
  - First we have to check if the event exists or not and whether it is over or not
  - Then we check whether the price the buyer is paying is equal to price set by organizer
  - If it matches then assign those tickets as per our second(ii) mapping
  - Decrease the tickets of that event by quantity(buyer has bought)
  
  
Last function will be transferTicket (if the user wants to transfer tickets to his boyfriend or girlfriend, idc)
  - First we check about the event
  - Then we check if user has that many tickets to send
  - Then we make use of our second mapping to make new entry
  - And now again make use of that mapping to change the number of tickets from senders address
  
#Done
  
