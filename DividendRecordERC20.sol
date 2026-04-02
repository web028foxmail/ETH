// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DividendRecordERC20 is ERC20 {
    mapping(address => uint256) public totalDividends;

    constructor() ERC20("DividendRecord", "DIVR") {
        _mint(msg.sender, 1000000 ether);
    }

    function issueDividend(address to, uint256 amount) external {
        _mint(to, amount);
        totalDividends[to] += amount;
    }
}
