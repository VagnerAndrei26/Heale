// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//  /$$   /$$ /$$$$$$$$  /$$$$$$  /$$       /$$$$$$$$
// | $$  | $$| $$_____/ /$$__  $$| $$      | $$_____/
// | $$  | $$| $$      | $$  \ $$| $$      | $$      
// | $$$$$$$$| $$$$$   | $$$$$$$$| $$      | $$$$$   
// | $$__  $$| $$__/   | $$__  $$| $$      | $$__/   
// | $$  | $$| $$      | $$  | $$| $$      | $$      
// | $$  | $$| $$$$$$$$| $$  | $$| $$$$$$$$| $$$$$$$$
// |__/  |__/|________/|__/  |__/|________/|________/


contract HealeToken is ERC20, Ownable {
    
    uint256 initialSuppply = 10000000 *10**18;
    address accesscontrol;

    
    constructor(address _access) ERC20("Heale Token", "HEALE") Ownable(msg.sender) {
        _mint( msg.sender , initialSuppply);
        setAccesscontrolAddress(_access);
    }
    
    function setAccesscontrolAddress(address _token) public onlyOwner{
        require(_token != address(0),"0 address");
        accesscontrol = _token ;
    }
}