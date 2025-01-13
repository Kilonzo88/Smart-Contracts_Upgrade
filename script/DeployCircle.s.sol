// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {Script} from "forge-std/Script.sol";
import {CircleV1} from "src/CircleV1.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployCircle is Script {
    function run() external returns(address) {
        address proxy = deployCircle();
        return proxy;
    }

    function deployCircle() public returns(address) {
        vm.startBroadcast();
        CircleV1 circle = new CircleV1(); //implementation logic
        ERC1967Proxy proxy = new ERC1967Proxy(address(circle), "");
        vm.stopBroadcast();
        
        return address(proxy);
        
    }
}