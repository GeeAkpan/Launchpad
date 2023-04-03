// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract TokenA {
    string public name = "Token A";
    string public symbol = "TA";
    uint256 public totalSupply = 1000000;
    mapping(address => uint256) public balances;

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        return true;
    }
}