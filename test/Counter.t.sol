// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {TomiNFT} from "../src/ERC721.sol";

contract ERC721Test is Test {
    TomiNFT nft;

    function setUp() public {
        nft = new TomiNFT();
    }

    function testMintNFT() public {
        nft.MintNFT();
        assertEq(nft.balanceOf(address(this)), 2);
    }
}
