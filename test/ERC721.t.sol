// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {TomiNFT} from "../src/ERC721.sol";

contract ERC721Test is Test {
    TomiNFT nft;
    address user = address(0x123);

    function setUp() public {
        nft = new TomiNFT();
    }

    //////@dev function for test mint
    function testMintNFT() public {
        nft.addWhiteList(address(this));
        nft.MintNFT(address(this));
        assertEq(nft.balanceOf(address(this)), 2);
    }

    ///////@dev test list user
    function testListUser() public {
        nft.addWhiteList(user);
    }

    ////////@dev test mint user
    function testMintUser() public {
        nft.MintNFT(user);
        assertEq(nft.balanceOf(user), 1);
    }

    // ////@dev test delete user from list
    // function testDelete() public {
    //     nft.removeWhiteList(user);
    // }
}
