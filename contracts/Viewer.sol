// SPDX-License-Identifier: MIT
pragma solidity =0.8.11;

import './NFTKeyInterface.sol';
import './ListingInterface.sol';

contract Viewer is ListingInterface {
  NFTKeyInterface public NFTKey;
  address constant MC = 0x0bC0cdFDd36fc411C83221A348230Da5D3DfA89e;

  uint256 constant batchSize = 20;

  constructor (NFTKeyInterface _NFTKey) {
    NFTKey = _NFTKey;
  }

  function num() view external returns (uint256) {
    return NFTKey.numTokenListings(MC);
  }

  /**
   * Floor price of MarsColony on NFTKey
   */
  function floor() view external returns (uint256) {
    uint256 numListingsInt = NFTKey.numTokenListings(MC);
    uint256 currBatchCount = 0;
    uint256 floorPrice = 2 ** 256 - 1;

    uint256 startingIdx = 1 + currBatchCount * batchSize;

    while (startingIdx <= numListingsInt) {
      Listing[] memory tokenListings = NFTKey.getTokenListings(MC, startingIdx, batchSize);

      for (uint256 y = 0; y < tokenListings.length; y++) {
        uint256 price = tokenListings[y].value;
        if (price < floorPrice && price != 0) {
          floorPrice = price;
        }
      }

      currBatchCount++;
      startingIdx = 1 + currBatchCount * batchSize;
    }

    return floorPrice;
  }
}
