
/*
=========================================================
 Script: 04_CreateDimShipMode.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Creates the Ship Mode dimension table.
=========================================================
*/

USE RetailDW;
GO

CREATE TABLE dim.DimShipMode
(
    ShipModeKey INT IDENTITY(1,1) PRIMARY KEY,

    ShipMode NVARCHAR(50) NOT NULL,

    OrderPriority NVARCHAR(50) NOT NULL
);
GO

select * from dim.DimShipMode;