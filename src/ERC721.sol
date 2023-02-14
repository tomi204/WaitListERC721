// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TomiNFT is ERC721, Ownable {
    uint256 public NFTcount;
    string public baseURI;

    constructor(string memory _baseURI) ERC721("Tomi", "204") {
        baseURI = _baseURI;
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
        require(NFTcount < 1000, "max NFT minted");
        require(_listed[_to] == true);
        NFTcount++;
        _mint(_to, NFTcount);
        emit NFTMinted(msg.sender, NFTcount);
    }

    /////////@dev admin functions

    function addWhiteList(address _address) public onlyOwner {
        _listed[_address] = true;
    }

    //////////@dev remove user from list
    function removeWhiteList(address _address) public onlyOwner {
        _listed[_address] = false;
    }

    ///////////@dev checj if user is listed
    function isWhiteListed(address _user) public view returns (bool) {
        return _listed[_user];
    }

    /////////@dev function for withdraw balance
    function withdraw() public payable onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    //////////@dev token uri function

    function tokenURI(
        uint256 _tokenId
    ) public view override returns (string memory) {
        require(
            _exists(_tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );
        return baseURI;
    }

    ///////////@dev function for change token uri
    function changeTokenURI(string memory _newURI) public onlyOwner {
        baseURI = _newURI;
    }
}
