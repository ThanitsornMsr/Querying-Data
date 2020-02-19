/*	Views are database objects that encapsulate SELECT queries.
	You can query a view in the same way as a table, however there are some considerations for updating them.
*/

create view SalesLT.vSalesOrders
as
select oh.SalesOrderID, oh.OrderDate, oh.CustomerID, 
	od.LineTotal, od.ProductID, od.OrderQty
from SalesLT.SalesOrderHeader as oh
join SalesLT.SalesOrderDetail as od
on oh.SalesOrderID = od.SalesOrderID

select SalesOrderID, CustomerID, ProductID
from SalesLT.vSalesOrders
order by SalesOrderID

--Create View
create view SalesLT.vCustomerAddress
as
select c.CustomerID, FirstName, LastName, AddressLine1, City, StateProvince 
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as a
on ca.AddressID = a.AddressID

-- query the view
select CustomerID, City
from SalesLT.vCustomerAddress

-- join the view to a table
select c.StateProvince, c.City, ISNULL(SUM(oh.TotalDue),0.00) as Revenue
from SalesLT.vCustomerAddress as c
left join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID
group by c.StateProvince, c.City
order by c.StateProvince, Revenue desc

