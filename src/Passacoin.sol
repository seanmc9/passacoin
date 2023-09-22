// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/utils/Address.sol";

contract Passacoin {
    event PaymentReleased(address to, uint256 amount);

    uint256 public constant STARTING_PRICE = 1000000 gwei;

    uint256 public timesMinted;
    address[] public minters;
    address public immutable creator;

    constructor() {
        creator = msg.sender;
    }

    function mint() public payable {
        uint256 valueRequired;
        if (timesMinted == 0) {
            require(msg.sender == creator, "Passacoin: creator has to be the first mint to kick things off");
            valueRequired = 0;
        } else {
            valueRequired = (STARTING_PRICE * ((timesMinted + 1) ** 2)) + STARTING_PRICE;
        }
        require(msg.value == valueRequired, "Passacoin: incorrect amount sent");

        minters.push(msg.sender);
        timesMinted++;

        if (timesMinted > 1) {
            emit PaymentReleased(creator, STARTING_PRICE);
            emit PaymentReleased(msg.sender, valueRequired - STARTING_PRICE);

            Address.sendValue(payable(creator), STARTING_PRICE);
            Address.sendValue(payable(minters[minters.length - 1]), valueRequired - STARTING_PRICE);
        }
    }
}
