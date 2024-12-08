// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test{
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public  view{
        // assertEq(basicNft.name(), "Dogie");
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();
        assertEq(keccak256(abi.encodePacked(actualName)), keccak256(abi.encodePacked(expectedName)));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft(PUG);
    }
}
