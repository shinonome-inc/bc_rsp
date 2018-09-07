pragma solidity ^0.4.19;
contract rockPaperScissor {

    mapping (address => uint) myselfToWinCount;
    mapping (address => uint) myselfTolossCount;
    mapping (address => uint) enemyToWinCount;
    mapping (address => uint) enemyTolossCount;

    uint randNonce = 0;


    function randMod() internal returns(uint) {
        randNonce++;
        return uint(keccak256(now, msg.sender, randNonce)) % 3;
        require(msg.sender > 0);
    }

    uint myself;
    uint enemy;


    function battle(uint _myself, uint _enemy) public payable returns (uint) {

        if (myself > enemy) {
            myselfToWinCount[msg.sender]++;
            enemyTolossCount[msg.sender]++;
            msg.sender.transfer(this.balance);
        }

        if (myself == enemy) {

        }

        if (myself < enemy) {
            myselfTolossCount[msg.sender]++;
            enemyToWinCount[msg.sender]++;
        }
    }

    function checkValue() view public returns(uint) {
        return myselfToWinCount[msg.sender];
    }

}
