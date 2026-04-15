[1mdiff --git a/analysis.sql b/analysis.sql[m
[1mindex 10c5683..d4c8617 100644[m
[1m--- a/analysis.sql[m
[1m+++ b/analysis.sql[m
[36m@@ -147,6 +147,67 @@[m [mselect CustomerID, max(Date) as Latest_Purchase_Date[m
 select StoreID, sum(Quantity * UnitPrice) as total_revenue[m
 from sales_2024[m
 group by StoreID[m
[31m-ORDER BY total_revenue DESC; sssss[m
[32m+[m[32mORDER BY total_revenue DESC;[m[41m [m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m--  Har store ka highest revenue generating product find karo[m
[32m+[m
[32m+[m[32mselect * from ([m
[32m+[m[32mselect[m
[32m+[m[32mStoreID, ProductID, sum(Quantity * UnitPrice) as total_revenue,[m
[32m+[m[32m        ROW_NUMBER() OVER (PARTITION BY StoreID ORDER BY[m[41m [m
[32m+[m[32m        SUM(Quantity * UnitPrice) DESC) AS row_num[m
[32m+[m[32m        from sales_2025[m
[32m+[m[32m        group by StoreID, ProductID)t[m
[32m+[m[32m        WHERE row_num = 1;[m
[32m+[m[41m        [m
[32m+[m[41m        [m
[32m+[m
[32m+[m[41m    [m
[32m+[m[32m--  👉 Find those customers jinhone har saal (2024 & 2025 dono me) purchase kiya hai[m[41m  [m
[32m+[m[32m        select distinct s24.CustomerID from sales_2024 s24[m[41m [m
[32m+[m[32minner join sales_2025 s25 on s24.CustomerID = s25.CustomerID;[m
[32m+[m
[32m+[m
[32m+[m[32m-- Find total revenue per customer.[m[41m        [m
[32m+[m[32mselect CustomerID,  sum(Quantity * UnitPrice) as total_revenue[m
[32m+[m[32mfrom sales_2025[m
[32m+[m[32mgroup by CustomerID[m
[32m+[m[32morder by total_revenue desc;[m
[32m+[m
[32m+[m
[32m+[m[32m-- 👉 Find top 3 customers by total revenue[m
[32m+[m
[32m+[m[32mselect CustomerID,  sum(Quantity * UnitPrice) as top_Customer[m
[32m+[m[32mfrom sales_2025[m
[32m+[m[32mgroup by CustomerID[m
[32m+[m[32morder by top_Customer desc[m
[32m+[m[32mlimit 3;[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
[41m+[m
 [m
 [m
