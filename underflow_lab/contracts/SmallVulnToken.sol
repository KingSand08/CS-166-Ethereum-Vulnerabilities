// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract SmallVulnToken {
    mapping(address => uint8) public balances;
    uint8 public totalSupply = 255; 

    constructor() {
        balances[msg.sender] = totalSupply; 
    }

    function transfer(address _to, uint8 _value) public returns (bool success) {
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
    }
}
