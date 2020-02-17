select CustomerID, COUNT(*) as Orders
from SalesLT.SalesOrderHeader
group by CustomerID

select c.SalesPerson, oh.SubTotal as SalesRevenue
from SalesLT.Customer as c
left join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID

select c.SalesPerson, COUNT(ISNULL(oh.SubTotal,0.0))as TotalCustomer, sum(isnull(oh.SubTotal,0.0)) as SalesRevenue
from SalesLT.Customer as c
left join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID
group by c.SalesPerson
order by SalesRevenue desc

--GROUP BY happens before SELECT so can't use alias 

select c.SalesPerson, CONCAT(c.FirstName + ' ', c.LastName) as Customer , isnull(SUM(oh.SubTotal),0.0) as SalesRevenue
from SalesLT.Customer as c
left join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID
group by c.SalesPerson, CONCAT(c.FirstName + ' ', c.LastName)
order by SalesRevenue desc, Customer