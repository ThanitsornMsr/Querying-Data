create table SalesLT.DemoTable
(
	CalRow int identity Primary Key,
	Description nvarchar(max) null
)

select * from SalesLT.DemoTable

declare @counter int = 1

while @counter <= 5

begin
	insert SalesLT.DemoTable(Description)
	values ('Row'+convert(varchar(5), @counter))
	set @counter = @counter + 1
end

select Description from SalesLT.DemoTable

truncate table SalesLT.DemoTable