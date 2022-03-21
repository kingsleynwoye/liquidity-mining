pragma solidity ^0.7.3;

import "./UnderlyingToken.sol";
import "./LpToken.sol";
import "./GovernaceToken.sol";

contract LpToken is ERC20 {
    mapping(address => uint256) public checkpoints;
    UnderlyingToken public underlyingToken;
    GovernaceToken public governaceToken;
    uint256 public constant REWARD_PER_BLOCK = 1;

    constructor(address _underlingToken, address _governanceToken) {
        underlyingToken = UnderlyingToken(_underlingToken);
        governaceToken = GovernaceToken(_governanceToken);
    }

    function deposit(uint256 amount) external {
        if (checkpoints[msg.sender] == 0) {
            checkpoints[msg.sender] = block.number;
        }
        _distributeRewards(msg.sender);
        underlyingToken.tranferFrom(msg.sender, address(this), amount);
        _mint(msg.sender, amount);
    }

    function withdraw(uint amount) external {
        require(balanceOf(msg.sender) >= amount, 'Not enough LP tokens');
        _distributeRewards(msg.sender);
        underlyingToken.transfer(msg.sender, amount)
        _burn(msg.sender, amount);
    }

    function _distributeRewardRewards(address beneficiary) internal {
        uint checkpoint = checkpoints[beneficiary];
        if (block.number - checkpoint > 0) {
            uint distributeAmount = balanceOf(beneficiary) * (block.number - checkpoint * REWARD_PER_BLOCK; 
                governanceToken.mint(beneficiary, distributeAmount);
                checkpoints[beneficiary] = block.number;
            );
        }        
    }
}
