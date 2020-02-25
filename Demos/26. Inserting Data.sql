-- create a table for the demo
create table SalesLT.CallLog
(
	CallID int Identity Primary Key Not Null,
	CallTime datetime not null Default getdate(),
	SalesPerson nvarchar(256) not null,
	CustomerID int not null References SalesLT.Customer(CustomerID),
	PhoneNumber nvarchar(25) not null,
	Notes nvarchar(max) null
);
go

-- insert row
insert into SalesLT.CallLog
Values
('2015-01-01T12:30:00', 'adventure-works\pamela0', 1, '245-555-0173', 'Returning call re: enquiry about delivery');

select * from SalesLT.CallLog

-- insert defaults and nulls
insert into SalesLT.CallLog
values
(Default, 'adventure-works\david8', 2, '170-555-0217', null);

select * from SalesLT.CallLog

--insert a row with explicit column
insert into SalesLT.CallLog(SalesPerson, CustomerID, PhoneNumber)
values
('adventure-works\jillian0', 3, '279-555-0130')

select * from SalesLT.CallLog

--insert multiple rows
insert into SalesLT.CallLog	
values
(dateadd(mi, -2, GETDATE()),'adventure-works\jillian0', 4, '710-555-0173', null),
(default,'adventure-works\shu0', 5, '888-555-0186', 'Called to arrange deliver of order 10987')

select * from SalesLT.CallLog

-- insert the result of a query
insert into SalesLT.CallLog(SalesPerson, CustomerID, PhoneNumber, Notes)
select SalesPerson, CustomerID, Phone, 'Sales Promotion Call'
from SalesLT.Customer
where CompanyName = 'Big-Time Bike Store'

select * from SalesLT.CallLog

--retrieving inserted identity
insert into SalesLT.CallLog(SalesPerson, CustomerID, PhoneNumber)
values
('adventure-works\josé1', 10, '150-555-0127');

select SCOPE_IDENTITY();

select * from SalesLT.CallLog

--overriding identity
set identity_insert SalesLT.CallLog ON

insert into SalesLT.CallLog(CallID, SalesPerson, CustomerID, PhoneNumber)
values 
(10, 'adventure-works\josé1', 11, '926-555-0159');

set identity_insert SalesLT.CallLog OFF

select * from SalesLT.CallLog

select SCOPE_IDENTITY();

insert into SalesLT.CallLog(SalesPerson, CustomerID, PhoneNumber, Notes)
select SalesPerson, CustomerID, Phone, 'Sales Promotion Call'
from SalesLT.Customer
where CompanyName = 'Aerobic Exercise Company'

select * from SalesLT.CallLog






