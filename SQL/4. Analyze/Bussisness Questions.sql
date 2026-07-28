
SELECT OrderDate FROM fact.FactSales
GROUP BY OrderDate
ORDER BY OrderDate DESC;
-- ULTIMA FECHA. 2014-12-31
-- PRIMERA FECHA. 2011-01-01


-- Sales Performance
-- 1.How are sales and profit evolving over time?

-- MIO
        SELECT FORMAT(OrderDate, 'MM-yyyy') AS MonthYear,
                SUM(Sales) AS TotalSales, 
                SUM(Profit) AS TotalProfit
        FROM fact.FactSales
        GROUP BY FORMAT(OrderDate, 'MM-yyyy')
        ORDER BY MIN(OrderDate)  ASC;

-- CHAT
        SELECT
            YEAR(OrderDate) AS [Year],
            MONTH(OrderDate) AS [Month],
            DATENAME(MONTH, OrderDate) AS [MonthName],
            SUM(Sales) AS TotalSales,
            SUM(Profit) AS TotalProfit
        FROM fact.FactSales
        GROUP BY
            YEAR(OrderDate),
            MONTH(OrderDate),
            DATENAME(MONTH, OrderDate)
        ORDER BY
            YEAR(OrderDate),
            MONTH(OrderDate);
--
        SELECT
            DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS Period,
            SUM(Sales) AS TotalSales,
            SUM(Profit) AS TotalProfit
        FROM fact.FactSales
        GROUP BY
            DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
        ORDER BY
            Period;

--- Which markets generate the highest revenue?

-- MIO
SELECT g.Market, 
       SUM(f.Sales) AS TotalSales
FROM fact.FactSales f
INNER JOIN dim.DimGeography g ON f.GeographyKey = g.GeographyKey
GROUP BY g.Market
ORDER BY TotalSales DESC; 

-- CHAT
SELECT
    g.Market,
    SUM(f.Sales) AS TotalSales
FROM fact.FactSales AS f
INNER JOIN dim.DimGeography AS g
    ON f.GeographyKey = g.GeographyKey
GROUP BY
    g.Market
ORDER BY
    TotalSales DESC;

--- 3. Which regions require additional attention?

--- POR SALES. MIO & CHAT
    SELECT g.Region, 
           SUM(f.Sales) AS TotalSales
    FROM fact.FactSales f
    INNER JOIN dim.DimGeography g ON f.GeographyKey = g.GeographyKey
    GROUP BY g.Region
    ORDER BY TotalSales ASC;

---  POR Regiones donde las ventas son buenas pero las ganancias son bajas.
    SELECT
        g.Region,
        SUM(f.Sales) AS TotalSales,
        SUM(f.Profit) AS TotalProfit,
        ROUND((SUM(f.Profit) / SUM(f.Sales)) * 100, 2) AS ProfitMargin
    FROM fact.FactSales AS f
    INNER JOIN dim.DimGeography AS g
        ON f.GeographyKey = g.GeographyKey
    GROUP BY
        g.Region
    ORDER BY
        ProfitMargin ASC;

--- Product Performance.
--- 4. Which product categories are the most profitable?

-- MIO
    SELECT p.Category, 
           SUM(f.Profit) AS CategoryMostProfitable
    FROM fact.FactSales f
    INNER JOIN dim.DimProduct p ON f.ProductKey = p.ProductKey
    GROUP BY p.Category
    ORDER BY CategoryMostProfitable DESC;

--- CHAT
    SELECT
        p.Category,
        SUM(f.Profit) AS TotalProfit
    FROM fact.FactSales AS f
    INNER JOIN dim.DimProduct AS p
        ON f.ProductKey = p.ProductKey
    GROUP BY
        p.Category
    ORDER BY
        TotalProfit DESC;

--- 5. Which products generate the highest sales?

--- MIO
    SELECT p.ProductName, 
           SUM(f.Sales) AS TotalSales
    FROM fact.FactSales f
    INNER JOIN dim.DimProduct p ON f.ProductKey = p.ProductKey
    GROUP BY p.ProductName
    ORDER BY TotalSales DESC;

--- CHAT
    SELECT
        p.ProductName,
        SUM(f.Sales) AS TotalSales
    FROM fact.FactSales AS f
    INNER JOIN dim.DimProduct AS p
        ON f.ProductKey = p.ProductKey
    GROUP BY
        p.ProductName
    ORDER BY
        TotalSales DESC;

--- 6. Which customer segments contribute the most revenue?
--- MIO
    SELECT c.Segment, 
           SUM(f.Sales) AS Revenue
    FROM fact.FactSales f
    INNER JOIN dim.DimCustomer c ON f.CustomerKey = c.CustomerKey
    GROUP BY c.Segment
    ORDER BY Revenue DESC;

--- CHAT
    SELECT
        c.Segment,
        SUM(f.Sales) AS TotalRevenue
    FROM fact.FactSales AS f
    INNER JOIN dim.DimCustomer AS c
        ON f.CustomerKey = c.CustomerKey
    GROUP BY
        c.Segment
    ORDER BY
        TotalRevenue DESC;

--- 7. How do discounts affect profitability?
--- CHAT
SELECT
    Discount,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM fact.FactSales
GROUP BY
    Discount
ORDER BY
    Discount ASC;

--- CHAT
SELECT
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.10 THEN '1% - 10%'
        WHEN Discount <= 0.20 THEN '11% - 20%'
        WHEN Discount <= 0.30 THEN '21% - 30%'
        ELSE 'Over 30%'
    END AS DiscountRange,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM fact.FactSales
GROUP BY
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.10 THEN '1% - 10%'
        WHEN Discount <= 0.20 THEN '11% - 20%'
        WHEN Discount <= 0.30 THEN '21% - 30%'
        ELSE 'Over 30%'
    END
ORDER BY
    MIN(Discount);

--- 8. Which shipping methods are most frequently used?

--- MIO
    SELECT s.ShipMode, 
           COUNT(f.ShipModeKey) AS ShippingMethodMostUsed
    FROM fact.FactSales f
    INNER JOIN dim.DimShipMode s ON f.ShipModeKey = s.ShipModeKey
    GROUP BY s.ShipMode
    ORDER BY ShippingMethodMostUsed DESC;
    

--- CHAT
    SELECT s.ShipMode, 
           COUNT(DISTINCT f.OrderID) AS ShippingMethodMostUsed
    FROM fact.FactSales f
    INNER JOIN dim.DimShipMode s ON f.ShipModeKey = s.ShipModeKey
    GROUP BY s.ShipMode
    ORDER BY ShippingMethodMostUsed DESC;
    

    SELECT DISTINCT(Segment) FROM dim.DimCustomer;

    SEGMENT CON MAYORES/MENORES VENTAS
    MARKET CON MAYORES/MENORES VENTAS
    COUNTRY CON MAYORES/MENORES VENTAS
    PRODUCTNAME CON MAYORES/MENORES VENTAS
    CATEGORY CON MAYORES/MENORES VENTAS
    SHIPMODE CON MAYORES/MENORES VENTAS
    SALES
    PROFIT