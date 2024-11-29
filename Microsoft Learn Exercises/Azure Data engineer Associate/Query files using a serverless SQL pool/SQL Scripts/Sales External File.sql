CREATE EXTERNAL FILE FORMAT CsvFormat
WITH
    (
        FORMAT_TYPE = DELIMITEDTEXT,
        FORMAT_OPTIONS (FIELD_TERMINATOR = ',', STRING_DELIMITER = '"')
    );

GO;

CREATE EXTERNAL TABLE dbo.orders (
    SalesOrderNumber VARCHAR(10),
    SalesOrderLineNumber INT,
    OrderDate DATE,
    CustomerName VARCHAR(25),
    EmailAddress VARCHAR(50),
    Item VARCHAR(30),
    Quantity INT,
    UnitPrice DECIMAL(18, 2),
    TaxAmount DECIMAL(18, 2)
)
WITH
    (
        DATA_SOURCE = sales_data,
        LOCATION = 'csv/*.csv',
        FILE_FORMAT = CsvFormat
    );

GO