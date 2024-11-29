-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://datalake2ipda7g.blob.core.windows.net/files/sales/csv/2021.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0'
    ) AS [result]