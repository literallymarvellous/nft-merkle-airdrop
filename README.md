# NFT merkle drop

An NFT mint using merkle tree leaves amd proofs. Built using [merkle-tree-rs](https://github.com/literallymarvellous/merkle-tree-rs) to generate merkle trees, foundry and openzeppelin [`merkleproof`]: https://docs.openzeppelin.com/contracts/4.x/api/utils#MerkleProof. proof library

## Installation

Clone the repository

` git clone git@github.com:literallymarvellous/nft-merkle-airdrop.git cd nft-merkle-airdrop`

Generate merkle tree and get proof for leaf. Generates a json containing the merkle tree.
` cd merkle-tree cargo build cargo run`

Run NFT tests
` cd contract forge build forge test`
