// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {TomiNFT} from "../src/ERC721.sol";

contract ERC721Test is Test {
    TomiNFT nft;
    address user = address(0x123);

    function setUp() public {
        nft = new TomiNFT("https://ipfs.io");
    }

    //////@dev function for test mint
    function testMintNFT() public {
        nft.addWhiteList(address(this));
        nft.MintNFT(address(this));
        assertEq(nft.balanceOf(address(this)), 2);
    }

    ////////@dev test mint user and list user
    function testMintUser() public {
        nft.addWhiteList(address(this));
        nft.addWhiteList(user);
        nft.MintNFT(user);
        assertEq(nft.balanceOf(user), 1);
        nft.isWhiteListed(user);
    }

    ////@dev test delete user from list
    function testDelete() public {
        nft.removeWhiteList(user);
    }

    function testChangeURI() public {
        nft.changeTokenURI("https://ipfs.io");
    }

    function testWithdraw() public {
        nft.withdraw();
    }
}
