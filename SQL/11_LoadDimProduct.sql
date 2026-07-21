/*
=========================================================
 Script: 11_LoadDimProduct.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Loads data into the Product dimension.
=========================================================
*/

USE RetailDW;
GO

INSERT INTO dim.DimProduct
(
    ProductID,
    Category,
    SubCategory,
    ProductName
)
SELECT DISTINCT
       product_id,
       category,
       sub_category,
       product_name
FROM stg.SuperStoreOrders
ORDER BY
       category,
       sub_category,
       product_name;
GO

-- Validate data
SELECT *
FROM dim.DimProduct
ORDER BY ProductKey;
GO