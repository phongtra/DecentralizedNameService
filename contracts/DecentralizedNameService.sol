pragma solidity >=0.4.21 <=0.7.0;
import "./Ownable.sol";
import "./ERC721.sol";

contract DecentralizedNameService is Ownable, ERC721 {
    mapping(string => address) domain;
    mapping(address => uint256) addressToDomainCount;
    mapping(string => address) domainApprovals;

    enum Token {BTC, ETH}
    modifier onlyOwnerOf(string memory _domain) {
        require(domain[_domain] == msg.sender, "You must own the domain");
        _;
    }
    function balanceOf(address _owner) external view returns (uint256) {
        return addressToDomainCount[_owner];
    }
    function ownerOf(string calldata _tokenId) external view returns (address) {
        return domain[_tokenId];
    }
    function transferFrom(address _from, address _to, string calldata _tokenId)
        external
        payable
    {
        require(
            domain[_tokenId] == msg.sender || domain[_tokenId] == msg.sender,
            "Must be allowed to send"
        );
        _transfer(_from, _to, _tokenId);
    }

    function approve(address _approved, string calldata _tokenId)
        external
        payable
        onlyOwnerOf(_tokenId)
    {
        domainApprovals[_tokenId] = _approved;
        emit Approval(msg.sender, _approved, _tokenId);
    }
    function _transfer(address _from, address _to, string memory _tokenId)
        private
    {
        addressToDomainCount[_to]++;
        addressToDomainCount[_from]--;
        domain[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    }
    function withdraw() external onlyOwner {
        address payable _owner = address(uint160(owner()));
        _owner.transfer(address(this).balance);
    }
    function getTokenByKey(Token _token) internal pure returns (string memory) {
        // Error handling for input
        require(uint8(_token) <= 4, "Not valid input");

        // Loop through possible options
        if (Token.BTC == _token) return "btc";
        if (Token.ETH == _token) return "eth";
    }
    function purchaseDomainName(
        address _address,
        string calldata _domain,
        Token _token
    ) external payable {
        require(msg.value == 0.001 ether, "Not enough ethers");
        require(uint8(_token) == 0 || uint8(_token) == 1, "Invalid token");
        string memory token = getTokenByKey(_token);
        string memory domainName = string(
            abi.encodePacked(_domain, ":", token)
        );
        domain[domainName] = _address;
        addressToDomainCount[_address]++;
    }
}
