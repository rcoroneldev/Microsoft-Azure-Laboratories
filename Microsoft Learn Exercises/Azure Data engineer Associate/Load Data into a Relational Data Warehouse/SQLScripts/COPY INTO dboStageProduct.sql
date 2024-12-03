COPY INTO dbo.StageProduct (
    ProductID,
    ProductName,
    ProductCategory,
    Color,
    Size,
    ListPrice,
    Discontinued
)
FROM
    'https://datalake2lt4j8u.blob.core.windows.net/files/data/Product.csv' WITH (
        FILE_TYPE = 'CSV',
        MAXERRORS = 0,
        IDENTITY_INSERT = 'OFF',
        FIRSTROW = 2 --Skip header row
    );

SELECT
    COUNT(1)
FROM
    dbo.StageProduct