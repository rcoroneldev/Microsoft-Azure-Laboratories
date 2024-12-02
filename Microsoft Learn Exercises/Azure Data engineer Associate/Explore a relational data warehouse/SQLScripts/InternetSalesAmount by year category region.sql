SELECT
        d.CalendarYear AS Year,
        pc.EnglishProductCategoryName AS ProductCategory,
        g.EnglishCountryRegionName AS Region,
        SUM(i.SalesAmount) AS InternetSalesAmount
FROM
        FactInternetSales AS i
        JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
        JOIN DimCustomer AS c ON i.CustomerKey = c.CustomerKey
        JOIN DimGeography AS g ON c.GeographyKey = g.GeographyKey
        JOIN DimProduct AS p ON i.ProductKey = p.ProductKey
        JOIN DimProductSubcategory AS ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
        JOIN DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY
        d.CalendarYear,
        pc.EnglishProductCategoryName,
        g.EnglishCountryRegionName
ORDER BY
        Year,
        ProductCategory,
        Region;