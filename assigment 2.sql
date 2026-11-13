DROP DATABASE IF EXISTS groupby_exercise;
CREATE DATABASE groupby_exercise;
USE groupby_exercise;
CREATE TABLE sales (
order_id INT PRIMARY KEY,
order_date DATE,
region VARCHAR(20),
category VARCHAR(30),
salesperson VARCHAR(30),
quantity INT,
amount DECIMAL(10,2)
);

INSERT INTO sales
(order_id,order_date,region,category,salesperson,quantity,amount)
VALUES
(1, '2026-01-05', 'North', 'Electronics', 'Rahul', 5, 45000),
(2, '2026-01-08', 'South', 'Furniture', 'Priya', 3, 27000),
(3, '2026-01-12', 'East', 'Clothing', 'Amit', 8, 12000),
(4, '2026-01-15', 'West', 'Electronics', 'Neha', 2, 18000),
(5, '2026-01-18', 'North', 'Furniture', 'Rohit', 4, 36000),
(6, '2026-01-22', 'South', 'Clothing', 'Sneha', 10, 15000),
(7, '2026-01-25', 'East', 'Electronics', 'Vikas', 6, 54000),
(8, '2026-02-02', 'West', 'Furniture', 'Pooja', 2, 22000),
(9, '2026-02-06', 'North', 'Clothing', 'Rahul', 7, 10500),
(10, '2026-02-10', 'South', 'Electronics', 'Priya', 4, 32000),
(11, '2026-02-14', 'East', 'Furniture', 'Amit', 5, 40000),
(12, '2026-02-18', 'West', 'Clothing', 'Neha', 9, 13500),
(13, '2026-02-21', 'North', 'Electronics', 'Rohit', 3, 27000),
(14, '2026-02-25', 'South', 'Furniture', 'Sneha', 6, 48000),
(15, '2026-03-01', 'East', 'Clothing', 'Vikas', 12, 18000),
(16, '2026-03-05', 'West', 'Electronics', 'Pooja', 5, 42500),
(17, '2026-03-09', 'North', 'Furniture', 'Rahul', 2, 16000),
(18, '2026-03-13', 'South', 'Clothing', 'Priya', 11, 16500),
(19, '2026-03-17', 'East', 'Electronics', 'Amit', 7, 63000),
(20, '2026-03-21', 'West', 'Furniture', 'Neha', 4, 34000),
(21, '2026-03-25', 'North', 'Clothing', 'Rohit', 6, 9000),
(22, '2026-03-28', 'South', 'Electronics', 'Sneha', 3, 25500),
(23, '2026-04-02', 'East', 'Furniture', 'Vikas', 5, 45000),
(24, '2026-04-06', 'West', 'Clothing', 'Pooja', 8, 12000),
(25, '2026-04-10', 'North', 'Electronics', 'Rahul', 9, 81000);

select * from sales;

#Show the region and total number of orders.
select sum(quantity) as total_quantity,region
from sales
group by region;

#Show category and total sales amount.
select sum(amount) as total_amount ,category
from sales 
group by category;

#Show salesperson and average amount.
select avg(amount) as average_amount, salesperson
from sales
group by salesperson;

#the total quantity sold in each region. 
select sum(quantity) as total_quantity,region
from sales
group by region;

#Group the data by region and category, and display the total sales amount for every region-category combination.
select sum(amount) as total_salesamount, category,region
from sales
group by region , category;

#Group the data by region, category, and salesperson. For every combination, display the number of orders and total sales amount.
select sum(amount) as total_amount,region,salesperson
from sales 
group by region,category,salesperson;

#Display only those regions that have more than 5 orders. Use COUNT() with HAVING.
select region,count(quantity) as quantity 
from sales
group by region
having quantity>5;

#Display only those product categories whose total sales amount is greater than 150000.
select sum(amount) as sales_amount , category
from sales
group by category
having sales_amount>150000;

#Display only those salespersons whose average order amount is greater than 60000.
SELECT SUM(amount) AS order_amount, salesperson
FROM sales
GROUP BY salesperson
HAVING order_amount > 60000;

#Group the data by region and category. Display only those groups where the total quantity sold is at least 12.
select sum(quantity) as total_quantity , region,category
from sales
group by region,category
having total_quantity>=12;

/*For orders placed on or after &#39;2026-02-01&#39;, group the data by region and salesperson. Display only
those groups whose total sales amount is greater than 100000. Use WHERE before GROUP BY and
HAVING after GROUP BY.*/

select region,salesperson,sum(amount) as total_salesamount
from sales
where order_date>='2026-02-01'
group by region,salesperson
having total_salesamount>100000;

/*Group the data by region, category, and salesperson. Display the number of orders, total quantity,
and total sales amount for each group. Show only groups whose total sales amount is at least 50000,
and sort the result from highest to lowest total sales amount.*/

select sum(quantity) as total_quantity ,sum(amount) as total_amount,region,category,salesperson
from sales
group by region,category,salesperson
having total_amount>=50000
order by total_amount asc;


