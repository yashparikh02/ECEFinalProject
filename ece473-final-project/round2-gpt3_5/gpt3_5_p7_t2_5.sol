// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;  

interface IERC20 {     
    function totalSupply() external view returns (uint256);     
    function balanceOf(address account) external view returns (uint256);     
    function transfer(address recipient, uint256 amount) external returns (bool);     
    function allowance(address owner, address spender) external view returns (uint256);     
    function approve(address spender, uint256 amount) external returns (bool);     
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);      
    event Transfer(address indexed from, address indexed to, uint256 value);     
    event Approval(address indexed owner, address indexed spender, uint256 value); 
}  

contract ERC20 is IERC20 {     
    string public constant name = "MyERC20";     
    string public constant symbol = "M20";     
    uint8 public constant decimals = 18;      

    mapping (address => uint256) public balances;     
    mapping (address => mapping (address => uint256)) public allowances;     
    uint256 public immutable totalSupply_;      

    constructor(uint256 initialSupply) {         
        totalSupply_ = initialSupply * 10 ** uint256(decimals);         
        balances[msg.sender] = totalSupply_;         
        emit Transfer(address(0), msg.sender, totalSupply_);     
    }      

    function totalSupply() public view override returns (uint256) {         
        return totalSupply_;     
    }      

    function balanceOf(address account) public view override returns (uint256) {         
        return balances[account];     
    }      

    function transfer(address recipient, uint256 amount) public override returns (bool) {         
        _transfer(msg.sender, recipient, amount);         
        return true;     
    }      

    function allowance(address owner, address spender) public view override returns (uint256) {         
        return allowances[owner][spender];     
    }      

    function approve(address spender, uint256 amount) public override returns (bool) {         
        _approve(msg.sender, spender, amount);         
        return true;     
    }      

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {         
        _transfer(sender, recipient, amount);         
        _approve(sender, msg.sender, allowances[sender][msg.sender] - amount);         
        return true;     
    }      

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {         
        _approve(msg.sender, spender, allowances[msg.sender][spender] + addedValue);         
        return true;     
    }      

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {         
        _approve(msg.sender, spender, allowances[msg.sender][spender] - subtractedValue);         
        return true;     
    }      

    function _transfer(address sender, address recipient, uint256 amount) internal {         
        require(sender != address(0), "ERC20: transfer from the zero address");         
        require(recipient != address(0), "ERC20: transfer to the zero address");          

        balances[sender] -= amount;         
        balances[recipient] += amount;         
        emit Transfer(sender, recipient, amount);     
    }      

    function _approve(address owner, address spender, uint256 amount) internal {         
        require(owner != address(0), "ERC20: approve from the zero address");         
        require(spender != address(0), "ERC20: approve to the zero address");          

        allowances[owner][spender] = amount;         
        emit Approval(owner, spender, amount);     
    } 
}