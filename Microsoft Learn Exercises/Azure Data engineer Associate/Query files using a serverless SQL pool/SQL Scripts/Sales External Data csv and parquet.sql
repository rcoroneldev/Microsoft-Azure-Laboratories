SELECT
    *
FROM
    OPENROWSET (
        BULK 'csv/*.csv',
        DATA_SOURCE = 'sales_data',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0'
    ) AS orders
SELECT
    *
FROM
    OPENROWSET (
        BULK 'parquet/year=*/*.snappy.parquet',
        DATA_SOURCE = 'sales_data',
        FORMAT = 'PARQUET'
    ) AS orders
WHERE
    orders.filepath (1) = '2019'