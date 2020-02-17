/*The WHERE is happening before theaggregation,
the HAVING is happening after the aggregation, on the results of the aggregation.*/

select CustomerID, COUNT(*) as Orders
from SalesLT.SalesOrderHeader
group by CustomerID
having COUNT(*) > 10

select ProductID, sod.OrderQty
from SalesLT.SalesOrderDetail as sod
join SalesLT.SalesOrderHeader as soh
on sod.SalesOrderID = soh.SalesOrderID
where YEAR(soh.OrderDate) = 2008

select ProductID, SUM(sod.OrderQty) as Quantity
from SalesLT.SalesOrderDetail as sod
join SalesLT.SalesOrderHeader as soh
on sod.SalesOrderID = soh.SalesOrderID
where YEAR(soh.OrderDate) = 2008 
group by ProductID
having SUM(sod.OrderQty) > 50

