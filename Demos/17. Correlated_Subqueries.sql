-- Correlated subqueries reference objects in the outer query.

select CustomerID, SalesOrderID, OrderDate
from SalesLT.SalesOrderHeader as so1
order by SalesOrderID, OrderDate

select CustomerID, SalesOrderID, OrderDate
from SalesLT.SalesOrderHeader as so1
where OrderDate = 
	(select max(OrderDate) 
	from SalesLT.SalesOrderHeader as oh2 )

select CustomerID, SalesOrderID, OrderDate
from SalesLT.SalesOrderHeader as oh
where oh.OrderDate = 
	(select max(OrderDate) 
	from SalesLT.SalesOrderHeader as oh2 
	where oh2.CustomerID = oh.SalesOrderID)
order by oh.SalesOrderID, OrderDate