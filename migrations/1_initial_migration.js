const Viewer = artifacts.require("Viewer");
const LPStats = artifacts.require("LPStats");
const NFTKeyMock = artifacts.require("NFTKeyMock");
const LandStats = artifacts.require("LandStats");

module.exports = async function (deployer) {
  // await deployer.deploy(NFTKeyMock);
  // await deployer.deploy(Viewer, NFTKeyMock.address);

  // MAINNET
  // await deployer.deploy(
  //   LandStats,
  //   '0x0D112a449D23961d03E906572D8ce861C441D6c3', // GM
  //   '0x0bC0cdFDd36fc411C83221A348230Da5D3DfA89e', // MC
  // );
  // TESTNET
  // await deployer.deploy(
  //   LandStats,
  //   '0xc65F8BA708814653EDdCe0e9f75827fe309E29aD', // GM
  //   '0xc268D8b64ce7DB6Eb8C29562Ae538005Fded299A', // MC
  // );
  await deployer.deploy(Viewer, '0x42813a05ec9c7e17aF2d1499F9B0a591B7619aBF');
};

// 0x42813a05ec9c7e17aF2d1499F9B0a591B7619aBF

// 0x692C75E7325432B0266259213120BE58814e06b8
