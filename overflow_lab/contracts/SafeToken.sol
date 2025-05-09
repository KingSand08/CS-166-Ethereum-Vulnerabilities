// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "@openzeppelin/contracts/math/SafeMath.sol";

contract SafeToken {
    using SafeMath for uint256;

    mapping(address => uint256) public balances;
    uint256 public totalSupply = 2**256 - 1;

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        balances[msg.sender] = balances[msg.sender].sub(_value); // Safe subtraction
        balances[_to] = balances[_to].add(_value); // Safe addition
        return true;
    }
}