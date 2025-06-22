// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {ContractV2} from "../src/ContractV2.sol";
import {ContractV1} from "../src/ContractV1.sol";

contract UpgradeContract is Script {
    function run() external returns (address) {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);

        vm.startBroadcast();
        ContractV2 contractv2 = new ContractV2();
        vm.stopBroadcast();

        address proxy = upgradeContract(mostRecentlyDeployed, address(contractv2));
        return proxy;
    }

    function upgradeContract(address proxyAddress, address newContract) public returns(address){
        vm.startBroadcast();
        ContractV1 proxy = ContractV1(proxyAddress);
        proxy.upgradeToAndCall(address(newContract),"");
        vm.stopBroadcast();

        return address(proxy);
    }
}
