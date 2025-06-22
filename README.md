## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
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

