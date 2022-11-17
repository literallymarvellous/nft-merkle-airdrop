// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "src/ERC721MerkleDrop.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract ERC721MerkleDropTest is Test {
    ERC721MerkleDrop merkleDrop;

    // the following addresses where used to build a merkle in the merkle-tree folder
    address alice;
    address bob;
    address joe;
    address mark;

    // generated root
    bytes32 root = 0x42667d1686658f8eecf9e09cc3c9cd83ead2ff3b6259b6179c9172ff361bcdf7;

    function setUp() external {
        alice = vm.addr(1);
        bob = vm.addr(2);
        joe = vm.addr(3);
        mark = vm.addr(4);

        merkleDrop = new ERC721MerkleDrop("Marvel", "MAR", root);
    }

    function testRedeem() public {
        // proof for alice addres generated in merkle-tree
        bytes32[] memory proof = new bytes32[](2);
        proof[0] = 0xc9cc092282e336f9803807fe3d73726ca87310ca15e76ff222058356cf67ca5a;
        proof[1] = 0xc3d3896aea00728253b757853d7feb0b86f1a89e717a8b5c4ed0f9369623a6a0;

        merkleDrop.redeem(alice, 1, proof);

        assertEq(merkleDrop.balanceOf(alice), 1);
    }
}
