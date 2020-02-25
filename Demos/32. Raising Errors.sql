-- view a system error
insert into SalesLT.SalesOrderDetail(SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
values
(100000, 1, 680, 1431.50, 0.00)

-- raise an error with RAISERROR
update SalesLT.Product
set DiscontinuedDate = getdate()
where ProductID = 0

If @@ROWCOUNT < 1
	raiserror('The product was not found - no products have been update', 16, 0)

-- raise an error with throw
update SalesLT.Product
set DiscontinuedDate = getdate()
where ProductID = 0

If @@ROWCOUNT < 1
	throw 50001, 'The product was not found - no products have been update', 0

