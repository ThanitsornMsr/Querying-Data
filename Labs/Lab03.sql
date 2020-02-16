-- Challenge 1: Generate Invoice Reports
/*As an initial step towards generating the invoice report, write a query that returns the company name
from the SalesLT.Customer table, and the sales order ID and total due from the
SalesLT.SalesOrderHeader table*/

select c.CompanyName, oh.SalesOrderID, oh.TotalDue
from SalesLT.Customer as c
join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID

/*Extend your customer orders query to include the Main Office address for each customer, including the
full street address, city, state or province, postal code, and country or region*/

select a.AddressLine1+ISNULL(a.Addressline2,'') as FullStreetAddress, a.City, a.StateProvince, a.CountryRegion, a.PostalCode
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as a
on ca.AddressID = a.AddressID
where ca.AddressType = 'Main Office'

--Challenge 2: Retrieve Sales Data
/*The sales manager wants a list of all customer companies and their contacts (first name and last name),
showing the sales order ID and total due for each order they have placed. Customers who have not
placed any orders should be included at the bottom of the list with NULL values for the order ID and
total due.*/
select c.FirstName, c.LastName, oh.SalesOrderID, oh.TotalDue
from SalesLT.Customer as c
left join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID
order by oh.TotalDue desc

/*A sales employee has noticed that Adventure Works does not have address information for all
customers. You must write a query that returns a list of customer IDs, company names, contact names
(first name and last name), and phone numbers for customers with no address stored in the database.*/
select c.CustomerID, c.CompanyName, c.FirstName+''+c.LastName as ContactName, c.Phone
from SalesLT.Customer as c
left join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
left join SalesLT.Address as a
on ca.AddressID = a.AddressID
where a.AddressID is null

/*Some customers have never placed orders, and some products have never been ordered. Create a query
that returns a column of customer IDs for customers who have never placed an order, and a column of
product IDs for products that have never been ordered. Each row with a customer ID should have a
NULL product ID (because the customer has never ordered a product) and each row with a product ID
should have a NULL customer ID (because the product has never been ordered by a customer)*/
select c.CustomerID, p.ProductID
from SalesLT.Customer as c
left join SalesLT.SalesOrderHeader as oh
on c.CustomerID = oh.CustomerID
left join SalesLT.SalesOrderDetail as od
on oh.SalesOrderID = od.SalesOrderID
full join SalesLT.Product as p
on od.ProductID = p.ProductID
order by c.CustomerID
