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

