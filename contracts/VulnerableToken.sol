// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract VulnerableToken {
    mapping(address => uint256) public balances;
    uint256 public totalSupply = 2**256 - 1; // Maximum uint256 value

    // Assign initial balance
    constructor() {
        balances[msg.sender] = totalSupply;
    }

    // Transfer function vulnerable to overflow/underflow
    function transfer(address _to, uint256 _value) public returns (bool success) {
        balances[msg.sender] -= _value; // Possible underflow here
        balances[_to] += _value; // Possible overflow here
        return true;
    }
}