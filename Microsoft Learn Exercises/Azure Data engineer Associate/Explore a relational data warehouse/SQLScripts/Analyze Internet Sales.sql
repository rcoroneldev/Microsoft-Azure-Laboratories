SELECT
        d.CalendarYear AS Year,
        SUM(i.SalesAmount) AS InternetSalesAmount
FROM
        FactInternetSales AS i
        JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
GROUP BY
        d.CalendarYear
ORDER BY
        Year;