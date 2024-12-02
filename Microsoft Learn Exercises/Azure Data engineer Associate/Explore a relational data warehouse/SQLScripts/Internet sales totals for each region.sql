SELECT
        d.CalendarYear AS Year,
        g.EnglishCountryRegionName AS Region,
        SUM(i.SalesAmount) AS InternetSalesAmount
FROM
        FactInternetSales AS i
        JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
        JOIN DimCustomer AS c ON i.CustomerKey = c.CustomerKey
        JOIN DimGeography AS g ON c.GeographyKey = g.GeographyKey
GROUP BY
        d.CalendarYear,
        g.EnglishCountryRegionName
ORDER BY
        Year,
        Region;