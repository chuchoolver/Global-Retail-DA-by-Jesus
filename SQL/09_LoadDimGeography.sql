/*
=========================================================
 Script: 09_LoadDimGeography.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Loads data into the Geography dimension.
=========================================================
*/

USE RetailDW;
GO

INSERT INTO dim.DimGeography
(
    Country,
    Market,
    Region,
    State
)
SELECT DISTINCT
       country,
       market,
       region,
       state
FROM stg.SuperStoreOrders
ORDER BY country, state;
GO

SELECT *
FROM dim.DimGeography;