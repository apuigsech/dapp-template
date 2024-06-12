// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "@openzeppelin/access/Ownable.sol";

/// @title A simple counter smart contract that allows incrementing, decrementing, and setting a number, with access control.
contract Counter is Ownable {
    /// @notice The current value of the counter
    uint256 public number;

    /// @notice Initializes the contract with an initial number.
    /// @param initialNumber The initial value of the counter.
    constructor(uint256 initialNumber) Ownable(msg.sender) {
        number = initialNumber;
    }

    /// @notice Sets the counter to a new number.
    /// @dev This function can only be called by the owner of the contract.
    /// @param newNumber The new value to set the counter to.
    function set(uint256 newNumber) public onlyOwner {
        number = newNumber;
    }

    /// @notice Returns the current value of the counter.
    /// @return The current value of the counter.
    function get() public view returns (uint256) {
        return number;
    }

    /// @notice Increments the counter by 1.
    function inc() public {
        number++;
    }

    /// @notice Decrements the counter by 1, if the counter is greater than 0.
    function dec() public {
        if (number > 0) {
            number--;
        }
    }
}