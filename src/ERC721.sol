// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract TomiNFT is ERC721 {
    uint256 public NFTcount;

    constructor() ERC721("Tomi", "204") {
        NFTcount = 1;
        _mint(msg.sender, NFTcount);
    }

    function MintNFT() public {
        NFTcount++;
        _mint(msg.sender, NFTcount);
    }
}
