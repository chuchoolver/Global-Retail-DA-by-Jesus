/*
=========================================================
 Script: 05_LoadDimShipMode.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Loads data into the Ship Mode dimension.
=========================================================
*/

USE RetailDW;
GO

INSERT INTO dim.DimShipMode
(
    ShipMode,
    OrderPriority
)
SELECT DISTINCT
       ship_mode,
       order_priority
FROM stg.SuperStoreOrders
ORDER BY ship_mode;
GO


SELECT *
FROM dim.DimShipMode;