pragma solidity ^0.4.19;
contract rockScissorsPaper {
    uint randNonce;
    mapping (address => uint) idToPlayCount;


    function randMod() internal returns(uint) {
        randNonce++;
        return uint(keccak256(abi.encode(msg.sender, randNonce, now))) % 3;
    }

    function playGame(uint _myHand) public payable returns(string) {
        uint _amount = 0.1 ether; //set the amount to play game
        require(msg.value == _amount);
        require(_myHand <= 2 && _myHand >= 0);

        uint enemyHand = randMod(); //generating enemy hand
        idToPlayCount[msg.sender]++; //counting how many time the player do

        if(_myHand == enemyHand) {
        msg.sender.transfer(_amount);
        return "DRAW";
    }

    if(_myHand > enemyHand) {
        if(_myHand == 2 && enemyHand==0){
            msg.sender.transfer(this.balance);
            return "WIN";
        } else {
        return "LOSE";
        }
    }

    if(_myHand < enemyHand) {
        if(_myHand == 0 && enemyHand==2){
            return "LOSE";
        } else {
        msg.sender.transfer(this.balance);
        return "WIN";
        }
    }
    }

    function checkJackpot() view public returns(uint) {
        return this.balance / 1000000000000000000;
    }
}
