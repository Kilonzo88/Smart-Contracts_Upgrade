// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract CircleV1 is  Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal number;

    // We can't use constructors with our proxies

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function _initializer() public initializer {
        __Ownable_init(msg.sender); // sets owner to: owner = msg.sender
        __UUPSUpgradeable_init(); //indicate that this is a UUPS contract 
    }

    function setNumber(uint256 _number) external{
        number = _number;
    }

    function getNumber() external view returns(uint256){
        return number;
    }

    function version() external pure returns(uint256){
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}