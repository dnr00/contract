// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Faucet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function requestFunds(address user) public onlyOwner {
        require(user != address(0), "Invalid user address");
        uint256 sendAmount = 5 ether;
        require(address(this).balance >= sendAmount, "Insufficient funds in the faucet");

        (bool sent, ) = user.call{value: sendAmount}("");
        require(sent, "Failed to send Ether");
    }

    receive() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdrawAll() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}
