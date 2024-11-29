
-- TABLE PRODUCT

SELECT ProductID, Name, ListPrice, ProductCategoryID
FROM SalesLT.Product;

-- TABLE PRODUCT CATEGORY

SELECT p.ProductID, p.Name AS ProductName, c.Name AS Category, p.ListPrice
FROM SalesLT.Product AS p
JOIN [SalesLT].[ProductCategory] AS c
ON p.ProductCategoryID = c.ProductCategoryID;



