-- note there's no employee table, so we can create onw for example
create Table SalesLT.Employee
(EmployeeID int Identity primary key,
EmployeeName nvarchar(256),
ManagerID int);
go

-- get salesperson from customer table and generate manager
insert into SalesLT.Employee(EmployeeName, ManagerID)
select distinct SalesPerson, NULLIF(Cast(RIGHT(SalesPerson, 1) as INT), 0)
from SalesLT.Customer;
go

update SalesLT.Employee
set ManagerID = (select MIN(EmployeeID) 
					from SalesLT.Employee 
					where ManagerID is null)
where ManagerID is null
and EmployeeID > (select min(EmployeeID) 
					from SalesLT.Employee 
					where ManagerID is null)
go

-- here's the actual self-join demo!!!
select e.EmployeeName, e.ManagerID, m.EmployeeName as ManagerName
from SalesLT.Employee as e
left join SalesLT.Employee as m
on e.ManagerID = m.EmployeeID


