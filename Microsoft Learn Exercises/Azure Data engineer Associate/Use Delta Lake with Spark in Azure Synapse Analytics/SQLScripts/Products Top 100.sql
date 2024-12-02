-- Read multiple files with same schema
-- This is auto-generated code

SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK (
            'https://datalakefjby2rx.dfs.core.windows.net/files/delta/products-delta/*'
        ),
        FORMAT = 'PARQUET'
    ) AS [result]
