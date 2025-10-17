// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ManualToken {
    mapping(address => uint256) private s_balances;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether; //no mint so the contract is unusable. But I am just following the course along, I know we will probably use OZ contract.
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _ammount) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _ammount;
        s_balances[_to] += _ammount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances); //Must emit transfer event(msg.sender, _to, amount). Should forbit transfer to the zero address
    }
}
