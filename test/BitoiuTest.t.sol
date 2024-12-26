// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBitoiu} from "../script/DeployBitoiu.s.sol";
import {BitoiuToken} from "../src/BitoiuToken.sol";

contract BitoiuTest is Test {
    DeployBitoiu public deployer;
    BitoiuToken public bToken;
    address chitoiu = makeAddr("chitoiu");
    address loredana = makeAddr("loredana");
    address thirdParty = makeAddr("thirdParty");
    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployBitoiu();
        bToken = deployer.run();

        vm.prank(msg.sender);
        bToken.transfer(chitoiu, STARTING_BALANCE);
    }

    function testChitoiuBalance() public {
        assertEq(bToken.balanceOf(chitoiu), STARTING_BALANCE);
    }

    function testAllowances() public {
        uint256 initialAllowance = 1000;

        // Chitoiu approves Loredana to spend tokens on his behalf
        vm.prank(chitoiu);
        bToken.approve(loredana, initialAllowance);

        uint256 transferAmount = 500;
        vm.prank(loredana);
        bToken.transferFrom(chitoiu, loredana, transferAmount);

        assertEq(bToken.balanceOf(loredana), transferAmount);
        assertEq(bToken.balanceOf(chitoiu), STARTING_BALANCE - transferAmount);
        assertEq(bToken.allowance(chitoiu, loredana), initialAllowance - transferAmount);
    }

    function testCannotTransferMoreThanBalance() public {
        uint256 transferAmount = STARTING_BALANCE + 1;

        vm.prank(chitoiu);
        vm.expectRevert();
        bToken.transfer(loredana, transferAmount);
    }

    function testCannotTransferFromWithoutApproval() public {
        uint256 transferAmount = 500;

        vm.prank(loredana);
        vm.expectRevert();
        bToken.transferFrom(chitoiu, loredana, transferAmount);
    }

    function testTransfer() public {
        uint256 transferAmount = 10 ether;

        vm.prank(chitoiu);
        bToken.transfer(loredana, transferAmount);

        assertEq(bToken.balanceOf(chitoiu), STARTING_BALANCE - transferAmount);
        assertEq(bToken.balanceOf(loredana), transferAmount);
    }
}
