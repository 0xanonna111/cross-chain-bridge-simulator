// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WrappedToken is ERC20, Ownable {
    constructor() ERC20("Wrapped Asset", "W-AST") Ownable(msg.sender) {}

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) external onlyOwner {
        _burn(from, amount);
    }
}

contract DestinationBridge is Ownable {
    WrappedToken public wrappedToken;

    event Minted(address indexed user, uint256 amount);
    event Burned(address indexed user, uint256 amount);

    constructor(address _wrappedToken) Ownable(msg.sender) {
        wrappedToken = WrappedToken(_wrappedToken);
    }

    function handleMint(address _user, uint256 _amount) external onlyOwner {
        wrappedToken.mint(_user, _amount);
        emit Minted(_user, _amount);
    }

    function initiateWithdraw(uint256 _amount) external {
        wrappedToken.burn(msg.sender, _amount);
        emit Burned(msg.sender, _amount);
    }
}
