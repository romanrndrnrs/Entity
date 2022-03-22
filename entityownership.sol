pragma solidity ^0.8;

import "./entityattack.sol";
// import "./erc721.sol";

contract EntityOwnership is EntityAttack ERC721 {
    mapping (uint => address) entityApproval;
    function balanceOf(address _owner) external view returns (uint256);
    function ownerOf(uint256 _tokenId) external view returns (address);
    function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
    function approve(address _approved, uint256 _tokenId) external payable;
} 

