/*
=========================================================
 Script: 15_CreateIndexes.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Creates nonclustered indexes to improve query
 performance in the FactSales table.
=========================================================
*/

USE RetailDW;
GO

---------------------------------------------------------
-- Customer
---------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_FactSales_CustomerKey
ON fact.FactSales(CustomerKey);
GO

---------------------------------------------------------
-- Geography
---------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_FactSales_GeographyKey
ON fact.FactSales(GeographyKey);
GO

---------------------------------------------------------
-- Product
---------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_FactSales_ProductKey
ON fact.FactSales(ProductKey);
GO

---------------------------------------------------------
-- Ship Mode
---------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_FactSales_ShipModeKey
ON fact.FactSales(ShipModeKey);
GO

---------------------------------------------------------
-- Order Date
---------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_FactSales_OrderDate
ON fact.FactSales(OrderDate);
GO