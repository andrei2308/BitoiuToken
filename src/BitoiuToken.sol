//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract BitoiuToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Bitoiu", "BIT") {
        _mint(msg.sender, initialSupply);
    }
}
