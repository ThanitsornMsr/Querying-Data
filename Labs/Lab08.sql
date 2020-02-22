-- Challenge 1: Retrieve Regional Sales Totals
/* An existing report uses the following query to return total sales revenue grouped by country/region and
state/province.

SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY a.CountryRegion, a.StateProvince
ORDER BY a.CountryRegion, a.StateProvince

You have been asked to modify this query so that the results include a grand total for all sales revenue
and a subtotal for each country/region in addition to the state/province subtotals that are already
returned. */

SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY rollup (a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince

/*Modify your query to include a column named Level that indicates at which level in the total,
country/region, and state/province hierarchy the revenue figure in the row is aggregated. For example,
the grand total row should contain the value ‘Total’, the row showing the subtotal for United States
should contain the value ‘United States Subtotal’, and the row showing the subtotal for California should
contain the value ‘California Subtotal’.*/

SELECT a.CountryRegion, a.StateProvince, 
	IIF(GROUPING_ID(a.CountryRegion) = 1 AND GROUPING_ID(a.StateProvince) = 1, 'Total', 
		IIF(GROUPING_ID(a.StateProvince) = 1, a.CountryRegion + ' Subtotal', a.StateProvince + ' Subtotal')) AS Level,
	SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY rollup (a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince


/* Extend your query to include a grouping for individual cities. */

SELECT a.CountryRegion, a.StateProvince, a.City, 
	IIF(GROUPING_ID(a.CountryRegion) = 1 AND GROUPING_ID(a.StateProvince) = 1, 'Total', 
		IIF(GROUPING_ID(a.StateProvince) = 1, a.CountryRegion + ' Subtotal',
			IIF(GROUPING_ID(a.City) = 1, a.StateProvince + ' Subtotal', a.City + ' Total'))) as level,
	SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY rollup (a.CountryRegion, a.StateProvince,a.City)
ORDER BY a.CountryRegion, a.StateProvince, a.City



--Challenge 2: Retrieve Customer Sales Revenue by Category
/* Retrieve a list of customer company names together with their total revenue for each parent category in
Accessories, Bikes, Clothing, and Components. */

select *
FROM
	(select CompanyName, ParentProductCategoryName, LineTotal
	from SalesLT.Customer as c
	join SalesLT.SalesOrderHeader as h
	on c.CustomerID = h.CustomerID
	join SalesLT.SalesOrderDetail as d
	on h.SalesOrderID = d.SalesOrderID
	join SalesLT.Product as p
	on d.ProductID = p.ProductID
	join SalesLT.vGetAllCategories as g
	on p.ProductCategoryID = g.ProductCategoryID) as ppc
pivot (sum(LineTotal) for ParentProductCategoryName IN ([Accessories], [Bikes], [Clothing], [Components])) as pct




