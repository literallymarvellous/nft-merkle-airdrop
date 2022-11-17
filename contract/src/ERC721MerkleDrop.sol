// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract ERC721MerkleDrop is ERC721 {
    bytes32 public immutable root;

    constructor(string memory name, string memory symbol, bytes32 merkleroot) ERC721(name, symbol) {
        root = merkleroot;
    }

    function redeem(address account, uint256 tokenId, bytes32[] calldata proof) external {
        require(_verify(_leaf(account, tokenId), proof), "Invalid merkle proof");
        _safeMint(account, tokenId);
    }

    function _leaf(address account, uint256 tokenId) public pure returns (bytes32) {
        return keccak256(bytes.concat(keccak256(abi.encode(account, tokenId))));
    }

    function _verify(bytes32 leaf, bytes32[] memory proof) internal view returns (bool) {
        return MerkleProof.verify(proof, root, leaf);
    }
}
