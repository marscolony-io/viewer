// SPDX-License-Identifier: MIT
pragma solidity =0.8.11;

interface ICLNY {
  function burnedStats(uint256) external view returns (uint256);
  function mintedStats(uint256) external view returns (uint256);
}
