# Week 4 - Order Management System

## Project Overview

This project implements an Order Management System for an e-commerce application using MySQL. It manages customer orders, purchased products, quantities, prices, and order status.

## Purpose

The main purpose of this project is to manage customer orders efficiently and generate useful order-related reports.

## Database Modules

- Customer
- Product
- Inventory
- Orders
- Order_Details

## Key Features

- Create and manage customer orders
- Add multiple products to a single order
- Store product quantity and price
- Maintain order status
- Update order information
- Delete cancelled orders
- Display complete order details
- Generate customer and product reports

## Database Relationships

Customer and Orders:

**One Customer → Many Orders**

Orders and Products:

**Many Orders → Many Products**

The many-to-many relationship between Orders and Products is handled using the **Order_Details** table.

## SQL Operations

The project includes:

- Table creation
- Data insertion
- SELECT operations
- UPDATE operations
- DELETE operations
- JOIN queries
- Aggregate functions

## Reports

The following reports are generated:

1. Customer Order History
2. Product-wise Order Report
3. Customer Purchase Analysis
4. Total Sales
5. Average Order Value

## Technologies Used

- MySQL
- SQL
- MySQL Workbench
- GitHub

## Conclusion

The Order Management System provides a structured way to manage customer orders and purchased products. It demonstrates database relationships, constraints, CRUD operations, and SQL queries for generating useful order management reports.
