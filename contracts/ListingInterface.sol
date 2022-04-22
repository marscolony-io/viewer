// SPDX-License-Identifier: MIT
pragma solidity =0.8.11;

interface ListingInterface {
  struct Listing {
    uint256 tokenId;
    uint256 value;
    address seller;
    uint256 expireTimestamp;
  }
}
