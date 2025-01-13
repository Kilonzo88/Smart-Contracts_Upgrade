// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {Test} from "forge-std/Test.sol";
import {DeployCircle} from "script/DeployCircle.s.sol";
import {UpgradeCircle} from "script/UpgradeCircle.s.sol";
import {CircleV1} from "src/CircleV1.sol";
import {CircleV2} from "src/CircleV2.sol";

contract DeployAndUpgradeTest is Test {
    DeployCircle public deployer;
    UpgradeCircle public upgrader;
    address public OWNER = makeAddr("owner");

    address public proxy;

    function setUp() public {
        upgrader = new UpgradeCircle();
        deployer = new DeployCircle();
        proxy = deployer.run(); // proxy now points to CircleV1
    }

    function testUpgrade() public {
        CircleV2 circleV2 = new CircleV2();

        upgrader.upgradeCircle(proxy, address(circleV2));

        uint256 expectedValue = 2;
        assertEq(expectedValue, CircleV2(proxy).version());

        CircleV2(proxy).setNumber(8);
        assertEq(8, CircleV1(proxy).getNumber());
    }

}