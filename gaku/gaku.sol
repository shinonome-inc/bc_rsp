pragma solidity ^0.4.20;
contract RockPaperSissors {
    uint myMoney = 100;
    string battleResult = "None";
    function playGame(string myHand, string declaredHand, uint betMoney) public {
        uint randNonce = uint(keccak256(now)) % 6;
        if(sha3(declaredHand) == sha3(myHand)) {
            if(randNonce == 0) {
                myMoney = myMoney + (betMoney * 4);
                battleResult = "YOU WIN";
            }
            if(randNonce == 1) {
                battleResult = "DRAW";
            }
            if((randNonce == 2) || (randNonce == 3) || (randNonce == 4) || (randNonce == 5)) {
                myMoney = myMoney - betMoney;
                battleResult = "YOU LOSE";
            }
            else {
            }
        }
        if(sha3(declaredHand) != sha3(myHand)) {
            if((randNonce == 0) || (randNonce == 1)) {
                myMoney = myMoney + betMoney;
                battleResult = "YOU WIN";
            }
            if((randNonce == 2) || (randNonce == 3)) {
                battleResult = "DRAW";
            }
            if((randNonce == 4) || (randNonce == 5)) {
                myMoney = myMoney - (betMoney * 4);
                battleResult = "YOU LOSE";
            }
            else{
            }
        }
        else{
        }
    }
    function confirmResult() view public returns (string) {
        return battleResult;
    }
    function confirmMyMoney() view public returns (uint) {
        return myMoney;
    }
}
