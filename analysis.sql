SHOW DATABASES;
USE sales_project;
SHOW TABLES;

------- Sales nlysis for 2024
SELECT * FROM sales_2024 LIMIT 10;
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM sales_2024
GROUP BY ProductID;

----- sales analysis for 2025

SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM sales_2025
GROUP BY ProductID;

-- Combined sales analysis for 2024 and 2025
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM (
    SELECT * FROM sales_2024
    UNION ALL
    SELECT * FROM sales_2025
) AS combined_sales
GROUP BY ProductID;
sss