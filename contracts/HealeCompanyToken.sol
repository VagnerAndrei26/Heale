// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//  /$$   /$$ /$$$$$$$$  /$$$$$$  /$$       /$$$$$$$$
// | $$  | $$| $$_____/ /$$__  $$| $$      | $$_____/
// | $$  | $$| $$      | $$  \ $$| $$      | $$      
// | $$$$$$$$| $$$$$   | $$$$$$$$| $$      | $$$$$   
// | $$__  $$| $$__/   | $$__  $$| $$      | $$__/   
// | $$  | $$| $$      | $$  | $$| $$      | $$      
// | $$  | $$| $$$$$$$$| $$  | $$| $$$$$$$$| $$$$$$$$
// |__/  |__/|________/|__/  |__/|________/|________/

contract HealeCompanyToken is ERC721URIStorage, Ownable {
    string private constant TOKEN_NAME = "HEALE: Company Token";
    string private constant TOKEN_SYMBOL = "HCOMPID";
    string private tokenURIHash;

    constructor() ERC721(TOKEN_NAME, TOKEN_SYMBOL) Ownable(msg.sender) {}

    /**
     * @dev Sets the token URI hash. Can only be called by the owner.
     * @param _tokenURIHash The new token URI hash.
     */
    function setTokenURIHash(string memory _tokenURIHash) external onlyOwner {
        tokenURIHash = _tokenURIHash;
    }

    /**
     * @dev Mints a new token with the specified ID to the given address.
     * @param to The address to which the token will be minted.
     * @param tokenId The ID of the token to be minted.
     */
    function mintTo(address to, uint256 tokenId) external onlyOwner {
        require(bytes(tokenURIHash).length != 0, "Token URI hash not set");
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURIHash);
    }

    
}