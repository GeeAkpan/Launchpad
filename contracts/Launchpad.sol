// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
import "./TokenA.sol";
import "./TokenB.sol";


contract Launchpad {

    //Owner Address
    address public owner;

    // Deposit and allocation mapping
    mapping(address => uint256) public deposit;
    mapping(address => uint256) public rewardallocation;
    uint256 value;

    //Token A and Token B
    address public TokenA;
    address public TokenB;

    //Timing
    uint public starterTime;
    uint public endertime;
    uint public duration = starterTime - endertime;


    //User Balance
    mapping(address => uint256) public balances;
    address[] holders;


    constructor(uint _starterTime, uint _enderTime){
        starterTime = _starterTime;
        endertime = _enderTime;
        owner = msg.sender;
    }

    // Deposit Token A to receive Token B

    function deposit() public payable {
        require(block.timestamp < _startertime, "Project has not started!");
        require(block.timestamp > _endertime, "Project has ended!");
        
        if(!owner[msg.sender]){
            owner[msg.sender] = true;
            holders.push(msg.sender);
        }
        value += msg.value;
        rewardallocation[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function TokenClaim() public{
        require(owner[msg.sender] != true, "You are not a token holder");
        require(block.timestamp < _endertime, "Project is still on");
        uint _allocation = (balances[msg.sender] * rewardallocation)/
    }


    function withdraw() external(){};

    function emergencywithdrawal() external(){};


    //  function deposit(uint amount) external {
    //     require(block.timestamp >= startTime && block.timestamp <= endTime, "Launch pad not active");
    //     require(amount > 0, "Amount must be greater than 0");

    //     // Transfer Token A from user to contract
    //     require(IERC20(tokenA).transferFrom(msg.sender, address(this), amount), "Token A transfer failed");

    //     // Calculate user's allocation of Token B
    //     uint allocation = (amount * totalTokens) / IERC20(tokenA).totalSupply();
    //     allocations[msg.sender] += allocation;
    //     deposits[msg.sender] += amount;
    // }


}
