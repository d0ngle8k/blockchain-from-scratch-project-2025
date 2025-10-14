// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorate{
    // gg
    uint256 public favoriteNumber; // default 0

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    //0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8
}