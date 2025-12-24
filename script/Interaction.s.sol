// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function fundFundME(address mostRecentDeployedFundMe) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployedFundMe)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded FundMe with %s ETH", SEND_VALUE);
    }

    function run() external {
        vm.startBroadcast();
        address mostRecentDeployedFundMe = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
        fundFundME(mostRecentDeployedFundMe);
        vm.stopBroadcast();
    }
}

contract WithdrawFundMe is Script {
    function withdrawFundMe(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployed)).withdraw();
        vm.stopBroadcast();
        console.log("Withdraw FundMe balance!");
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
        withdrawFundMe(mostRecentlyDeployed);
    }
}
