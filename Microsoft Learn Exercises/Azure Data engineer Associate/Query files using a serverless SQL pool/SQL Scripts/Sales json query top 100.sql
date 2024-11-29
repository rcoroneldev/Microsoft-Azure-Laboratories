-- This is auto-generated code
SELECT
    TOP 100 jsonContent
    /* --> place the keys that you see in JSON documents in the WITH clause:
     , JSON_VALUE (jsonContent, '$.key1') AS header1
     , JSON_VALUE (jsonContent, '$.key2') AS header2
     */
FROM
    OPENROWSET(
        BULK 'https://datalake2ipda7g.dfs.core.windows.net/files/sales/json/*',
        FORMAT = 'CSV',
        FIELDQUOTE = '0x0b',
        FIELDTERMINATOR = '0x0b',
        ROWTERMINATOR = '0x0b'
    ) WITH (jsonContent varchar(MAX)) AS [result]