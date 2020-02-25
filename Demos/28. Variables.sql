-- Search by city using a variable

declare @City Varchar(20) = 'Toronto'
set @City = 'Bellevue'

select FirstName + ' ' + LastName as [Name], AddressLine1 as Address, City
from SalesLT.Customer as c
join SalesLT.CustomerAddress as ca
on c.CustomerID = ca.CustomerID
join SalesLT.Address as a
on ca.AddressID = a.AddressID
where City = @City

GO

-- use a variable as an output
declare @result money
select @result = MAX(TotalDue)
from SalesLT.SalesOrderHeader

print @result