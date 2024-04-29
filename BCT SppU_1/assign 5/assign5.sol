// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
    contract Voting {
        struct Candidate {
        string name;
        uint256 voteCount;
        }
    mapping(uint256 => Candidate) public candidates;
    uint256 public candidatesCount;
    mapping(address => bool) public voters;
    event Vote(address indexed voter, uint256 indexedcandidateId);
    constructor() {
        candidatesCount = 0;
    }
    function addCandidate(string memory _name)
    public {
        candidatesCount++;
        candidates[candidatesCount] = Candidate({ name: _name, voteCount: 0 });
    }
    function vote(uint256 _candidateId) public {
        require(_candidateId > 0 && _candidateId <=  candidatesCount, "Invalid candidate ID");
        require(!voters[msg.sender], "Already voted");
        candidates[_candidateId].voteCount++;
        voters[msg.sender] = true;
        emit Vote(msg.sender, _candidateId);
    }
}
