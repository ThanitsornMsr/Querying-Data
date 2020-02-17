-- Window Functions

--RANK ( ) OVER ( [ partition_by_clause ] order_by_clause ) 
select TOP(100) ProductID, Name, ListPrice,
	RANK() OVER(Order by ListPrice desc) as RankByPrice
from SalesLT.Product as p
order by RankByPrice

/*if you like GROUP BY product category, so for
each product category, give me the ranking. So
adding an extra level within that
using this PETITION BY*/
select c.Name as Category, p.Name as Product, ListPrice,
	RANK() OVER(PARTITION By c.Name Order by Listprice desc) as RankByPrice
from SalesLT.Product as p
join SalesLT.ProductCategory as c
on p.ProductCategoryID = c.ProductCategoryID
order by Category, RankByPrice


