/*
=========================================================
 Script: 13_LoadFactSales.sql
 Project: Global Retail BI
 Database: RetailDW
 Author: Jesus Olvera

 Description:
 Loads data into the FactSales table by resolving
 surrogate keys from all dimension tables.
=========================================================
*/

USE RetailDW;
GO

---------------------------------------------------------
-- Clear existing data
---------------------------------------------------------

TRUNCATE TABLE fact.FactSales;
GO

---------------------------------------------------------
-- Load FactSales
---------------------------------------------------------

INSERT INTO fact.FactSales
(
    OrderID,
    OrderDate,
    ShipDate,
    CustomerKey,
    GeographyKey,
    ProductKey,
    ShipModeKey,
    Sales,
    Quantity,
    Discount,
    Profit,
    ShippingCost
)
SELECT
    st.order_id,
    st.order_date,
    st.ship_date,

    dc.CustomerKey,
    dg.GeographyKey,
    dp.ProductKey,
    ds.ShipModeKey,

    st.sales,
    st.quantity,
    st.discount,
    st.profit,
    st.shipping_cost

FROM stg.SuperStoreOrders AS st

INNER JOIN dim.DimCustomer AS dc
    ON st.customer_name = dc.CustomerName
   AND st.segment = dc.Segment

INNER JOIN dim.DimGeography AS dg
    ON st.country = dg.Country
   AND st.market = dg.Market
   AND st.region = dg.Region
   AND st.state = dg.State

INNER JOIN dim.DimProduct AS dp
    ON st.product_id = dp.ProductID
   AND st.category = dp.Category
   AND st.sub_category = dp.SubCategory
   AND st.product_name = dp.ProductName

INNER JOIN dim.DimShipMode AS ds
    ON st.ship_mode = ds.ShipMode
   AND st.order_priority = ds.OrderPriority;
GO

---------------------------------------------------------
-- Validation
---------------------------------------------------------

SELECT COUNT(*) AS StagingRows
FROM stg.SuperStoreOrders;

SELECT COUNT(*) AS FactSalesRows
FROM fact.FactSales;

SELECT *
FROM fact.FactSales
GO

SELECT *
FROM stg.SuperStoreOrders
WHERE order_id = 'AG-2011-2040';