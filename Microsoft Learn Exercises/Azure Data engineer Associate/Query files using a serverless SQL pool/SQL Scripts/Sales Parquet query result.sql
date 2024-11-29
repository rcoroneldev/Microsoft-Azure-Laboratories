SELECT
    YEAR(OrderDate) AS OrderYear,
    COUNT(*) AS OrderedItems
FROM
    OPENROWSET(
        BULK 'https://datalake2ipda7g.dfs.core.windows.net/files/sales/parquet/**',
        FORMAT = 'PARQUET'
    ) AS [result]
GROUP BY
    YEAR(OrderDate)
ORDER BY
    OrderYear