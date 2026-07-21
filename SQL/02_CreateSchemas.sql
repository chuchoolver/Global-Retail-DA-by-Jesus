/*
=========================================================
 Script: 02_CreateSchemas.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Creates the schemas used by the Data Warehouse.
=========================================================
*/

USE RetailDW;
GO

CREATE SCHEMA stg;
GO

CREATE SCHEMA dim;
GO

CREATE SCHEMA fact;
GO