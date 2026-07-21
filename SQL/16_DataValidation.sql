/*
=========================================================
 Script: 16_DataValidation.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Performs data quality validation after the ETL process.
=========================================================
*/

USE RetailDW;
GO

---------------------------------------------------------
-- 1. Compare Row Counts
---------------------------------------------------------

SELECT
    (SELECT COUNT(*) FROM stg.SuperStoreOrders) AS StagingRows,
    (SELECT COUNT(*) FROM fact.FactSales) AS FactRows;
GO

---------------------------------------------------------
-- 2. Compare Total Sales
---------------------------------------------------------

SELECT
    (SELECT SUM(sales) FROM stg.SuperStoreOrders) AS StagingSales,
    (SELECT SUM(Sales) FROM fact.FactSales) AS FactSales;
GO

---------------------------------------------------------
-- 3. Compare Total Profit
---------------------------------------------------------

SELECT
    (SELECT SUM(profit) FROM stg.SuperStoreOrders) AS StagingProfit,
    (SELECT SUM(Profit) FROM fact.FactSales) AS FactProfit;
GO

---------------------------------------------------------
-- 4. Compare Total Quantity
---------------------------------------------------------

SELECT
    (SELECT SUM(quantity) FROM stg.SuperStoreOrders) AS StagingQuantity,
    (SELECT SUM(Quantity) FROM fact.FactSales) AS FactQuantity;
GO

---------------------------------------------------------
-- 5. Check for NULL Foreign Keys
---------------------------------------------------------

SELECT
    COUNT(*) AS NullForeignKeys
FROM fact.FactSales
WHERE CustomerKey IS NULL
   OR GeographyKey IS NULL
   OR ProductKey IS NULL
   OR ShipModeKey IS NULL;
GO

---------------------------------------------------------
-- 6. Check for Orphan Records
---------------------------------------------------------

SELECT COUNT(*) AS OrphanCustomers
FROM fact.FactSales f
LEFT JOIN dim.DimCustomer d
    ON f.CustomerKey = d.CustomerKey
WHERE d.CustomerKey IS NULL;
GO

SELECT COUNT(*) AS OrphanGeographies
FROM fact.FactSales f
LEFT JOIN dim.DimGeography d
    ON f.GeographyKey = d.GeographyKey
WHERE d.GeographyKey IS NULL;
GO

SELECT COUNT(*) AS OrphanProducts
FROM fact.FactSales f
LEFT JOIN dim.DimProduct d
    ON f.ProductKey = d.ProductKey
WHERE d.ProductKey IS NULL;
GO

SELECT COUNT(*) AS OrphanShipModes
FROM fact.FactSales f
LEFT JOIN dim.DimShipMode d
    ON f.ShipModeKey = d.ShipModeKey
WHERE d.ShipModeKey IS NULL;
GO

---------------------------------------------------------
-- 7. Sample Data Validation
---------------------------------------------------------

SELECT TOP (10)
    f.OrderID,
    c.CustomerName,
    p.ProductName,
    g.Country,
    s.ShipMode,
    f.Sales,
    f.Quantity,
    f.Profit
FROM fact.FactSales f

INNER JOIN dim.DimCustomer c
    ON f.CustomerKey = c.CustomerKey

INNER JOIN dim.DimProduct p
    ON f.ProductKey = p.ProductKey

INNER JOIN dim.DimGeography g
    ON f.GeographyKey = g.GeographyKey

INNER JOIN dim.DimShipMode s
    ON f.ShipModeKey = s.ShipModeKey;
GO
