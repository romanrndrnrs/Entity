pragma solidity ^0.8;
// import "./ownable.sol";

contract EntityFactory is Ownable{
        struct Entity {
            string name;
            uint8 level;
            uint16 energy;
            uint16 damage_base;
            // Add skill points
            uint16 wincount;
            uint16 losscount;
            }

        Entity[] public entities;
        event NewEntity(uint id, string name);

        mapping (uint => address) public entityToOwner;

        function _createEntity(string memory _name) internal {
            uint id = entities.push(Entity(_name,0,50,10,0,0)) - 1;
            entityToOwner[id] = msg.sender;
            emit NewEntity(id,_name);
        }
    }
