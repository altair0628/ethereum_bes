pragma solidity ^0.4.24;


library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        assert(c >= a);
        return c;
    }
}


contract Ownable {
    address public owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}


contract Pausable is Ownable {
    event Pause();
    event Unpause();

    bool public paused = false;

    modifier whenNotPaused() {
        require(!paused);
        _;
    }

    modifier whenPaused() {
        require(paused);
        _;
    }

    function pause() onlyOwner whenNotPaused public {
        paused = true;
        emit Pause();
    }

    function unpause() onlyOwner whenPaused public {
        paused = false;
        emit Unpause();
    }
}


contract PointBasic {
    function totalSupply() public view returns (uint256);
    function balanceOf(address who) public view returns (uint256);
    function transfer(address to, uint256 amount, uint256 _id) public returns (bool);
    function mint(address to, uint256 amount, uint256 _id) public;
    function burn(address to, uint256 amount, uint256 _id) public;
    event Transfer(address indexed from,address indexed to,uint256 amount,uint256 id);
    event Mint(address to,uint256 amount,uint256 totalSupply,uint256 id);
    event Burn(address to,uint256 amount,uint256 totalSupply,uint256 id);
}


contract BasicPoint is PointBasic, Pausable {
    using SafeMath for uint256;

    mapping(address => uint256) balances;

    uint256 totalSupply_;

    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(
        address _to,
        uint256 _amount,
        uint256 _id
    )
    whenNotPaused
    public
    returns (bool)
    {
        require(msg.sender != address(0));
        require(_to != address(0));
        require(_amount <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_to] = balances[_to].add(_amount);
        emit Transfer(msg.sender, _to, _amount, _id);
        return true;
    }

    function mint(
        address _to,
        uint256 _amount,
        uint256 _id
    )
    whenNotPaused
    public
    {
        require(_to != address(0));

        balances[_to] = balances[_to].add(_amount);
        totalSupply_ = totalSupply_.add(_amount);
        emit Mint(_to, _amount, totalSupply_, _id);
    }

    function burn(
        address _to,
        uint256 _amount,
        uint256 _id
    )
    whenNotPaused
    public
    {
        require(_to != address(0));
        require(_amount <= balances[_to]);

        balances[_to] = balances[_to].sub(_amount);
        totalSupply_ = totalSupply_.sub(_amount);
        emit Burn(_to, _amount, totalSupply_, _id);
    }
}


contract BoraPoint is BasicPoint{
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public blocklistCount;

    mapping(address => bool) public blacklist;

    event Block(address from,address to,uint256 id);
    event Unblock(address from,address to,uint256 id);

    constructor(uint256 _supply) public {
        require(_supply >= 0);
        name = 'BP';
        symbol = 'BP';
        decimals = 18;
        balances[msg.sender] = _supply;
        totalSupply_ = _supply;
    }

    function addToBlacklist(address _addr, uint256 _id) external {
        if(!blacklist[_addr]) {
            blocklistCount = blocklistCount.add(1);
        }
        blacklist[_addr] = true;
        emit Block(msg.sender, _addr, _id);
    }

    function removeFromBlacklist(address _addr, uint256 _id) external {
        if(blacklist[_addr]) {
            blocklistCount = blocklistCount.sub(1);
        }
        blacklist[_addr] = false;
        emit Unblock(msg.sender, _addr, _id);
    }

    function transfer(address _to, uint256 _amount, uint256 _id) public returns (bool) {
        require(!blacklist[msg.sender]);
        require(!blacklist[_to]);
        super.transfer(_to, _amount, _id);
    }

    function mint(address _to, uint256 _amount, uint256 _id) public {
        require(!blacklist[_to]);
        super.mint(_to, _amount, _id);
    }

    function burn(address _to, uint256 _amount, uint256 _id) public {
        require(!blacklist[_to]);
        super.burn(_to, _amount, _id);
    }
}
