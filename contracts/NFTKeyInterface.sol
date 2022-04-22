// SPDX-License-Identifier: MIT
pragma solidity =0.8.11;

import './ListingInterface.sol';

interface NFTKeyInterface is ListingInterface {
 function getTokenListings(
    address erc721Address,
    uint256 from,
    uint256 size
  ) external view returns (Listing[] memory);

  function numTokenListings(address erc721Address)
    external
    view
    returns (uint256);
}
