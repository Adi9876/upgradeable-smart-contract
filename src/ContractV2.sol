// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract ContractV2 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;

    //////////////////////////////
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }
    //////////////////////////////

    function getNumber() public view returns (uint256) {
        return number;
    }

    function version() public pure returns (uint256) {
        return 2;
    }

    function setNumber(uint256 _number) external {
        number = _number;
    }

    ////////////////////////
    function _authorizeUpgrade(address newImplementation) internal override {}
    ////////////////////////
}
