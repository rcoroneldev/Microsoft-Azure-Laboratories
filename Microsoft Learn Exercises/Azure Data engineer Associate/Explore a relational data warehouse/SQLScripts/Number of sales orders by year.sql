SELECT
    d.CalendarYear AS CalendarYear,
    COUNT(DISTINCT i.SalesOrderNumber) AS Orders
FROM
    FactInternetSales AS i
    JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
GROUP BY
    d.CalendarYear
ORDER BY
    CalendarYear;