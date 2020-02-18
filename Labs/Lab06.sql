-- Challenge 1: Retrieve Product Price Information
/*Retrieve the product ID, name, and list price for each product where the list price is higher than 
the average unit price for all products that have been sold.*/

select AVG(UnitPrice)
from SalesLT.SalesOrderDetail

select ProductID, Name, ListPrice
from SalesLT.Product
where ListPrice > 382.87

select ProductID, Name, ListPrice
from SalesLT.Product
where ListPrice > 
	(select AVG(UnitPrice)
	from SalesLT.SalesOrderDetail)

/*Retrieve the product ID, name, and list price for each product where the list price is $100 or more, 
and the product has been sold for less than $100.*/

select ProductID, Name, ListPrice
from SalesLT.Product as p
where ListPrice >= 100
order by ProductID

select distinct ProductID, UnitPrice
from SalesLT.SalesOrderDetail
where UnitPrice < 100
order by ProductID

select ProductID, Name, ListPrice
from SalesLT.Product
where ListPrice >= 100 and ProductID IN
	(select ProductID
	from SalesLT.SalesOrderDetail
	where UnitPrice < 100)
order by ProductID

/*select distinct p.ProductID, Name, ListPrice, UnitPrice
from SalesLT.Product as p
inner join SalesLT.SalesOrderDetail as od
on p.ProductID = od.ProductID
where ListPrice >= 100 and UnitPrice < 100
order by p.ProductID*/

/*Retrieve the product ID, name, cost, and list price for each product along with the average unit price for
which that product has been sold.*/

select ProductID, Name, StandardCost, ListPrice
from SalesLT.Product
where ProductID IN (
	select ProductID
	from SalesLT.SalesOrderDetail 
	group by ProductID
	having AVG(UnitPrice) is not null)

/*select p.ProductID, Name, StandardCost, ListPrice, AVG(UnitPrice) as UnitPrice
from SalesLT.Product as p
join SalesLT.SalesOrderDetail as od
on p.ProductID = od.ProductID
group by p.ProductID, Name, StandardCost, ListPrice*/

/*Filter your previous query to include only products where the cost price is higher than the average
selling price.*/

select ProductID, Name, StandardCost, ListPrice
from SalesLT.Product as p
where ProductID IN (
	select ProductID
	from SalesLT.SalesOrderDetail as od
	group by ProductID
	having AVG(od.UnitPrice) < p.StandardCost)

/*select p.ProductID, Name, StandardCost, ListPrice, AVG(UnitPrice) as UnitPrice
from SalesLT.Product as p
join SalesLT.SalesOrderDetail as od
on p.ProductID = od.ProductID
group by p.ProductID, Name, StandardCost, ListPrice
having StandardCost > AVG(UnitPrice)*/

-- Challenge 2: Retrieve Customer Information
/*Retrieve the sales order ID, customer ID, first name, last name, and total due for all sales orders from
the SalesLT.SalesOrderHeader table and the dbo.ufnGetCustomerInformation function.*/

select SalesOrderID, cust.CustomerID, cust.FirstName, cust.LastName, TotalDue
from SalesLT.SalesOrderHeader
cross apply dbo.ufnGetCustomerInformation(CustomerID) as cust
order by SalesOrderID

/*Retrieve the customer ID, first name, last name, address line 1 and city for all customers from the
SalesLT.Address and SalesLT.CustomerAddress tables, and the dbo.ufnGetCustomerInformation
function.*/

select cust.CustomerID, cust.FirstName, cust.LastName, a.AddressLine1, a.City
from SalesLT.Address as a
left join SalesLT.CustomerAddress as ca
on a.AddressID = ca.AddressID
cross apply dbo.ufnGetCustomerInformation(CustomerID) as cust
order by CustomerID







