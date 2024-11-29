
 SELECT YEAR(OrderDate) AS OrderYear,
        COUNT(*) AS OrderedItems
 FROM
     OPENROWSET(
        BULK 'https://datalake2ipda7g.dfs.core.windows.net/files/sales/parquet/year=*/',
        FORMAT = 'PARQUET'
     ) AS [result]
 WHERE [result].filepath(1) IN ('2019','2020','2021')
 GROUP BY YEAR(OrderDate)
 ORDER BY OrderYear