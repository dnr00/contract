// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/token/ERC20/IERC20.sol";

contract BatchTransfer {
    // 컨트랙트 소유자들을 관리하는 매핑
    mapping(address => bool) public owners;

    constructor() {
        owners[msg.sender] = true;
    }

    // owner인지 확인하는 modifier
    modifier onlyOwner() {
        require(owners[msg.sender], "Only an owner can call this function");
        _;
    }

    // owner 추가 함수
    function addOwner(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        owners[newOwner] = true;
    }

    // owner 제거 함수
    function removeOwner(address ownerToRemove) public onlyOwner {
        require(ownerToRemove != msg.sender, "Cannot remove yourself");
        owners[ownerToRemove] = false;
    }

    // 주소가 owner인지 확인하는 함수
    function isOwner(address account) public view returns (bool) {
        return owners[account];
    }

    // 여러 주소로 네이티브 토큰을 전송하는 함수
    function batchTransfer(address payable[] memory recipients, uint256[] memory amounts) public payable onlyOwner {
        require(recipients.length == amounts.length, "Recipients and amounts arrays must have the same length");

        uint256 totalAmount = 0;
        for (uint256 i = 0; i < amounts.length; i++) {
            totalAmount += amounts[i];
        }
        require(msg.value >= totalAmount, "Insufficient funds sent to the contract");

        for (uint256 i = 0; i < recipients.length; i++) {
            recipients[i].transfer(amounts[i]);
        }

        // 남은 금액을 함수 호출자에게 반환
        uint256 remaining = msg.value - totalAmount;
        if (remaining > 0) {
            payable(msg.sender).transfer(remaining);
        }
    }

    // 컨트랙트에 남아있는 모든 네이티브 토큰을 인출하는 함수
    function withdraw() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    // 여러 주소로 ERC20 토큰을 전송하는 함수
    function batchTransferERC20(IERC20 token, address[] memory recipients, uint256[] memory amounts) public onlyOwner {
        require(recipients.length == amounts.length, "Recipients and amounts arrays must have the same length");

        uint256 totalAmount = 0;
        for (uint256 i = 0; i < amounts.length; i++) {
            totalAmount += amounts[i];
        }

        require(token.balanceOf(address(this)) >= totalAmount, "Insufficient token balance in the contract");

        for (uint256 i = 0; i < recipients.length; i++) {
            require(token.transfer(recipients[i], amounts[i]), "Transfer failed");
        }
    }

    // ERC20 토큰을 컨트랙트로 전송하는 함수
    function depositERC20(IERC20 token, uint256 amount) public {
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
    }

    // 컨트랙트에 남아있는 ERC20 토큰을 인출하는 함수
    function withdrawERC20(IERC20 token, uint256 amount) public onlyOwner {
        require(token.transfer(msg.sender, amount), "Transfer failed");
    }
}