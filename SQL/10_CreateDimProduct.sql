/*
=========================================================
 Script: 10_CreateDimProduct.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Creates the Product dimension table.
=========================================================
*/

USE RetailDW;
GO

-- Drop table if it already exists
IF OBJECT_ID('dim.DimProduct', 'U') IS NOT NULL
    DROP TABLE dim.DimProduct;
GO

-- Create Product Dimension
CREATE TABLE dim.DimProduct
(
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,

    ProductID NVARCHAR(50) NOT NULL,

    Category NVARCHAR(50) NOT NULL,

    SubCategory NVARCHAR(50) NOT NULL,

    ProductName NVARCHAR(255) NOT NULL
);
GO