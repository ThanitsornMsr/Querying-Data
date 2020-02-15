--Challenge 1
/* Familiarize yourself with the Customer table by writing a Transact-SQL query that retrieves all columns
for all customers */
select *
from SalesLT.Customer

/* Create a list of all customer contact names that includes the title, first name, middle name (if any), last
name, and suffix (if any) of all customers*/

select Title, FirstName, MiddleName, LastName, Suffix
from SalesLT.Customer

-- Each customer has an assigned salesperson. You must write a query to create a call sheet that lists
select SalesPerson, isnull(Title,'')+FirstName as CustomerName, Phone
from SalesLT.Customer
-- have null !! 
select SalesPerson, Title+FirstName as CustomerName, Phone
from SalesLT.Customer


--Challenge 2
/*You have been asked to provide a list of all customer companies in the format <Customer ID> :
<Company Name> */
select convert(nvarchar,CustomerID) +': '+CompanyName as CustomerCompany
from SalesLT.Customer

/*The SalesLT.SalesOrderHeader table contains records of sales orders. You have been asked to retrieve
data for a report that shows*/
select SalesOrderNumber+' '+ '('+cast(RevisionNumber as nvarchar)+')', CONVERT(nvarchar(128), OrderDate, 102) as ANSI
from SalesLT.SalesOrderHeader

--Challenge 3
/*You have been asked to write a query that returns a list of customer names. The list must consist of a
single field in the format <first name> <last name> (for example Keith Harris) if the middle name is
unknown, or <first name> <middle name> <last name> (for example Jane M. Gates) if a middle name is
stored in the database*/
select FirstName+ ' ' + ISNULL(MiddleName,'') + ' ' + LastName as FullName
from SalesLT.Customer

/*Customers may provide adventure Works with an email address, a phone number, or both. If an email
address is available, then it should be used as the primary contact method; if not, then the phone
number should be used. You must write a query that returns a list of customer IDs in one column, and a
second column named PrimaryContact that contains the email address if known, and otherwise the
phone number.*/

UPDATE SalesLT.Customer
SET EmailAddress = NULL
WHERE CustomerID % 7 = 1;

select CustomerID, Coalesce(EmailAddress, Phone) as PrimaryContact
from SalesLT.Customer

/*You have been asked to create a query that returns a list of sales order IDs and order dates with a
column named ShippingStatus that contains the text “Shipped” for orders with a known ship date, and
“Awaiting Shipment” for orders with no ship date*/
Select *
from SalesLT.SalesOrderHeader

UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;

select SalesOrderID, 
		case ShipDate
			when convert(nvarchar(128),ShipDate) then 'Shipped'
			else ISNULL(convert(nvarchar(128),ShipDate),'Awaiting Shipment')
		end as ShippingStatus
from SalesLT.SalesOrderHeader