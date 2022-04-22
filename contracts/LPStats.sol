// SPDX-License-Identifier: MIT
pragma solidity =0.8.11;

interface ChefInterface {
  function clnyPerSecond() external view returns (uint256);
}

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract LPStats {
  IERC20 constant WONE = IERC20(0xcF664087a5bB0237a0BAd6742852ec6c8d69A27a);
  IERC20 constant USDC = IERC20(0x985458E523dB3d53125813eD68c274899e9DfAb4);
  IERC20 constant CLNY = IERC20(0x0D625029E21540aBdfAFa3BFC6FD44fB4e0A66d0);
  IERC20 constant SLP_CLNY = IERC20(0xcd818813F038A4d1a27c84d24d74bBC21551FA83);
  IERC20 constant SLP_USDC = IERC20(0xBf255d8c30DbaB84eA42110EA7DC870F01c0013A);
  ChefInterface constant CHEF = ChefInterface(0xe3fF96e6020B8606f923518704970A7AfA73DC3f);

  constructor () {
  }

  function getOnePrice() public view returns (uint256) {
    uint256 usdcInLiq = USDC.balanceOf(address(SLP_USDC));
    uint256 woneInLiq = WONE.balanceOf(address(SLP_USDC));
    return usdcInLiq * 1e18 * 1e18 / woneInLiq / 1e6;
  }

  function getClnyPrice() public view returns (uint256, uint256) {
    uint256 woneInLiq = WONE.balanceOf(address(SLP_CLNY));
    uint256 clnyInLiq = CLNY.balanceOf(address(SLP_CLNY));
    uint256 onePrice = woneInLiq * 1e18 / clnyInLiq;
    return (onePrice, onePrice * getOnePrice());
  }

  function getSLPPrice() public view returns (uint256) {
    uint256 circulatingSLPSupply = SLP_CLNY.totalSupply();
    uint256 woneInLiq = WONE.balanceOf(address(SLP_CLNY));
    uint256 totalInDollars = 2 * woneInLiq * getOnePrice() / 1e18;
    return totalInDollars * 1e18 / circulatingSLPSupply;
  }

  function getDollarTVL() external view returns (uint256) {
    uint256 slpLocked = SLP_CLNY.balanceOf(address(CHEF));
    return slpLocked * getSLPPrice() / 1e18;
  }

  function getDailyClnyRewards() public view returns (uint256) {
    return CHEF.clnyPerSecond() * 60 * 60 * 24;
  }

  function getYearlyDollarRewards() public view returns (uint256) {
    (, uint256 clnyPriceInDollars) = getClnyPrice();
    return getDailyClnyRewards() * clnyPriceInDollars * 36524 / 100; // ~365.24 days in a year
  }

  function getLockedSLP() public view returns (uint256) {
    return SLP_CLNY.balanceOf(address(CHEF));
  }

  function getAPR() public view returns (uint256) {
    return getYearlyDollarRewards() / getLockedSLP() / getSLPPrice();
  }

}
