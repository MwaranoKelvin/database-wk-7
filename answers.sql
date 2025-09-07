										-- THE UNORMALIZED TABLE
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);
INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');
 -- To display the table and it's records
select * from productDetail;
drop table productDetail; -- Droping the unnormalized table
  


                                              	-- NORMALIZING THE ABOVE TABLE TO 1NF
 -- Create the first and second table, to normalize them
		-- 1. Creating Tables
        -- Table for Orders Made
CREATE TABLE OrderMade(
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

		-- Table for individual Products per Order
CREATE TABLE OrderProducts (
    OrderProductID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    Product VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES OrderMade(OrderID)
);

		-- 2. Inserting values
-- Insert into Orders
INSERT INTO OrderMade (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert into OrderProducts
INSERT INTO OrderProducts (OrderID, Product) VALUES
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Tablet'),
(102, 'Keyboard'),
(102, 'Mouse'),
(103, 'Phone');

		-- 3. Displaying tables
SELECT 
    OrderID,
    CustomerName,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', numbers.n), ',', -1)) AS Product
FROM 
    ProductDetail
JOIN (
    SELECT 1 AS n UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5
) AS numbers
ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= numbers.n - 1
ORDER BY 
    OrderID, Product;



										-- CREATING TABLES IN 2NF
CREATE TABLE OrdersMade (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO OrdersMade (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');


CREATE TABLE OrderDetail (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES OrdersMade(OrderID)
);

INSERT INTO OrderDetail (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);


-- Joining the tables
SELECT 
    o.OrderID,
    o.CustomerName,
    od.Product,
    od.Quantity
FROM 
    OrdersMade o
JOIN 
    OrderDetail od ON o.OrderID = od.OrderID;


  

