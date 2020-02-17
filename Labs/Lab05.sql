-- Challenge 1: Retrieve Product Information

/*Write a query to return the product ID of each product, together with the product name formatted as
upper case and a column named ApproxWeight with the weight of each product rounded to the nearest
whole unit.*/
select ProductID, UPPER(Name), Weight, ROUND(Weight,0) as ApproxWeight
from SalesLT.Product

/*Extend your query to include columns named SellStartYear and SellStartMonth containing the year and
month in which Adventure Works started selling each product. The month should be displayed as the
month name (for example, ‘January’).*/
select YEAR(SellStartDate) as SellStartYear, DateName(m,SellStartDate) as SellStartMonth
from  SalesLT.Product

/*Extend your query to include a column named ProductType that contains the leftmost two characters
from the product number.*/
select Name, left(ProductNumber,2) as ProductType
from SalesLT.Product

/*Extend your query to filter the product returned so that only products with a numeric size are included.*/
select Name, ProductNumber, 
	SUBSTRING(ProductNumber, LEN(ProductNumber) - CHARINDEX('-', REVERSE(RIGHT(ProductNumber, 3))) + 2, 3) as Size
from SalesLT.Product
where ISNUMERIC(Size) = 1

-- Challenge 2: Rank Customers by Revenue

/*Write a query that returns a list of company names with a ranking of their place in a list of highest
TotalDue values from the SalesOrderHeader table.*/
select c.CompanyName, oh.TotalDue,
	RANK() OVER(order by oh.TotalDue desc) as RankTotalDue
from SalesLT.Customer as c
left Join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID

-- Challenge 3: Aggregate Product Sales
/*Write a query to retrieve a list of the product names and the total revenue calculated as the sum of the
LineTotal from the SalesLT.SalesOrderDetail table, with the results sorted in descending order of total
revenue.*/
select p.Name, SUM(od.LineTotal) as LineTotal
from SalesLT.Product as p
left join SalesLT.SalesOrderDetail as od
on p.ProductID = od.ProductID
group by p.Name
order by LineTotal desc

/*Modify the previous query to include sales totals for products that have a list price of more than $1000.*/
select p.Name, SUM(od.LineTotal) as LineTotal
from SalesLT.Product as p
left join SalesLT.SalesOrderDetail as od
on p.ProductID = od.ProductID
where ListPrice > 1000
group by p.Name
order by LineTotal desc

/*Modify the previous query to only include only product groups with a total sales value greater than
$20,000.*/
select p.Name, SUM(od.LineTotal) as LineTotal
from SalesLT.Product as p
left join SalesLT.SalesOrderDetail as od
on p.ProductID = od.ProductID
where ListPrice > 1000
group by p.Name
having SUM(od.LineTotal) > 20000
order by LineTotal desc



