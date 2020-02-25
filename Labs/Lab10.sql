--Challenge 1: Creating scripts to insert sales orders
--1. Write code to insert an order header
declare @SalesOrderID int = Scope_identity()
insert into SalesLT.SalesOrderHeader(OrderDate, DueDate, CustomerID, ShipMethod)
values (
	GETDATE(),
	DATEADD(dd, 7, getdate()),
	1,
	'CARGO TRANSPORT 5'
)

--2. Write code to insert an order detail

declare @SalesOrderID int = Scope_identity()
insert into SalesLT.SalesOrderDetail(SalesOrderID, ProductID, OrderQty, UnitPrice)
values
	(@SalesOrderID, 760, 1, 782.99)

--Challenge 2: Updating Bike Prices
--1. Write a WHILE loop to update bike prices
declare @MarketAvg money = 2000
declare @MarketMax money = 5000
declare @AWMax money
declare @AWAvg money

select @AWAvg =  AVG(ListPrice), @AWMax = MAX(ListPrice)
from SalesLT.Product
where ProductCategoryID IN
	(select distinct ProductCategoryID
	 from SalesLT.vGetAllCategories
	 where ParentProductCategoryName = 'Bikes');

while @AWAvg < @MarketAvg
begin
   update SalesLT.Product
   set ListPrice = ListPrice * 1.1
   where ProductCategoryID IN
	(select distinct ProductCategoryID
	 from SalesLT.vGetAllCategories
	 where ParentProductCategoryName = 'Bikes');
	  
	select @AWAvg =  AVG(ListPrice), @AWMax = MAX(ListPrice)
	from SalesLT.Product
	where ProductCategoryID IN
	(select distinct ProductCategoryID
	 from SalesLT.vGetAllCategories
	 where ParentProductCategoryName = 'Bikes');

   if @AWMax >= @MarketMax
      break
   else
      continue
end
PRINT 'New average bike price:' + CONVERT(varchar, @AWAvg);
PRINT 'New maximum bike price:' + CONVERT(varchar, @AWMax);






