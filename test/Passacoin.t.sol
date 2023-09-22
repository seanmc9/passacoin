// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Passacoin} from "../src/Passacoin.sol";

contract PassacoinTest is Test {
    Passacoin public passacoin;
    address public constant CREATOR_ADDRESS_1 = 0xd698e31229aB86334924ed9DFfd096a71C686900;
    address public constant USER_ADDRESS_1 = 0xc109636a2b47f8b290cc134dd446Fcd7d7e0cC94;
    uint256 public constant STARTING_PRICE = 1000000 gwei;

    function setUp() public {
        vm.prank(CREATOR_ADDRESS_1);
        passacoin = new Passacoin();
    }

    function testMint1() public {
        vm.prank(CREATOR_ADDRESS_1);
        passacoin.mint();
    }

    function testMint2() public {
        vm.prank(CREATOR_ADDRESS_1);
        passacoin.mint();

        vm.deal(USER_ADDRESS_1, STARTING_PRICE*5);
        vm.prank(USER_ADDRESS_1);
        passacoin.mint{value: STARTING_PRICE*5}();
    }
}
