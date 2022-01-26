// SPDX-License-Identifier: MIT
pragma solidity =0.8.5;

import './NFTKeyInterface.sol';

contract NFTKeyMock is NFTKeyInterface {
  function getTokenListings(
    address erc721Address,
    uint256 from,
    uint256 size
  ) external view override returns (Listing[] memory) {
    return new Listing[](0);
  }

  function numTokenListings(address erc721Address)
    external
    view
    override
    returns (uint256) {
      return 5;
    }
}
