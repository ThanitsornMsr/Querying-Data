-- create a stored procedure
create procedure SalesLT.GetProductsByCategory (@CategoryID INT = null)
as
if @CategoryID is null
	select ProductID, Name, Color, Size, ListPrice
	from SalesLT.Product
Else
	select ProductID, Name, Color, Size, ListPrice
	from SalesLT.Product
	where ProductCategoryID = @CategoryID

-- execute the procedure without a parameter
execute SalesLT.GetProductsByCategory

-- execute the procedure with a parameter
exec SalesLT.GetProductsByCategory 6


