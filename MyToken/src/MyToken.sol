// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin-contracts-5.0.2/token/ERC20/ERC20.sol";
import "@openzeppelin-contracts-5.0.2/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") Ownable(msg.sender) {
        _mint(msg.sender, initialSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}