SELECT
        g.EnglishCountryRegionName AS Region,
        ROW_NUMBER() OVER(
                PARTITION BY g.EnglishCountryRegionName
                ORDER BY
                        i.SalesAmount ASC
        ) AS RowNumber,
        i.SalesOrderNumber AS OrderNo,
        i.SalesOrderLineNumber AS LineItem,
        i.SalesAmount AS SalesAmount,
        SUM(i.SalesAmount) OVER(PARTITION BY g.EnglishCountryRegionName) AS RegionTotal,
        AVG(i.SalesAmount) OVER(PARTITION BY g.EnglishCountryRegionName) AS RegionAverage
FROM
        FactInternetSales AS i
        JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
        JOIN DimCustomer AS c ON i.CustomerKey = c.CustomerKey
        JOIN DimGeography AS g ON c.GeographyKey = g.GeographyKey
WHERE
        d.CalendarYear = 2022
ORDER BY
        Region;