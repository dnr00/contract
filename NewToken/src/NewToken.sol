// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin-contracts-5.0.2/token/ERC20/ERC20.sol";
import "@openzeppelin-contracts-5.0.2/access/Ownable.sol";

contract NewToken is ERC20 {
    constructor(string memory name_, string memory symbol_, uint256 mintedTokens_) ERC20(name_, symbol_) {
        _mint(msg.sender, mintedTokens_);
    }
}