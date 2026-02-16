# Cross-Chain Bridge Simulator

This repository provides a conceptual and functional implementation of a cross-chain bridge. It utilizes the "Lock and Mint" mechanism, where assets are locked on a source chain and a synthetic representation (wrapped token) is minted on the destination chain.

## Bridge Architecture


* **Source Chain:** User locks their native ERC20 tokens in the Bridge contract.
* **Relayer/Validator:** An off-chain entity (simulated here) detects the lock event and triggers the destination contract.
* **Destination Chain:** The Bridge contract mints an equivalent amount of "Wrapped" tokens to the user's address.

## Features
* **Atomic Locking:** Securely holds user funds on the source.
* **Wrapped Asset Minting:** ERC20-compliant minting logic for cross-chain liquidity.
* **Burn & Unlock:** Support for the reverse process to return to the original chain.

## Security Considerations
This is a simulation. Production bridges require decentralized validator sets, MPC (Multi-Party Computation), or ZK-proofs to verify cross-chain state transitions.
