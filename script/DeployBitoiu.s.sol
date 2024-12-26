//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BitoiuToken} from "../src/BitoiuToken.sol";

contract DeployBitoiu is Script {
    uint256 public constant INITIAL_SUPPLY = 1_000_000 ether;

    function run() external returns (BitoiuToken) {
        vm.startBroadcast();
        BitoiuToken bToken = new BitoiuToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return bToken;
    }
}
