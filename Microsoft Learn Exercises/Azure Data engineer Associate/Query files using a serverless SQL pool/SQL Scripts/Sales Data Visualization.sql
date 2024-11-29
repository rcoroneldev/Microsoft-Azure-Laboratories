SELECT
       YEAR(OrderDate) AS OrderYear,
       SUM((UnitPrice * Quantity) + TaxAmount) AS GrossRevenue
FROM
       dbo.orders
GROUP BY
       YEAR(OrderDate)
ORDER BY
       OrderYear;