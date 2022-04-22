const LPStats = artifacts.require("LPStats");
// const NFTKeyMock = artifacts.require("NFTKeyMock");

contract("LPStats", function () {
  it("should assert true", async function () {
    // const mock = await NFTKeyMock.deployed();
    const inst = await LPStats.deployed();
    const num = await inst.getOnePrice();
    console.log(num * 1);
  });
});

