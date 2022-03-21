pragma solidity ^0.7.3;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LpToken is ERC20 {
    constructor() ERC20('Lp Token', 'LTK') {}
}