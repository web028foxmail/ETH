// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract HolderTierTaxERC20 is ERC20 {
    constructor() ERC20("HolderTierTax", "TIERTAX") {
        _mint(msg.sender, 1000000 ether);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        uint256 bal = balanceOf(msg.sender);
        uint256 fee;

        if (bal < 1000 ether) fee = 2;
        else if (bal < 10000 ether) fee = 1;
        else fee = 0;

        uint256 feeAmt = amount * fee / 100;
        _transfer(msg.sender, address(this), feeAmt);
        return super.transfer(to, amount - feeAmt);
    }
}
