// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIVotingAdvisor {

    // Predefined candidates stored in an array
    string[3] public candidates = ["Alice", "Bob", "Charlie"];

    // Voting status for each address
    mapping(address => bool) public hasVoted;

    // Vote counts for each candidate
    uint256[3] public voteCounts;

    // Function to vote for a candidate
    function vote(uint256 _candidateId) public {
        // Ensure the user has not already voted
        require(!hasVoted[msg.sender], "You have already voted.");

        // Ensure the candidateId is within valid range
        require(_candidateId >= 0 && _candidateId < candidates.length, "Invalid candidate.");

        // Mark the sender as having voted
        hasVoted[msg.sender] = true;

        // Increment the vote count for the selected candidate
        voteCounts[_candidateId]++;
    }

    // Function to get the vote count of each candidate
    function getVoteCounts() public view returns (uint256[3] memory) {
        return voteCounts;
    }

    // Function to provide voting advice
    function getVotingAdvice() public view returns (string memory) {
        // Assume the "AI" advises based on the candidate with the most votes
        uint256 maxVotes = 0;
        uint256 bestCandidateId = 0;

        for (uint256 i = 0; i < candidates.length; i++) {
            if (voteCounts[i] > maxVotes) {
                maxVotes = voteCounts[i];
                bestCandidateId = i;
            }
        }

        return candidates[bestCandidateId];
    }
}
