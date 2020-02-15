-- get all customers, with sales orders for those who've bought anything
select c.FirstName, c.LastName, oh.SalesOrderNumber
from SalesLT.Customer as c
left join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID
order by c.CustomerID

-- get all customers, with sales orders for those who haven't bought anything
select c.FirstName, c.LastName, oh.SalesOrderNumber
from SalesLT.Customer as c
left join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID
where oh.SalesOrderNumber is NULL
order by c.CustomerID

-- more than 2 tables
select p.ProductID, p.Name as ProductName, od.SalesOrderID, oh.SalesOrderNumber
from SalesLT.Product as p
left join SalesLT.SalesOrderDetail as od
on p.ProductID = od.ProductID
left join SalesLT.SalesOrderHeader as oh
on od.SalesOrderID = oh.SalesOrderID
order by p.ProductID

select p.ProductID, p.Name as ProductName, c.ProductCategoryID, c.Name as Category, od.SalesOrderID, oh.SalesOrderNumber
from SalesLT.Product as p
left join SalesLT.SalesOrderDetail as od
on p.ProductID = od.ProductID
left join SalesLT.SalesOrderHeader as oh
on od.SalesOrderID = oh.SalesOrderID
inner join SalesLT.ProductCategory as c
on p.ProductCategoryID = c.ProductCategoryID
order by p.ProductID



