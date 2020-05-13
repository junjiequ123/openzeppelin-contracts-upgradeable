pragma solidity ^0.6.0;

import "../utils/Pausable.sol";
import "../Initializable.sol";

contract PausableMockUpgradeSafe is Initializable, PausableUpgradeSafe {
    bool public drasticMeasureTaken;
    uint256 public count;


    constructor() public  {
        __PausableMock_init();
    }

    function __PausableMock_init() internal initializer {
        __Context_init_unchained();
        __Pausable_init_unchained();
        __PausableMock_init_unchained();
    }

    function __PausableMock_init_unchained() internal initializer {


        drasticMeasureTaken = false;
        count = 0;

    }


    function normalProcess() external whenNotPaused {
        count++;
    }

    function drasticMeasure() external whenPaused {
        drasticMeasureTaken = true;
    }

    function pause() external {
        _pause();
    }

    function unpause() external {
        _unpause();
    }

    uint256[48] private __gap;
}
