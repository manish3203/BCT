//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract WavePortal {
    uint256 totalWaves;
    struct Wave{
        address sender;
        string message;
    }
    Wave[] waves;
    event NewWave(address indexed sender, string message);
    function wave(string memory _message) public {
        totalWaves += 1;
        waves.push(Wave(msg.sender, _message));
        emit NewWave(msg.sender, _message);
    }
    function getTotalWaves() public view returns(uint256) {
        return totalWaves;
    }
    function getWaves() public view returns (Wave[] memory){
        return waves;
    }
}