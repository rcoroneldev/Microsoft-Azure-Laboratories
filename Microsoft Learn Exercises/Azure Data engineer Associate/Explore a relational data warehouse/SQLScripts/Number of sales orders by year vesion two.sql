SELECT
    d.CalendarYear AS CalendarYear,
    APPROX_COUNT_DISTINCT(i.SalesOrderNumber) AS Orders
FROM
    FactInternetSales AS i
    JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
GROUP BY
    d.CalendarYear
ORDER BY
    CalendarYear;