use merkle_tree_rs::standard::{StandardMerkleTree, LeafType};
use std::fs;

fn main() {
    let values = vec![
        vec![
            "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf".to_string(),
            "1".to_string(),
        ],
        vec![
            "0x2B5AD5c4795c026514f8317c7a215E218DcCD6cF".to_string(),
            "2".to_string(),
        ],
        vec![
            "0x6813Eb9362372EEF6200f3b1dbC3f819671cBA69".to_string(),
            "3".to_string(),
        ],
        vec![
            "0x1efF47bc3a10a45D4B230B5d10E37751FE6AA718".to_string(),
            "4".to_string(),
        ],
    ];

    let tree = StandardMerkleTree::of(values, &["address".to_string(), "uint256".to_string()]);

    let root = tree.root();

    println!("Merkle root: {}", root);

    let proof = tree.get_proof(LeafType::Number(0));
    println!("proof: {:?}", proof);


    let tree_json = serde_json::to_string(&tree.dump()).unwrap();

    fs::write("tree.json", tree_json).unwrap();
}
