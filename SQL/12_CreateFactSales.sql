/*
=========================================================
 Script: 12_CreateFactSales.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Creates the Fact Sales table.
=========================================================
*/

USE RetailDW;
GO

-- Drop table if it already exists
IF OBJECT_ID('fact.FactSales', 'U') IS NOT NULL
    DROP TABLE fact.FactSales;
GO

CREATE TABLE fact.FactSales
(
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,

    OrderID NVARCHAR(50) NOT NULL,

    OrderDate DATE NOT NULL,

    ShipDate DATE NOT NULL,

    CustomerKey INT NOT NULL,

    GeographyKey INT NOT NULL,

    ProductKey INT NOT NULL,

    ShipModeKey INT NOT NULL,

    Sales DECIMAL(18,2) NOT NULL,

    Quantity INT NOT NULL,

    Discount DECIMAL(18,2) NOT NULL,

    Profit DECIMAL(18,2) NOT NULL,

    ShippingCost DECIMAL(18,2) NOT NULL
);
GO