SHOW DATABASES;
USE sales_project;
SHOW TABLES;

------- Sales anlysis for 2024
SELECT * FROM sales_2024 LIMIT 10;
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM sales_2024
GROUP BY ProductID;

----- sales analysis for 2025

SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM sales_2025
GROUP BY ProductID;


-----  Combined sales analysis for 2024 and 2025
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM (
    SELECT * FROM sales_2024
    UNION ALL
    SELECT * FROM sales_2025
) AS combined_sales
GROUP BY ProductID;


-----  Top 5 products by quantity
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM (
    SELECT * FROM sales_2024
    UNION ALL
    SELECT * FROM sales_2025
) AS combined_sales
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 5;



-- 2️⃣ Total Revenue nikaalo
SELECT SUM(Quantity * UnitPrice) AS total_revenue
FROM Sales_2024;



-- 5️⃣ Product-wise total sales
select ProductID, sum( Quantity * UnitPrice) as Total_Sales
from sales_2025
group by ProductID;



-- 6️⃣ Store-wise revenue
select StoreID, sum(Quantity * UnitPrice) as Totalrevenue
from sales_2024
group by StoreID;



-- 7️⃣ Top 5 customers (highest spending)
select CustomerID, sum(Quantity * UnitPrice) as Highest_Spending
from sales_2025
group by CustomerID 
order by Highest_Spending desc limit 5;


-- 🎯: Daily Sales Trend
select Date , sum(Quantity * UnitPrice) as DailySales
from sales_2025
group by Date
order by Date;   


-- 9️⃣ Sabse zyada bikne wala product
select ProductID, sum(Quantity) as Highest_Quantity
from sales_2025
group by ProductID
order by Highest_Quantity desc 
limit 1;


--  🔟 Highest revenue wala product 
select ProductID, sum(Quantity * UnitPrice) as Highest_revenue
from sales_2025
group by ProductID
order by Highest_revenue desc 
limit 3;  


-- Monthly sales trend
select month(date) as Month,  sum(Quantity * UnitPrice) as Monthly_Sales
from sales_2025
group by Month
order by Monthly_Sales desc;


-- Reapet Customer Name
SELECT 
    CustomerID,
    COUNT(*) AS total_orders,
    CASE 
        WHEN COUNT(*) = 1 THEN 'New Customer'
        ELSE 'Repeat Customer'
    END AS customer_type
FROM sales_2024
GROUP BY CustomerID; 



-- 1️⃣3️⃣ Top product in each store

SELECT *
FROM (
    SELECT 
        StoreID,
        ProductID,
        SUM(Quantity * UnitPrice) AS revenue,
        ROW_NUMBER() OVER (PARTITION BY StoreID ORDER BY SUM(Quantity * UnitPrice) DESC) AS row_num
    FROM sales_2025
    GROUP BY StoreID, ProductID
) t
WHERE row_num = 1; 



-- 👉 Total number of orders (sales) count karo
 select count(*) from sales_2024;




-- 🧠 Q2: Most sold product
select ProductID, sum(Quantity) as total_quantity
from sales_2025
group by ProductID order by total_quantity desc limit 1;


-- 🧠 Q3: Last purchase date per customer
select CustomerID, max(Date) as Latest_Purchase_Date
 from sales_2024
 group by CustomerID;



 -- 🧠 Q4: Har store ka total revenue
select StoreID, sum(Quantity * UnitPrice) as total_revenue
from sales_2024
group by StoreID
ORDER BY total_revenue DESC; 



--  Har store ka highest revenue generating product find karo

select * from (
select
StoreID, ProductID, sum(Quantity * UnitPrice) as total_revenue,
        ROW_NUMBER() OVER (PARTITION BY StoreID ORDER BY 
        SUM(Quantity * UnitPrice) DESC) AS row_num
        from sales_2025
        group by StoreID, ProductID)t
        WHERE row_num = 1;
        
        

    
--  👉 Find those customers jinhone har saal (2024 & 2025 dono me) purchase kiya hai  
        select distinct s24.CustomerID from sales_2024 s24 
inner join sales_2025 s25 on s24.CustomerID = s25.CustomerID;


-- Find total revenue per customer.        
select CustomerID,  sum(Quantity * UnitPrice) as total_revenue
from sales_2025
group by CustomerID
order by total_revenue desc;


-- 👉 Find top 3 customers by total revenue

select CustomerID,  sum(Quantity * UnitPrice) as top_Customer
from sales_2025
group by CustomerID
order by top_Customer desc
limit 3;



























