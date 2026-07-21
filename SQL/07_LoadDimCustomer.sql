/*
=========================================================
 Script: 07_LoadDimCustomer.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Loads data into the Customer dimension.
=========================================================
*/

USE RetailDW;
GO

INSERT INTO dim.DimCustomer
(
    CustomerName,
    Segment
)
SELECT DISTINCT
       customer_name,
       segment
FROM stg.SuperStoreOrders
ORDER BY customer_name;
GO

SELECT *
FROM dim.DimCustomer;