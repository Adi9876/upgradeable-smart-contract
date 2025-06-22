// SPDX-License-Identifier: LICENSE MIT
pragma solidity 0.8.20;

contract ContractV2 {
    uint256 internal number;

    function getNumber() public view returns (uint256) {
        return number;
    }

    function version() public pure returns (uint256) {
        return 2;
    }

    function setNumber(uint256 _number) external {
        // number = _number;
    }
}
