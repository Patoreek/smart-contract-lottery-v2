//SPDX-License-Identifier
pragma solidity ^0.8.19;

/**
 * @title A sample Raffle Contract
 * @author Patrick Minda
 * @notice This contract is for creating a simple raffle
 * @dev Implements Chainlink VRFv2.5
 */
contract Raffle {
    // Errors
    error Raffle__SendMoreToEnterRaffle();

    uint256 private immutable i_entranceFee;
    // @dev The duration of the lottery in seconds
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_timestamp;

    // Events
    event RaffleEntered(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_timestamp = block.timestamp;
    }

    function enterRaffle() external payable {
        if (msg.value < i_entranceFee) revert Raffle__SendMoreToEnterRaffle();
        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);
    }

    function pickWinner() external payable {
        // if (block.timestamp - s_lastTimeStamp < i_interval) {
        //     revert();
        // }
    }

    /** Getters */
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
