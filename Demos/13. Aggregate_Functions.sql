-- COUNT ( { [ [ ALL | DISTINCT ] expression ] | * } )  
/*	COUNT(*) returns the number of items in a group. This includes NULL values and duplicates.
	COUNT(ALL expression) evaluates expression for each row in a group, and returns the number of nonnull values.
	COUNT(DISTINCT expression) evaluates expression for each row in a group, and returns the number of unique, nonnull values.*/

select COUNT(*) as Product,
	COUNT(Distinct ProductCategoryID) as Categories,
	AVG(ListPrice) as AveragePrice
from SalesLT.Product

select COUNT(p.ProductID) as BikeModels,
	AVG(p.ListPrice) as AveragePrice
from SalesLT.Product as p
join SalesLT.ProductCategory as c
on p.ProductCategoryID = c.ProductCategoryID
where c.Name LIKE '%Bikes'

select p.ProductID as BikeModels,
	p.ListPrice as AveragePrice
from SalesLT.Product as p
join SalesLT.ProductCategory as c
on p.ProductCategoryID = c.ProductCategoryID
where c.Name LIKE '%Bikes'


