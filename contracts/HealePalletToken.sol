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

contract HealePalletToken is ERC721URIStorage, Ownable {
    string private constant TOKEN_NAME = "HEALE: Pallet Token";
    string private constant TOKEN_SYMBOL = "HEPALLID";

    constructor() ERC721(TOKEN_NAME, TOKEN_SYMBOL) Ownable(msg.sender){}

    /**
     * @dev Mints a new token with the specified ID and metadata URI to the given address.
     * @param to The address to which the token will be minted.
     * @param tokenId The ID of the token to be minted.
     * @param tokenURI The metadata URI of the token to be minted.
     */
    function mintTo(address to, uint256 tokenId, string memory tokenURI) external onlyOwner {
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
    }

   
}