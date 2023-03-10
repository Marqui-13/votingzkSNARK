pragma solidity >=0.5.0 <0.9.0;
import "./Verifier.sol";

contract PrivateTransaction {

  uint256 public value;
  address public sender;
  address public recipient;

  constructor(uint256 _value, address _recipient) public {
    value = _value;
    sender = msg.sender;
    recipient = _recipient;
  }

  function verifyProof(
    uint256[2] memory a,
    uint256[2][2] memory b,
    uint256[2] memory c,
    uint256[1] memory input
  ) public view returns (bool) {
    Verifier verifier = Verifier(0x123...); // address of the Verifier contract
    return verifier.verify(a, b, c, input);
  }
}
