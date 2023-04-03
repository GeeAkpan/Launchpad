// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract TokenB {
    string public name = "Token B";
    string public symbol = "TB";
    uint256 public totalSupply = 2000000;
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