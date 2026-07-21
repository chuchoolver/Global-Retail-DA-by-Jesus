/*
=========================================================
 Script: 14_AddForeignKeys.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Adds foreign key constraints to FactSales.
=========================================================
*/

USE RetailDW;
GO

---------------------------------------------------------
-- Customer
---------------------------------------------------------

ALTER TABLE fact.FactSales
ADD CONSTRAINT FK_FactSales_DimCustomer
FOREIGN KEY (CustomerKey)
REFERENCES dim.DimCustomer(CustomerKey);
GO

---------------------------------------------------------
-- Geography
---------------------------------------------------------

ALTER TABLE fact.FactSales
ADD CONSTRAINT FK_FactSales_DimGeography
FOREIGN KEY (GeographyKey)
REFERENCES dim.DimGeography(GeographyKey);
GO

---------------------------------------------------------
-- Product
---------------------------------------------------------

ALTER TABLE fact.FactSales
ADD CONSTRAINT FK_FactSales_DimProduct
FOREIGN KEY (ProductKey)
REFERENCES dim.DimProduct(ProductKey);
GO

---------------------------------------------------------
-- Ship Mode
---------------------------------------------------------

ALTER TABLE fact.FactSales
ADD CONSTRAINT FK_FactSales_DimShipMode
FOREIGN KEY (ShipModeKey)
REFERENCES dim.DimShipMode(ShipModeKey);
GO

EXEC sp_help 'fact.FactSales';