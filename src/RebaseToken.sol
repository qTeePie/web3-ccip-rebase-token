// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RebaseToken is ERC20, Ownable {
    uint256 public rebaseFactor = 100; // Start at 100% (1x supply)
    uint256 public lastRebaseTime;
    uint256 public rebaseInterval = 1 days; // Adjustable rebase period

    constructor() ERC20("RebaseToken", "RBT") {
        _mint(msg.sender, 10000 * 10 ** decimals()); // Initial supply
        lastRebaseTime = block.timestamp;
    }

    function rebase(bool increase) external onlyOwner {
        require(block.timestamp >= lastRebaseTime + rebaseInterval, "Rebase not ready");
        lastRebaseTime = block.timestamp;

        uint256 supplyChange = (totalSupply() * 5) / 100; // 5% rebase up or down
        if (increase) {
            _mint(address(this), supplyChange);
        } else {
            _burn(address(this), supplyChange);
        }
    }

    function setRebaseInterval(uint256 interval) external onlyOwner {
        rebaseInterval = interval;
    }
}
