-- Basic Inner Join
select SalesLT.Product.Name as ProductName, SalesLT.ProductCategory.Name as Category,
	SalesLT.Product.ProductCategoryID, SalesLT.ProductCategory.ProductCategoryID
from SalesLT.Product
inner join SalesLT.ProductCategory
on SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID

-- table aliases
select sp.Name as ProductName, spc.Name as Category
from SalesLT.Product as sp
join SalesLT.ProductCategory as spc
on sp.ProductCategoryID = spc.ProductCategoryID

-- joining more than 2 tables
select oh.OrderDate, oh.SalesOrderNumber, p.name as ProductName, od.OrderQty, od.UnitPrice, od.LineTotal
from SalesLT.SalesOrderHeader as oh
join SalesLT.SalesOrderDetail as od
on od.SalesOrderID = oh.SalesOrderID
join SalesLT.Product as p
on od.ProductID = p.ProductID
order by oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID

-- multiple join predicates
select oh.OrderDate, oh.SalesOrderNumber, p.Name as ProductName, od.OrderQty, od.UnitPrice, od.LineTotal,
		od.SalesOrderID, oh.SalesOrderID, od.ProductID, p.ProductID, od.UnitPrice, p.ListPrice
from SalesLT.SalesOrderHeader as oh
join SalesLT.SalesOrderDetail as od
on od.SalesOrderID = oh.SalesOrderID
join SalesLT.Product as p
on od.ProductID = p.ProductID and od.UnitPrice < p.ListPrice
where p.Name LIKE 'H%'
order by oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID


