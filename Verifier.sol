pragma solidity >=0.5.0 <0.9.0;
import "./ZkSnarkCircuit.sol";

contract Verifier {
  function verify(
    uint256[2] memory a,
    uint256[2][2] memory b,
    uint256[2] memory c,
    uint256[1] memory input
  ) public view returns (bool) {
    ZkSnarkCircuit circuit = new ZkSnarkCircuit();
    return circuit.verifyProof(a, b, c, input);
  }
}
