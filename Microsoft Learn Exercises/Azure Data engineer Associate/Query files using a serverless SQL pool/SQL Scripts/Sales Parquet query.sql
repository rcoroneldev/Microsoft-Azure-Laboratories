-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://datalake2ipda7g.dfs.core.windows.net/files/sales/parquet/**',
        FORMAT = 'PARQUET'
    ) AS [result]