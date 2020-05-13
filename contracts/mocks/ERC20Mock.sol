pragma solidity ^0.6.0;

import "../token/ERC20/ERC20.sol";
import "../Initializable.sol";

// mock class using ERC20
contract ERC20MockUpgradeSafe is Initializable, ERC20UpgradeSafe {

    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public payable {
        __ERC20Mock_init(name, symbol, initialAccount, initialBalance);
    }

    function __ERC20Mock_init(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) internal initializer {
        __Context_init_unchained();
        __ERC20_init_unchained(name, symbol);
        __ERC20Mock_init_unchained(name, symbol, initialAccount, initialBalance);
    }

    function __ERC20Mock_init_unchained(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) internal initializer {


        _mint(initialAccount, initialBalance);

    }


    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public {
        _burn(account, amount);
    }

    function transferInternal(address from, address to, uint256 value) public {
        _transfer(from, to, value);
    }

    function approveInternal(address owner, address spender, uint256 value) public {
        _approve(owner, spender, value);
    }

    uint256[50] private __gap;
}
