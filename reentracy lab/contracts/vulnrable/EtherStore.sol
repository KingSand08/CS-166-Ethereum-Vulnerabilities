// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

contract SimpleEtherVault {
    mapping(address => uint256) private vault;

    function deposit() external payable {
        vault[msg.sender] += msg.value;
    }

    function withdraw() external {
        uint256 payout = vault[msg.sender];
        require(payout > 0, "No funds");

        (bool ok, ) = msg.sender.call{value: payout}("");
        require(ok, "Transfer failed");

        vault[msg.sender] = 0;
    }

    function balance() public view returns (uint256) {
        return address(this).balance;
    }
}
