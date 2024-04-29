//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract WavePortal {
    struct Wave{
        address sender;
        string message;
        uint256 timestamp;
    }
    Wave[] public waves;
    event NewWave(address indexed sender, string message, uint256 timestamp);
    function wave(string memory _message) public {
        waves.push(Wave(msg.sender, _message, block.timestamp));
        emit NewWave(msg.sender, _message, block.timestamp);
    }
}