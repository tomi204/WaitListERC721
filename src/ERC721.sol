// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TomiNFT is ERC721, Ownable {
    uint256 public NFTcount;

    constructor() ERC721("Tomi", "204") onlyOwner {
        NFTcount = 1;
        _mint(msg.sender, NFTcount);
    }

    //////////@dev mappings

    mapping(address => bool) private _listed;

    /////////@dev modifiers

    modifier OnlyWhiteListed() {
        require(_listed[msg.sender] == true, "you need to be listed");
        _;
    }

    //////////@dev events
    event NFTMinted(address user, uint256 tokenId);

    //////////@dev functions
    function MintNFT(address _to) public OnlyWhiteListed {
        NFTcount++;
        _mint(_to, NFTcount);
        emit NFTMinted(msg.sender, NFTcount);
    }

    /////////@dev admin functions

    function addWhiteList(address _address) public onlyOwner {
        _listed[_address] = true;
    }

    function removeWhiteList(address _address) public onlyOwner {
        _listed[_address] = false;
    }
}
