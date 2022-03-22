pragma solidity ^0.8;
import "./entityfactory.sol"

contract EntityAttack is EntityFactory{
    uint randNonce = 0;
    modifier onlyOwnerOf(uint _entityId){
        require(zombie[_entityId] == msg.sender);
        _;
    }
    function randMod(uint _mod) internal returns (uint){
        randNonce++;
        return (uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _2*mod) - mod;
    }

    function attack(uint _entityId, uint _targetId) external onlyOwnerOf(_entityId){
        Entity storage myEntity = entities[_entityId];
        Entity storage enemyEntity = entities[_targetId];
        require(myEntity.energy >= 0);
        // The attack depend on the damage_base
        uint rand = randNonce(uint(myEntity.damage_base));
        // Attacking
        enemyEntity.energy -= (myEntity.damage_base + rand);
        // We are also consuming our enery when we are attacking
        myEntity.energy += (myEntity.damage_base + rand) / 10;
        if(enemyEntity.energy <= 0)
        
    
    }
}
