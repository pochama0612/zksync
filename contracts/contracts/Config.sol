// SPDX-License-Identifier: MIT OR Apache-2.0

pragma solidity ^0.7.0;


/// @title zkSync configuration constants
/// @author Matter Labs
contract Config {

    /// @dev ERC20 token withdrawal gas limit, used only for complete withdrawals
    uint256 constant ERC20_WITHDRAWAL_GAS_LIMIT = 250000;

    /// @dev ETH token withdrawal gas limit, used only for complete withdrawals
    uint256 constant ETH_WITHDRAWAL_GAS_LIMIT = 10000;

    /// @dev Bytes in one chunk
    uint8 constant CHUNK_BYTES = 9;

    /// @dev zkSync address length
    uint8 constant ADDRESS_BYTES = 20;

    uint8 constant PUBKEY_HASH_BYTES = 20;

    /// @dev Public key bytes length
    uint8 constant PUBKEY_BYTES = 32;

    /// @dev Ethereum signature r/s bytes length
    uint8 constant ETH_SIGN_RS_BYTES = 32;

    /// @dev Success flag bytes length
    uint8 constant SUCCESS_FLAG_BYTES = 1;

    /// @dev Max amount of tokens registered in the network (excluding ETH, which is hardcoded as tokenId = 0)
    uint16 constant MAX_AMOUNT_OF_REGISTERED_TOKENS = 128 - 1;

    /// @dev Max account id that could be registered in the network
    uint32 constant MAX_ACCOUNT_ID = (2 ** 24) - 1;

    /// @dev Expected average period of block creation
    uint256 constant BLOCK_PERIOD = 15 seconds;

    /// @dev ETH blocks verification expectation
    /// @dev Blocks can be reverted if they are not verified for at least EXPECT_VERIFICATION_IN.
    /// @dev If set to 0 validator can revert blocks at any time.
    uint256 constant EXPECT_VERIFICATION_IN = 0 hours / BLOCK_PERIOD;

    uint256 constant NOOP_BYTES = 1 * CHUNK_BYTES;
    uint256 constant DEPOSIT_BYTES = 6 * CHUNK_BYTES;
    uint256 constant TRANSFER_TO_NEW_BYTES = 6 * CHUNK_BYTES;
    uint256 constant PARTIAL_EXIT_BYTES = 6 * CHUNK_BYTES;
    uint256 constant TRANSFER_BYTES = 2 * CHUNK_BYTES;
    uint256 constant FORCED_EXIT_BYTES = 6 * CHUNK_BYTES;

    /// @dev Full exit operation length
    uint256 constant FULL_EXIT_BYTES = 6 * CHUNK_BYTES;

    /// @dev OnchainWithdrawal data length
    uint256 constant ONCHAIN_WITHDRAWAL_BYTES = 1 + 20 + 2 + 16; // (uint8 addToPendingWithdrawalsQueue, address _to, uint16 _tokenId, uint128 _amount)

    /// @dev ChangePubKey operation length
    uint256 constant CHANGE_PUBKEY_BYTES = 6 * CHUNK_BYTES;

    /// @dev Expiration delta for priority request to be satisfied (in seconds)
    /// @dev NOTE: Priority expiration should be > (EXPECT_VERIFICATION_IN * BLOCK_PERIOD), otherwise incorrect block with priority op could not be reverted.
    uint256 constant PRIORITY_EXPIRATION_PERIOD = 3 days;

    /// @dev Expiration delta for priority request to be satisfied (in ETH blocks)
    uint256 constant PRIORITY_EXPIRATION = PRIORITY_EXPIRATION_PERIOD / BLOCK_PERIOD;

    /// @dev Maximum number of priority request to clear during verifying the block
    /// @dev Cause deleting storage slots cost 5k gas per each slot it's unprofitable to clear too many slots
    /// @dev Value based on the assumption of ~750k gas cost of verifying and 5 used storage slots per PriorityOperation structure
    uint64 constant MAX_PRIORITY_REQUESTS_TO_DELETE_IN_VERIFY = 6;

    /// @dev Reserved time for users to send full exit priority operation in case of an upgrade (in seconds)
    uint constant MASS_FULL_EXIT_PERIOD = 3 days;

    /// @dev Reserved time for users to withdraw funds from full exit priority operation in case of an upgrade (in seconds)
    uint constant TIME_TO_WITHDRAW_FUNDS_FROM_FULL_EXIT = 2 days;

    /// @dev Notice period before activation preparation status of upgrade mode (in seconds)
    /// @dev NOTE: we must reserve for users enough time to send full exit operation, wait maximum time for processing this operation and withdraw funds from it.
    uint constant UPGRADE_NOTICE_PERIOD = MASS_FULL_EXIT_PERIOD + PRIORITY_EXPIRATION_PERIOD + TIME_TO_WITHDRAW_FUNDS_FROM_FULL_EXIT;
}
