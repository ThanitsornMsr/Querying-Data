--catch the error
begin try
	update SalesLT.Product
	set ProductNumber = ProductID / ISNULL(Weight, 0)
end try
begin catch
	print 'The following error occurred'
	print Error_message()
end catch

--catch and throw
begin try
	update SalesLT.Product
	set ProductNumber = ProductID / ISNULL(Weight, 0)
end try
begin catch
	print 'The following error occurred'
	print Error_message();
	throw;
end catch

--catch, log and whrow a custom erre
begin try 
	update SalesLT.Product
	set ProductNumber = ProductID / ISNULL(Weight, 0)
end try
begin catch
	declare @ErrorLogID as int, @ErrorMsg as varchar(250)
	execute dbo.uspLogError @ErrorLogID output
	set @ErrorMsg = 'The update failed becuase of an error, view error #'
					+ CAST(@ErrorLogID as varchar)
					+ ' in the error log for details.';
	throw 50001, @ErrorMsg, 0;
end catch

--view the error log
select *
from dbo.ErrorLog



