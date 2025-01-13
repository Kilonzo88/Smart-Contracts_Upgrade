// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {CircleV2} from "src/CircleV2.sol";
import {CircleV1} from "src/CircleV1.sol";

contract UpgradeCircle is Script {
  
    function run () external returns (address) {
        address mostRecentDeployment = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);

        vm.startBroadcast();
        CircleV2 newCircle = new CircleV2();
        vm.stopBroadcast();

        address proxy = upgradeCircle(mostRecentDeployment, address(newCircle));
        return proxy;
    }

    function upgradeCircle(address proxyAddress, address newCircle) public returns (address) {
        vm.startBroadcast();
        CircleV1 proxy = CircleV1(proxyAddress);
        proxy.upgradeToAndCall(address(newCircle),""); // proxy contract now points to this new address
        vm.stopBroadcast();
        
        return proxyAddress;
    }


}