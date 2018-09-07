pragma solidity ^0.4.16;
contract rockScissorsPaper {
    function battle(string) public payable returns (string){
        uint randNum; //randNum is a unsigned integer
        randNum = uint(keccak256(abi.encode(now))) % 3; //Generating pseudo random number between 0,1,2
        require (msg.value == 1 ether);
        if (randNum == 0){
            msg.sender.transfer(this.balance); //Transfer all ether
            return  "You win";
        } else if (randNum == 1){
            return  "You lose";
        } else {
            msg.sender.transfer(1 ether);
            return  "You even";
     }
    }
    function getJackPot()  returns (uint){ //Get how much ether is deposited on this contract
        return (this.balance)/1000000000000000000; //Display the deposit in ether
    }
}
