pragma solidity ^0.7.3;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GovernaceToken is ERC20, Ownable {
    constructor() ERC20('Governace Token', 'GTK') Ownable() {}

    function mint(address to, uint amount) external onlyOwner() {
        _mint(to, amount);
    }
}