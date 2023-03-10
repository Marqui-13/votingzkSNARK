pragma solidity >=0.7.0 <0.9.0;

// Import the ZoKrates library for zkSNARKs
import "github.com/Zokrates/ZoKrates/contracts/verifier.sol";

contract Voting {
    // Define the structure for a voter
    struct Voter {
        bool hasVoted;
        uint256 vote;
    }

    // Define the structure for a proposal
    struct Proposal {
        bytes32 proposalHash;
        uint256 voteCount;
    }

    // Declare the public variables
    address public chairperson;
    mapping(address => Voter) public voters;
    Proposal public winningProposal;

    // Declare the private variables
    bytes32 private finalHash;
    uint256 private constant VOTE_LENGTH = 32;

    // Declare the ZoKrates verifier contract
    Verifier private verifier;

    constructor() {
        // Set the chairperson to the contract creator
        chairperson = msg.sender;
        // Initialize the ZoKrates verifier
        verifier = new Verifier();
    }

    // Function to create a proposal
    function createProposal(bytes32 proposalHash) public {
        // Ensure only the chairperson can create proposals
        require(msg.sender == chairperson, "Only the chairperson can create proposals");
        // Create the proposal and set the proposal hash
        winningProposal = Proposal({proposalHash: proposalHash, voteCount: 0});
    }

    // Function to vote
    function vote(bytes memory proof, uint[2] memory inputs) public {
        // Ensure the voter has not already voted
        require(!voters[msg.sender].hasVoted, "You have already voted");
        // Ensure the proposal has been created
        require(winningProposal.proposalHash != 0, "The proposal has not been created yet");

        // Verify the proof using ZoKrates
        require(verifier.verifyTx(proof, inputs), "Proof is not valid");

        // Store the vote
        voters[msg.sender].hasVoted = true;
        voters[msg.sender].vote = inputs[0];

        // Compute the final hash
        finalHash = keccak256(abi.encodePacked(finalHash, inputs[0]));

        // Increment the vote count for the winning proposal
        winningProposal.voteCount++;
    }

    // Function to reveal the final tally
    function revealTally(bytes memory proof, uint[2] memory inputs) public view returns (bool) {
        // Ensure the voter has already voted
        require(voters[msg.sender].hasVoted, "You have not voted yet");

        // Verify the proof using ZoKrates
        require(verifier.verifyTx(proof, inputs), "Proof is not valid");

        // Check if the final hash matches the proposal hash
        bytes32 proposalHash = winningProposal.proposalHash;
        bytes32 finalHashTemp = keccak256(abi.encodePacked(finalHash, proposalHash));
        return (finalHashTemp == bytes32(inputs[1]));
    }
}
