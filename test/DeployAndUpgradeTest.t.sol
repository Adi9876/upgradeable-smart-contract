// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {ContractV1} from "../src/ContractV1.sol";
import {ContractV2} from "../src/ContractV2.sol";
import {DeployContract} from "../script/DeployContract.s.sol";
import {UpgradeContract} from "../script/UpgradeContract.s.sol";

contract DeployAndUpgradeTest is Test {
    DeployContract public deployer;
    UpgradeContract public upgrader;
    address public owner = makeAddr("owner");

    address public proxy;

    function setUp() public {
        deployer = new DeployContract();
        upgrader = new UpgradeContract();
        proxy = deployer.run(); // -> to ContractV1
    }

    function test_upgrade() public {
        ContractV2 contractv2 = new ContractV2();
        upgrader.upgradeContract(proxy, address(contractv2));

        uint256 expectedValue = 2;
        assertEq(expectedValue, ContractV2(proxy).version());

        ContractV2(proxy).setNumber(7);
        assertEq(7, ContractV2(proxy).getNumber());
    }

    function test_proxyIsAtV1Initially() public {
        vm.expectRevert();
        ContractV2(proxy).setNumber(7);
    }
}

