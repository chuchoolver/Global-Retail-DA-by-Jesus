/*
=========================================================
 Script: 06_CreateDimCustomer.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Creates the Customer dimension table.
=========================================================
*/

USE RetailDW;
GO

CREATE TABLE dim.DimCustomer
(
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,

    CustomerName NVARCHAR(50) NOT NULL,

    Segment NVARCHAR(50) NOT NULL
);
GO