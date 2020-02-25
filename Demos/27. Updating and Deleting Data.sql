-- Update a table
update SalesLT.CallLog
set Notes = 'No notes'
where Notes is null

select *
from SalesLT.CallLog

-- update multiple column
update SalesLT.CallLog
set SalesPerson = '', PhoneNumber = ''

select *
from SalesLT.CallLog

-- update from result of a query
update SalesLT.CallLog
set SalesPerson = c.SalesPerson, PhoneNumber = c.Phone
from SalesLT.Customer as c
where c.CustomerID = SalesLT.CallLog.CustomerID

select *
from SalesLT.CallLog

-- delete rows
Delete from SalesLT.CallLog
where CallTime < DATEADD(dd, -7, getdate())

select *
from SalesLT.CallLog

--Truncate the table
truncate table Saleslt.calllog

