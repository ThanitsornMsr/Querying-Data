--no transaction
begin try
	insert into SalesLT.SalesOrderHeader(DueDate, CustomerID, ShipMethod)
	values
	(DATEADD(dd, 7, GETDATE()), 1, 'STD DELIVERY')

	declare @SalesOrderID int = Scope_Identity();

	insert into SalesLT.SalesOrderDetail(SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
	values
	(@SalesOrderID, 1, 99999, 1431.50, 0.00)
end try
begin catch
	print Error_message();
end catch

--view orphaned order
select h.SalesOrderID, h.DueDate, h.CustomerID, h.ShipMethod, d.SalesOrderDetailID
from SalesLT.SalesOrderHeader as h
left join SalesLT.SalesOrderDetail as d
on d.SalesOrderID = h.SalesOrderID
where d.SalesOrderDetailID is null;

--manually delete orphaned record
delete from SalesLT.SalesOrderHeader
where SalesOrderID = SCOPE_IDENTITY();

--use a transaction 
begin try
	begin transaction
		insert into SalesLT.SalesOrderHeader(DueDate, CustomerID, ShipMethod)
		values
		(DATEADD(dd, 7, GETDATE()), 1, 'STD DELIVERY')

		declare @SalesOrderID int = Scope_identity()

		insert into SalesLT.SalesOrderDetail(SalesOrderID, OrderQty, ProductID, UnitPrice,UnitPriceDiscount)
		values
		(@SalesOrderID, 1, 99999, 1431.50, 0.00)
	commit transaction
end try
begin catch
	if @@TRANCOUNT > 0
	begin
		print XACT_STATE();
		rollback transaction
		end
	print error_message();
	throw 50001, 'An insert failed. The transaction was cancelled.', 0;
end catch;

--view orphaned order
select h.SalesOrderID, h.DueDate, h.CustomerID, h.ShipMethod, d.SalesOrderDetailID
from SalesLT.SalesOrderHeader as h
left join SalesLT.SalesOrderDetail as d
on d.SalesOrderID = h.SalesOrderID
where d.SalesOrderDetailID is null;

--use xact_abort
set xact_abort on;
begin try
	begin transaction
		insert into SalesLT.SalesOrderHeader(DueDate, CustomerID, ShipMethod)
		values
		(DATEADD(dd, 7, GETDATE()), 1, 'STD DELIVERY')

		declare @SalesOrderID int = Scope_identity()

		insert into SalesLT.SalesOrderDetail(SalesOrderID, OrderQty, ProductID, UnitPrice,UnitPriceDiscount)
		values
		(@SalesOrderID, 1, 99999, 1431.50, 0.00)
	commit transaction
end try
begin catch
	print error_message();
	throw 50001, 'An insert failed. The transaction was cancelled.', 0;
end catch;
set xact_abort off;

--view orphaned order
select h.SalesOrderID, h.DueDate, h.CustomerID, h.ShipMethod, d.SalesOrderDetailID
from SalesLT.SalesOrderHeader as h
left join SalesLT.SalesOrderDetail as d
on d.SalesOrderID = h.SalesOrderID
where d.SalesOrderDetailID is null;
