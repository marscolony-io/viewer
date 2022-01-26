const Viewer = artifacts.require("Viewer");
const NFTKeyMock = artifacts.require("NFTKeyMock");

module.exports = async function (deployer) {
  // await deployer.deploy(NFTKeyMock);
  // await deployer.deploy(Viewer, NFTKeyMock.address);
  await deployer.deploy(Viewer, '0x42813a05ec9c7e17aF2d1499F9B0a591B7619aBF');
};

// 0x42813a05ec9c7e17aF2d1499F9B0a591B7619aBF

// 0x692C75E7325432B0266259213120BE58814e06b8
