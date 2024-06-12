// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

import {Ownable} from "@openzeppelin/access/Ownable.sol";

contract CounterTest is Test {
    Counter public counter;
    address admin = address(0x1);
    address user = address(0x2);

    function setUp() public {
        vm.prank(admin);
        counter = new Counter(1);
    }

    function test_SetNumber() public {
        vm.startPrank(admin);
        counter.set(42);
        assertEq(counter.get(), 42);
        vm.stopPrank();
    }

    function test_UnauthorizedSetNumber() public {
        vm.startPrank(user);
        vm.expectRevert(
            abi.encodeWithSelector(
                Ownable.OwnableUnauthorizedAccount.selector,
                user
            )
        );
        counter.set(42);
        vm.stopPrank();
    }

    function test_Increment() public {
        vm.startPrank(user);
        counter.inc();
        assertEq(counter.get(), 2);
        vm.stopPrank();
    }

    function test_Decrement() public {
        vm.startPrank(user);
        counter.dec();
        assertEq(counter.get(), 0);
        vm.stopPrank();
    }
}