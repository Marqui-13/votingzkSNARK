pragma solidity >=0.5.0 <0.9.0;

contract ZkSnarkCircuit {
  bytes32 public constant hashToMatch = 0x123...; // the hash to compare against

  function verifyProof(
    uint256[2] memory a,
    uint256[2][2] memory b,
    uint256[2] memory c,
    uint256[1] memory input
  ) public view returns (bool) {
    require(input[0] == uint256(keccak256(abi.encodePacked(msg.sender)))), "Invalid input");

    // Compute the hash of the secret value
    bytes32 computedHash = keccak256(abi.encodePacked(input[0]));
    return computedHash == hashToMatch;
  }
}
