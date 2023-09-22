// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/token/ERC20/ERC20.sol";

contract Passacoin is ERC20 {
    uint256 constant public STARTING_PRICE = 1 gwei;

    constructor(string memory name_, string memory symbol_) ERC20(name_, symbol_) {}

    function mint() public payable {
        
    }
}
