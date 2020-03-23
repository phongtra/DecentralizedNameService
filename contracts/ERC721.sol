pragma solidity >=0.4.21 <=0.7.0;

interface ERC721 {
    event Transfer(
        address indexed _from,
        address indexed _to,
        string indexed _tokenId
    );
    event Approval(
        address indexed _owner,
        address indexed _approved,
        string indexed _tokenId
    );

    function balanceOf(address _owner) external view returns (uint256);
    function ownerOf(string calldata _tokenId) external view returns (address);
    function transferFrom(address _from, address _to, string calldata _tokenId)
        external
        payable;
    function approve(address _approved, string calldata _tokenId) external payable;
}
