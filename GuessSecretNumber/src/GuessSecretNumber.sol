// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract GuessTheSecretNumber {
    bytes32 answerHash =
        0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;

    constructor() payable {
        require(msg.value == 1 ether);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable returns (bool) {
        require(msg.value == 1 ether);

        if (keccak256(abi.encodePacked(n)) == answerHash) {
            (bool ok, ) = msg.sender.call{value: 2 ether}("");
            require(ok, "Failed to Send 2 ether");
        }
        return true;
    }
}

// Write your exploit codes below
contract ExploitContract {
    bytes32 answerHash =
        0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;

    function Exploiter() public view returns (uint8) {
        uint8 n;
        
        for(uint8 i = 0; i< 32; i++){
            if(keccak256(abi.encodePacked(i))==answerHash)
             n = i;
        }
        
        // {
        //   for(uint8 i = 32; i< 64; i++){
        //     if(keccak256(abi.encodePacked(i))==answerHash)
        //      n = i;
        // }
        // }
        // {
        //   for(uint8 i = 64; i< 96; i++){
        //     if(keccak256(abi.encodePacked(i))==answerHash)
        //      n = i;
        // }
        // }
        // {
        //   for(uint8 i = 96; i< 128; i++){
        //     if(keccak256(abi.encodePacked(i))==answerHash)
        //      n = i;
        // }
        // }
        // {
        //   for(uint8 i = 128; i< 160; i++){
        //     if(keccak256(abi.encodePacked(i))==answerHash)
        //      n = i;
        // }
        // }
        // {
        //   for(uint8 i = 160; i< 192; i++){
        //     if(keccak256(abi.encodePacked(i))==answerHash)
        //      n = i;
        // }
        // }
        // {
        //   for(uint8 i = 192; i< 224; i++){
        //     if(keccak256(abi.encodePacked(i))==answerHash)
        //      n = i;
        // }
        // }
        // {
        //   for(uint8 i = 224; i< 256; i++){
        //     if(keccak256(abi.encodePacked(i))==answerHash)
        //      n = i;
        // }
        // }
        return n;
    }
}
