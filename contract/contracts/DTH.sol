// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract DTH {
    string public name = "DRETHEREUM";
    string public symbol = "DTH";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    uint256 public maxSupply = 100 * 10 ** uint256(decimals); // Max supply of 100 tokens
    address public owner;
    uint256 public rate = 10; // 1 ETH = 10 DTH

    mapping(address => uint256) public balanceOf;
    mapping(address => bool) public minters;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Purchase(address indexed buyer, uint256 amount);
    event Mint(address indexed to, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    modifier onlyMinter() {
        require(minters[msg.sender], "Not authorized to mint");
        _;
    }

    constructor() {
        owner = msg.sender;
        minters[owner] = true; // Owner is initially a minter
    }

    function addMinter(address _minter) public onlyOwner {
        minters[_minter] = true;
    }

    function removeMinter(address _minter) public onlyOwner {
        minters[_minter] = false;
    }

    function mint(address _to, uint256 _amount) public onlyMinter {
        require(totalSupply + _amount <= maxSupply, "Exceeds max supply");
        totalSupply += _amount;
        balanceOf[_to] += _amount;
        emit Mint(_to, _amount);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function buyTokens() public payable {
        uint256 tokenAmount = msg.value * rate;
        require(balanceOf[owner] >= tokenAmount, "Not enough tokens available");
        balanceOf[owner] -= tokenAmount;
        balanceOf[msg.sender] += tokenAmount;
        emit Purchase(msg.sender, tokenAmount);
    }

    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}