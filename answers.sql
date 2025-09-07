-- The unnormalized table
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);
INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');
# To display the table and it's records
select * from productDetail;
drop table productDetail; -- Droping the unnormalized table
  


                                              -- Normalizing the above table to 1NF 
 -- Create the first and second table, to normalize them
		# 1. Creating Tables
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

		# 2. Inserting values
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

		# 3. Displaying tables
	select * from OrderMade;
  select * from OrderProducts;

  
