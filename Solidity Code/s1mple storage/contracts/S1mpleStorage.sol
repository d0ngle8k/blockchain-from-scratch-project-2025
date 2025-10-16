// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorate{
    // gg
    uint256 myfavoriteNumber; // default 0
    // uint256[] listofFavoriteNumbers ;  // create array

    struct Person{ // define a struct
        uint256 favNumbs;
        string name;
    }
    // Person public myniqqa = Person (7, "CJ") {
        
    // }

    // Person public mynigga = Person({favNumbs: 69, name: "Claude"});
    // Person public cj = Person({favNumbs: 69, name: "Claude"});
    // Person public claude = Person({favNumbs: 69, name: "Claude"});
    
    // Person[add_your_value_here] public listOfPeople; // define a static array 

    Person[] public listOfPeople; // define a dynamic array
    mapping(string => uint256) public nameToFavorNumber;

    function store(uint256 _favoriteNumber) public {
        myfavoriteNumber = _favoriteNumber;
    }
    function retrieve() public view returns(uint256){
        return myfavoriteNumber;
    }
    function addPerson(string calldata _name, uint256 _favoriteNumber) public {
        // Person memory newPerson = Person(_favoriteNumber, _name);
        // listOfPeople.push(newPerson);
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavorNumber [_name] = _favoriteNumber;

    }
}