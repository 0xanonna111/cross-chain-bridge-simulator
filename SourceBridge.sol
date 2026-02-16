// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SourceBridge is Ownable {
    IERC20 public token;

    event Locked(address indexed user, uint256 amount, uint256 timestamp);
    event Unlocked(address indexed user, uint256 amount, uint256 timestamp);

    constructor(address _token) Ownable(msg.sender) {
        token = IERC20(_token);
    }

    function lock(uint256 _amount) external {
        require(_amount > 0, "Amount must be > 0");
        token.transferFrom(msg.sender, address(this), _amount);
        emit Locked(msg.sender, _amount, block.timestamp);
    }

    function unlock(address _user, uint256 _amount) external onlyOwner {
        token.transfer(_user, _amount);
        emit Unlocked(_user, _amount, block.timestamp);
    }
}
