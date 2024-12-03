ALTER INDEX ALL ON dbo.DimProduct REBUILD;

CREATE STATISTICS customergeo_stats ON dbo.DimCustomer (GeographyKey);