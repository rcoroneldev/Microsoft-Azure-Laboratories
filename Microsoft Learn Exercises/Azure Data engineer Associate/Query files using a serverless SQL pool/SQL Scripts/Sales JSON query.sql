SELECT
    JSON_VALUE (Doc, '$.SalesOrderNumber') AS OrderNumber,
    JSON_VALUE (Doc, '$.CustomerName') AS Customer,
    Doc
FROM
    OPENROWSET (
        BULK 'https://datalake2ipda7g.dfs.core.windows.net/files/sales/json/',
        FORMAT = 'CSV',
        FIELDTERMINATOR = '0x0b',
        FIELDQUOTE = '0x0b',
        ROWTERMINATOR = '0x0b'
    )
WITH
    (Doc NVARCHAR (MAX)) as rows