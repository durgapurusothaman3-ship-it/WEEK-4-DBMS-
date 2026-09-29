DROP DATABASE IF EXISTS order_management_db;
CREATE DATABASE order_management_db;
USE order_management_db;


CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0)
);

CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10,2) NOT NULL CHECK (Total_Amount >= 0),
    Order_Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
INSERT INTO Customer (Customer_Name) VALUES
('Durga'),
('Devi'),
('Deva');

INSERT INTO Product (Product_Name, Price) VALUES
('Face Wash', 350),
('Shampoo', 450),
('Rice', 1200),
('Sugar', 500),
('Cooking Oil', 180),
('Chair', 2500),
('Table', 4000);


INSERT INTO Inventory (Product_ID, Quantity) VALUES
(1, 50),
(2, 30),
(3, 100),
(4, 80),
(5, 60),
(6, 20),
(7, 15);

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES
(5001, 1, '2026-09-28', 1550, 'Pending');

INSERT INTO Order_Details
(Order_ID, Product_ID, Quantity, Price)
VALUES
(5001, 1, 1, 350),
(5001, 3, 1, 1200);

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES
(5002, 2, '2026-09-28', 950, 'Shipped');

INSERT INTO Order_Details
(Order_ID, Product_ID, Quantity, Price)
VALUES
(5002, 2, 1, 450),
(5002, 4, 1, 500);


INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES
(5003, 3, '2026-09-28', 4180, 'Delivered');

INSERT INTO Order_Details
(Order_ID, Product_ID, Quantity, Price)
VALUES
(5003, 5, 1, 180),
(5003, 6, 1, 2500),
(5003, 7, 1, 4000);


SELECT * FROM Orders;

SELECT * FROM Order_Details;

SELECT
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    p.Product_Name,
    od.Quantity,
    od.Price,
    o.Total_Amount,
    o.Order_Status
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
JOIN Product p
    ON od.Product_ID = p.Product_ID;



INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES
(5004, 1, '2026-09-28', 450, 'Pending');

INSERT INTO Order_Details
(Order_ID, Product_ID, Quantity, Price)
VALUES
(5004, 2, 1, 450);

UPDATE Orders
SET Order_Status = 'Delivered'
WHERE Order_ID = 5001;


UPDATE Order_Details
SET Quantity = 2
WHERE Order_Detail_ID = 1;


DELETE FROM Order_Details
WHERE Order_ID = 5004;

DELETE FROM Orders
WHERE Order_ID = 5004;


SELECT
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    o.Order_Status
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID;


SELECT
    p.Product_Name,
    COUNT(od.Order_ID) AS Times_Ordered,
    SUM(od.Quantity) AS Total_Quantity_Sold
FROM Product p
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY p.Product_ID, p.Product_Name;



SELECT
    c.Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders
FROM Customer c
LEFT JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name;


SELECT
    c.Customer_Name,
    SUM(o.Total_Amount) AS Total_Spending
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name;




SELECT
    AVG(Total_Amount) AS Average_Order_Value
FROM Orders;


SELECT
    SUM(Total_Amount) AS Total_Sales
FROM Orders;