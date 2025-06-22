### Upgradable Smart Contracts

This project uses **upgradable smart contracts** to allow changes to contract logic without redeploying data or changing the contract address. We use the **UUPS proxy pattern**, supported by OpenZeppelin.

#### How It Works

- A **proxy contract** stores all data and forwards calls.
- A **logic contract** contains the actual implementation.
- When upgraded, only the logic contract changes — state remains untouched.

#### Example from official docs

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract MyContract is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 public value;

    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
        value = 0;
    }

    function setValue(uint256 newValue) external {
        value = newValue;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
```

### To get started yourself

- First install:

``` bash
forge install Openzeppelin/openzeppel
in-contracts-upgradeable 
```

- Inside `UUPSUpgradeable` the actual function that deal with the upgrabeablility is `upgradeTo()`
Also need to implement our own `_authorizeUpgrade()` function

- Also have a look at `_gap` in `UUPSUpgradeable` contract as it tells about how much storage slots can be kept for futher addition of storage variables in upgrade without effecting the current slot positions.

- Proxy do not make use of constructor so keep that in other contract

- storage is stored in the proxy not in the implementation, like borrowing from implementation

- owner an other initialzing stuff should be handled within `initialize()` unlike normally done in constructor

- The `initialize()` is almost like a constructor for proxy functions, because of the reason we need to initialize the implementation through proxy to hold on the storage.

