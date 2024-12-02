SELECT
        d.CalendarYear AS Year,
        d.MonthNumberOfYear AS Month,
        SUM(i.SalesAmount) AS InternetSalesAmount
FROM
        FactInternetSales AS i
        JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
GROUP BY
        d.CalendarYear,
        d.MonthNumberOfYear
ORDER BY
        Year,
        Month DESC;