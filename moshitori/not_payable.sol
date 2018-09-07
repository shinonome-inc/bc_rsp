pragma solidity ^0.4.0;
contract game {
    mapping (address => uint) idToAmount;
    mapping (address => uint) idToWinCount;
    mapping (address => uint) idToDrawCount;
    mapping (address => uint) idToLoseCount;
    mapping (address => uint) idToPlayCount;
    uint randNonce = 0;

    function init() internal {
        idToAmount[msg.sender] = 10000;
        idToWinCount[msg.sender] = 0;
        idToDrawCount[msg.sender] = 0;
        idToLoseCount[msg.sender] = 0;
        idToPlayCount[msg.sender] = 0;
    }

    function randMod() internal returns(uint) {
        randNonce++;
        return uint(keccak256(msg.sender, randNonce, now)) % 3;
    }

    function playGame(uint _myHand, uint _amount) public returns(string) {
    if(idToPlayCount[msg.sender] == 0){
        init();
    }

    require(idToAmount[msg.sender] >= _amount);
    idToPlayCount[msg.sender]++;
    uint enemyHand = randMod();

    if(_myHand == enemyHand) {
        idToDrawCount[msg.sender]++;
        return "DRAW";
    }

    if(_myHand > enemyHand) {
        if(_myHand == 2 && enemyHand==0){
            idToWinCount[msg.sender]++;
            idToAmount[msg.sender] += _amount *2;
            return "WIN";
        }

        idToLoseCount[msg.sender]++;
        idToAmount[msg.sender] -= _amount;
        return "LOSE";
    }

    if(_myHand < enemyHand) {
        if(_myHand == 0 && enemyHand==2){
            idToLoseCount[msg.sender]++;
            idToAmount[msg.sender] -= _amount;
            return "LOSE";
        }
        idToWinCount[msg.sender]++;
        idToAmount[msg.sender] += _amount *2;
        return "WIN";
    }
    }

    function checkAmount() view public returns(uint) {
        return idToAmount[msg.sender];
    }
}
