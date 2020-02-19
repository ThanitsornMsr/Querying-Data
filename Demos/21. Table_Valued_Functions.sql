create function SalesLT.udfCustomersByCity
(@city as varchar(20))
returns table
as
return
	(select c.CustomerID, FirstName, LastName, AddressLine1, City, StateProvince
	from SalesLT.Customer as c
	join SalesLT.CustomerAddress as ca
	on c.CustomerID = ca.CustomerID
	join SalesLT.Address as a
	on ca.AddressID = a.AddressID
	where City = @city)

select *
from SalesLT.udfCustomersByCity('Bellevue')