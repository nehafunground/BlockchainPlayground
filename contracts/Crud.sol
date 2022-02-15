pragma solidity >=0.7.0 <0.9.0;

contract Crud {
    struct User {
        uint id;
        string name; 
    } 

    User[] public users;
    uint public nextId = 1;

    function create(string memory name) public {
        users.push(User(nextId,name));
        nextId++;
    }

    function read(uint userId) view public returns(uint id,string memory name) {
       uint i = findPosition(userId);
       return(users[i].id,users[i].name);
    }

    function update(uint id, string memory name) public {
       uint i = findPosition(id);
        users[i].name = name;
        return;         
    }

    function destroy(uint id) public {
        uint i = findPosition(id);
        delete users[i];
    }

    function findPosition(uint id) view internal returns (uint position){
        for(uint i = 0; i < users.length; i++){
            if(users[i].id == id){
                return id;
            }
        }
        revert("User does not exist");
    }
    
}