-- Challenge 1: Logging Errors
--1. Throw an error for non-existent orders

declare @SalesOrderID int = 0

delete from SalesLT.SalesOrderDetail
where SalesOrderID = @SalesOrderID

delete from SalesLT.SalesOrderHeader
where SalesOrderID = @SalesOrderID

if @@ROWCOUNT < 1
	throw 50001, 'The product was not found - no products have been update', 0;

-- 2. Handle errors

declare @SalesOrderID int = 0

begin try
	delete from SalesLT.SalesOrderDetail
	where SalesOrderID = @SalesOrderID

	delete from SalesLT.SalesOrderHeader
	where SalesOrderID = @SalesOrderID

	select SalesOrderid / @@ROWCOUNT
	from SalesLT.SalesOrderHeader
end try
begin catch
	declare @ErrorLogID as int, @ErrorMsg as varchar(250)
	execute dbo.uspLogError @ErrorLogID output
	set @ErrorMsg = 'The update failed becuase of an error, view error #'
					+ CAST(@ErrorLogID as varchar)
					+ ' in the error log for details.';
	throw 50001, @ErrorMsg, 0;
end catch

--Challenge 2: Ensuring Data Consistency
--1. Implement a transaction

declare @SalesOrderID int = 0

begin try
	begin transaction
		delete from SalesLT.SalesOrderDetail
		where SalesOrderID = @SalesOrderID

		delete from SalesLT.SalesOrderHeader
		where SalesOrderID = @SalesOrderID

		select SalesOrderid / @@ROWCOUNT
		from SalesLT.SalesOrderHeader
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

