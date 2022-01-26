const viewer = artifacts.require("Viewer");
// const NFTKeyMock = artifacts.require("NFTKeyMock");

contract("viewer", function () {
  it("should assert true", async function () {
    // const mock = await NFTKeyMock.deployed();
    const inst = await viewer.deployed();
    const num = await inst.num();
    console.log(num);
  });
});

