// SPDX-License_identifier: MIT
import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
pragma solidity 0.8.19;
contract DeployFundMe is Script {
    function run() external returns (FundMe fundMe) {
       // The next line runs before the vm.startBroadcast() is called
        // This will not be deployed because the `real` signed txs are happening
        // between the start and stop Broadcast lines.
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();
    vm.startBroadcast();
    fundMe = new FundMe(ethUsdPriceFeed);
    vm.stopBroadcast();

}  

}