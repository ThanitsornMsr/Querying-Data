-- Challenge 1: Retrieve Product Information
/*Retrieve the product ID, product name, product model name, and product model summary for each
product from the SalesLT.Product table and the SalesLT.vProductModelCatalogDescription view.*/

select p.ProductID,p.Name as ProductName, vp.Name, Summary
from SalesLT.vProductModelCatalogDescription as vp
join SalesLT.Product as p
on vp.ProductModelID = p.ProductModelID

/*Create a table variable and populate it with a list of distinct colors from the SalesLT.Product table. Then
use the table variable to filter a query that returns the product ID, name, and color from the
SalesLT.Product table so that only products with a color listed in the table variable are returned.*/

declare @Color table 
(Color varchar(15))

insert into @Color
select distinct Color
from SalesLT.Product

select p.ProductID, P.Name, ac.Color
from @Color as ac
join SalesLT.Product as p
on ac.Color = p.Color

/*The AdventureWorksLT database includes a table-valued function named dbo.ufnGetAllCategories,
which returns a table of product categories (for example ‘Road Bikes’) and parent categories (for
example ‘Bikes’). Write a query that uses this function to return a list of all products including their
parent category and category.*/

select Name, ac.ParentProductCategoryName as ParentCategory, ac.ProductCategoryName as Category
from dbo.ufnGetAllCategories() as ac
join SalesLT.Product as p
on ac.ProductCategoryID = p.ProductCategoryID

-- Challenge 2: Retrieve Customer Sales Revenue
/*Retrieve a list of customers in the format Company (Contact Name) together with the total revenue for
that customer. Use a derived table or a common table expression to retrieve the details for each sales
order, and then query the derived table or CTE to aggregate and group the data.*/

/*select CompanyName, Concat(FirstName+' ', LastName) as CustomerContactName, sum(OrderQty * UnitPrice) as TotalRevenue
from SalesLT.Customer as c
join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID
join SalesLT.SalesOrderDetail as od
on oh.SalesOrderID = od.SalesOrderID*/

with CustSalesRevenue(CompanyName, CustomerContactName, OrderQty, UnitPrice)
as
(
	select CompanyName, Concat(FirstName+' ', LastName) as CustomerContactName, OrderQty, UnitPrice
	from SalesLT.Customer as c
	join SalesLT.SalesOrderHeader as oh
	on c.CustomerID = oh.CustomerID
	join SalesLT.SalesOrderDetail as od
	on oh.SalesOrderID = od.SalesOrderID
)

select CompanyName, CustomerContactName, SUM(OrderQty * UnitPrice) as TotalRevenue
from CustSalesRevenue
group by CompanyName, CustomerContactName







