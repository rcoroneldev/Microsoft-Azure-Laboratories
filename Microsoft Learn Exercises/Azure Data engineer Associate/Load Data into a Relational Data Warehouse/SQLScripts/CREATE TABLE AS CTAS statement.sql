CREATE TABLE dbo.DimProduct WITH (
    DISTRIBUTION = HASH(ProductAltKey),
    CLUSTERED COLUMNSTORE INDEX
) AS
SELECT
    ROW_NUMBER() OVER(
        ORDER BY
            ProductID
    ) AS ProductKey,
    ProductID AS ProductAltKey,
    ProductName,
    ProductCategory,
    Color,
    Size,
    ListPrice,
    Discontinued
FROM
    dbo.StageProduct;

SELECT
    count(1)
FROM
    dbo.DimProduct;

SELECT
    ProductKey,
    ProductAltKey,
    ProductName,
    ProductCategory,
    Color,
    Size,
    ListPrice,
    Discontinued
FROM
    dbo.DimProduct;