USE Sales;

GO
;

CREATE PROCEDURE sp_GetYearlySales AS BEGIN -- drop existing table
IF EXISTS (
    SELECT
        *
    FROM
        sys.external_tables
    WHERE
        name = 'YearlySalesTotals'
) DROP EXTERNAL TABLE YearlySalesTotals -- create external table
CREATE EXTERNAL TABLE YearlySalesTotals WITH (
    LOCATION = 'sales/yearlysaales/',
    DATA_SOURCE = sales_data,
    FILE_FORMAT = ParquetFormat
) AS
SELECT
    YEAR(OrderDate) AS CalendarYear,
    SUM(Quantity) AS ItemsSold,
    ROUND(SUM(UnitPrice) - SUM(TaxAmount), 2) AS NetRevenue
FROM
    OPENROWSET(
        BULK 'sales/csv/*.csv',
        DATA_SOURCE = 'sales_data',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS orders
GROUP BY
    YEAR(OrderDate)
END EXEC sp_GetYearlySales;