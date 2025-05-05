USE salesdb;

-- Question 1: Achieving First Normal Form (1NF)
-- Create a new table that satisfies 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert atomic (split) values
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');

-- Question 2: Achieving Second Normal Form (2NF)
-- Create Orders_2NF table
CREATE TABLE Orders_2NF (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert customer-level data
INSERT INTO Orders_2NF VALUES (101, 'John Doe');
INSERT INTO Orders_2NF VALUES (102, 'Jane Smith');
INSERT INTO Orders_2NF VALUES (103, 'Emily Clark');

-- Create OrderItems_2NF table
CREATE TABLE OrderItems_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders_2NF(OrderID)
);

-- Insert product-level data
INSERT INTO OrderItems_2NF VALUES (101, 'Laptop', 2);
INSERT INTO OrderItems_2NF VALUES (101, 'Mouse', 1);
INSERT INTO OrderItems_2NF VALUES (102, 'Tablet', 3);
INSERT INTO OrderItems_2NF VALUES (102, 'Keyboard', 1);
INSERT INTO OrderItems_2NF VALUES (102, 'Mouse', 2);
INSERT INTO OrderItems_2NF VALUES (103, 'Phone', 1);
