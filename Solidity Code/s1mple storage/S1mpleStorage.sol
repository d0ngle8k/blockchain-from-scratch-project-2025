// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorate{
    // favorite number get initialized to 0 if no value applied 
    uint256 public favoriteNumber; // default 0

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    // function visibility specifiers: public/private/external/internal
    // 2 method of modifier view, pure
    // Read more at https://docs.soliditylang.org/en/v0.8.30/types.html
    // Cheatsheet https://docs.soliditylang.org/en/v0.8.30/cheatsheet.html
    function retrieve() public pure returns (uint256){
        return favoriteNumber;
    }

    //  function retrieve() public view returns (uint256){
    //     return favoriteNumber;
    // }
}

