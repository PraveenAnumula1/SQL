/* Q1: The Sales table records information about product sales, 
including the quantity sold, sale date, and total price for each sale. 
It serves as a transactional data source for analyzing sales trends. */

use testing
Create table Sales
(
Saleid int Primary key,
Product_id int,
sale_date date,
total_price Decimal(10, 2)

);

Select * from Sales

--add quantity sold column
alter table Sales
add  quantity_sold int

--insert data
insert into Sales(Saleid, Product_id, quantity_sold, sale_date, total_price) values 
(1, 101, 5, '2024-01-01', 2500.00),
(2, 102, 3, '2024-01-02', 900.00),
(3, 103, 2, '2024-01-02', 60.00),
(4, 104, 4, '2024-01-03', 80.00),
(5, 105, 6, '2024-01-03', 90.00);

--Filter the Sales table to show only sales with a total_price greater than $100.

Select * from Sales
where total_price>100

-- Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.

select Saleid, total_price from Sales where sale_date='2024-01-03'

-- Calculate the total revenue generated from all sales in the Sales table.
Select SUM(total_price) as total_revenue from Sales


--Count Sales Per Day from the Sales table
Select sale_date, count(*) AS Sales_Count from Sales
Group by sale_date
Order by sale_date
;

--Retrieve the total_price of all sales, rounding the values to two decimal places.
SELECT ROUND(SUM(total_price), 2) AS total_sales 
FROM Sales;

--Calculate the average total_price of sales in the Sales table.
SELECT AVG(total_price) AS average_total_price 
FROM Sales;


/* Q2. Products Table
The Products table contains details about products, including their names, categories, and unit prices.
It provides reference data for linking product information to sales transactions. */

use testing
create table Products(
Product_id int PRIMARY KEY,
product_name VARCHAR(50),
product_category VARCHAR(100),
product_unitprice DECIMAL(10,2)
);

select * from Products

insert into Products(Product_id, product_name, product_category, product_unitprice) values
(101, 'Laptop', 'Electronics', 500.00),
(102, 'Smartphone', 'Electronics', 300.00),
(103, 'Headphones', 'Electronics', 30.00),
(104, 'Keyboard', 'Electronics', 20.00),
(105, 'Mouse', 'Electronics', 15.00);

--Retrieve the product_name and unit_price from the Products table.
select product_name, product_unitprice from Products



--Filter the Products table to show only products in the 'Electronics' category.

select * from Products
where product_category='Electronics'

--display the highest price
SELECT TOP 1 product_name, product_unitprice 
FROM Products 
ORDER BY product_unitprice DESC;

SELECT TOP 2 product_name, product_unitprice 
FROM Products 
ORDER BY product_unitprice DESC;


SELECT TOP 1 product_name, product_unitprice
FROM Products
WHERE product_unitprice NOT IN (
    SELECT TOP 1 product_unitprice
    FROM Products
    ORDER BY product_unitprice DESC
)
ORDER BY product_unitprice DESC;


Select product_category, AVG(product_unitprice) As Average_price
from Products
group by product_category

Select * from Products
Select product_category, SUM(product_unitprice) As Total_price
from Products
group by product_category