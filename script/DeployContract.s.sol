// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {ContractV1} from "../src/ContractV1.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployContract is Script {
    function run() external returns (address) {
        address proxy = deployContract();
        return proxy;
    }

    function deployContract() public returns (address) {
        ContractV1 contractv1 = new ContractV1();

        ERC1967Proxy proxy = new ERC1967Proxy(address(contractv1), "");

        return address(proxy);
    }
}
