SELECT
        g.EnglishCountryRegionName AS Region,
        g.City,
        SUM(i.SalesAmount) AS CityTotal,
        SUM(SUM(i.SalesAmount)) OVER(PARTITION BY g.EnglishCountryRegionName) AS RegionTotal,
        RANK() OVER(
                PARTITION BY g.EnglishCountryRegionName
                ORDER BY
                        SUM(i.SalesAmount) DESC
        ) AS RegionalRank
FROM
        FactInternetSales AS i
        JOIN DimDate AS d ON i.OrderDateKey = d.DateKey
        JOIN DimCustomer AS c ON i.CustomerKey = c.CustomerKey
        JOIN DimGeography AS g ON c.GeographyKey = g.GeographyKey
GROUP BY
        g.EnglishCountryRegionName,
        g.City
ORDER BY
        Region;