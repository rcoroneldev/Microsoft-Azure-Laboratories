SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://datalake2ipda7g.dfs.core.windows.net/files/sales/csv/',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0'
    ) WITH (
        SalesOrderNumber VARCHAR(10) COLLATE Latin1_General_100_BIN2_UTF8,
        SalesOrderLineNumber INT,
        OrderDate DATE,
        CustomerName VARCHAR(25) COLLATE Latin1_General_100_BIN2_UTF8,
        EmailAddress VARCHAR(50) COLLATE Latin1_General_100_BIN2_UTF8,
        Item VARCHAR(30) COLLATE Latin1_General_100_BIN2_UTF8,
        Quantity INT,
        UnitPrice DECIMAL(18, 2),
        TaxAmount DECIMAL (18, 2)
    ) AS [result]