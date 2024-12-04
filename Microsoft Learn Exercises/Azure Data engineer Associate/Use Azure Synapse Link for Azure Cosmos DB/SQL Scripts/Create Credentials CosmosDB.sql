
-- Crete credential to allow the acces to Azure CosmosDB

CREATE CREDENTIAL cosmosLastVersion
 WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
 SECRET = 's2bHNGUmo6hNICPIKag8KBmx98deWs5KtJAyBFTdZ7ovEDpAkW3bttQT3SrFb2akSbJQhxmYiwkxACDb3Iyijw=='
 GO


SELECT TOP 100 *
FROM OPENROWSET(​PROVIDER = 'CosmosDB',
                CONNECTION = 'Account=cosmospbc7ax41;Database=AdventureWorks',
                OBJECT = 'Sales',
                SERVER_CREDENTIAL = 'cosmosLastVersion'
) AS [Sales]
