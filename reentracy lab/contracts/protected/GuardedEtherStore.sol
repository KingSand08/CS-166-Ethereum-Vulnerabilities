// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract GuardedEtherVault {
    mapping(address => uint256) private balances;
    bool private locked;

    modifier noReentrant() {
        require(!locked, "No re-entrancy");
        locked = true;
        _;
        locked = false;
    }

    function safeDeposit() external payable noReentrant {
        balances[msg.sender] += msg.value;
    }

    function safeWithdraw() public noReentrant {
        uint256 bal = balances[msg.sender];
        require(bal > 0);
        (bool sent,) = msg.sender.call{value: bal}("");
        require(sent, "Ether transfer failed");
        balances[msg.sender] = 0;
    }

    function getVaultBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
