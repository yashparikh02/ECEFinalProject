// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.24;  

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
    mapping(address => uint256) private _balances;     
    mapping(address => mapping(address => uint256)) private _allowances;     
    uint256 private _totalSupply;     

    function totalSupply() external view override returns (uint256) {         
        return _totalSupply;     
    }      

    function balanceOf(address account) external view override returns (uint256) {         
        return _balances[account];     
    }      

    function transfer(address recipient, uint256 amount) external override returns (bool) {         
        _transfer(msg.sender, recipient, amount);         
        return true;     
    }      

    function allowance(address owner, address spender) external view override returns (uint256) {         
        return _allowances[owner][spender];     
    }      

    function approve(address spender, uint256 amount) external override returns (bool) {         
        _approve(msg.sender, spender, amount);         
        return true;     
    }      

    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {         
        _transfer(sender, recipient, amount);         
        _approve(sender, msg.sender, _allowances[sender][msg.sender] - amount);         
        return true;     
    }      

    function increaseAllowance(address spender, uint256 addedValue) external returns (bool) {         
        _approve(msg.sender, spender, _allowances[msg.sender][spender] + addedValue);         
        return true;     
    }      

    function decreaseAllowance(address spender, uint256 subtractedValue) external returns (bool) {         
        uint256 currentAllowance = _allowances[msg.sender][spender];         
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");         
        _approve(msg.sender, spender, currentAllowance - subtractedValue);         
        return true;     
    }      

    function _transfer(address sender, address recipient, uint256 amount) internal {         
        require(sender != address(0), "ERC20: transfer from the zero address");         
        require(recipient != address(0), "ERC20: transfer to the zero address");          

        _balances[sender] -= amount;         
        _balances[recipient] += amount;         
        emit Transfer(sender, recipient, amount);     
    }      

    function _approve(address owner, address spender, uint256 amount) internal {         
        require(owner != address(0), "ERC20: approve from the zero address");         
        require(spender != address(0), "ERC20: approve to the zero address");          

        _allowances[owner][spender] = amount;         
        emit Approval(owner, spender, amount);     
    }      

    function _mint(address account, uint256 amount) internal {         
        require(account != address(0), "ERC20: mint to the zero address");          

        _totalSupply += amount;         
        _balances[account] += amount;         
        emit Transfer(address(0), account, amount);     
    }      

    function _burn(address account, uint256 amount) internal {         
        require(account != address(0), "ERC20: burn from the zero address");          

        _balances[account] -= amount;         
        _totalSupply -= amount;         
        emit Transfer(account, address(0), amount);     
    } 
}