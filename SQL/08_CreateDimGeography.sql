/*
=========================================================
 Script: 08_CreateDimGeography.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Creates the Customer dimension table.
=========================================================
*/

USE RetailDW;
GO

CREATE TABLE dim.DimGeography
(
	GeographyKey INT IDENTITY(1,1) PRIMARY KEY,
	Country NVARCHAR(50) NOT NULL,
	Market NVARCHAR(50) NOT NULL,
	Region NVARCHAR(50) NOT NULL,
	State NVARCHAR(50) NOT NULL
);
GO

select * from dim.DimGeography;

