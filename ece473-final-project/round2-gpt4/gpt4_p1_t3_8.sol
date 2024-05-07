// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

interface ERC20Interface {
    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint);
    function allowance(address tokenOwner, address spender) external view returns (uint);
    function transfer(address to, uint tokens) external returns (bool);
    function approve(address spender, uint tokens) external returns (bool);
    function transferFrom(address from, address to, uint tokens) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract MyToken is ERC20Interface {
    string public constant name = "MyToken";
    string public constant symbol = "MTK";
    uint8 public constant decimals = 18;  
    uint private immutable _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    constructor() {
        _totalSupply = 1_000_000;
        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }
    
    function totalSupply() public view override returns (uint) {
        return _totalSupply - balances[address(0)];
    }

    function balanceOf(address tokenOwner) public view override returns (uint) {
        return balances[tokenOwner];
    }

    function allowance(address tokenOwner, address spender) public view override returns (uint) {
        return allowed[tokenOwner][spender];
    }
    
    function approve(address spender, uint tokens) public override returns (bool) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
    
    function transfer(address to, uint tokens) public override returns (bool) {
        require(balances[msg.sender] >= tokens, "Insufficient balance");
        balances[msg.sender] -= tokens;
        balances[to] += tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
    
    function transferFrom(address from, address to, uint tokens) public override returns (bool) {
        require(balances[from] >= tokens, "Insufficient balance");
        require(allowed[from][msg.sender] >= tokens, "Not permitted to transfer this amount");
        balances[from] -= tokens;
        allowed[from][msg.sender] -= tokens;
        balances[to] += tokens;
        emit Transfer(from, to, tokens);
        return true;
    }
}
