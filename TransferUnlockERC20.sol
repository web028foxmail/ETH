// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TransferUnlockERC20 is ERC20 {
    mapping(address => uint256) public unlockTime;

    constructor() ERC20("TransferUnlock", "UNLOCK") {
        _mint(msg.sender, 1000000 ether);
    }

    function lock(uint256 secondsToLock) external {
        unlockTime[msg.sender] = block.timestamp + secondsToLock;
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(block.timestamp >= unlockTime[msg.sender], "Still locked");
        return super.transfer(to, amount);
    }
}
