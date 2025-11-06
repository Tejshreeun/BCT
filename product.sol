// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract ProductInventory {
    // Mapping to store stock quantity of each product
    mapping(string => uint256) public productStock;

    // Receive product (add stock)
    function receiveProduct(string memory _productName, uint256 _quantity) public {
        require(_quantity > 0, "Quantity must be greater than zero");
        productStock[_productName] += _quantity;
    }

    // Sell product (reduce stock)
    function saleProduct(string memory _productName, uint256 _quantity) public {
        require(_quantity > 0, "Quantity must be greater than zero");
        require(productStock[_productName] >= _quantity, "Not enough stock");
        productStock[_productName] -= _quantity;
    }

    // Display current stock
    function displayStock(string memory _productName) public view returns (uint256) {
        return productStock[_productName];
    }
} 