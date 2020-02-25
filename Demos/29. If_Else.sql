--simple logical test
If 'Yes' = 'Yes'
Print 'True'

--change cade based on a condition
update SalesLT.Product
set DiscontinuedDate = GETDATE()
where ProductID = 680

If @@ROWCOUNT < 1
Begin 
	print 'Product was not found'
end
else
begin
	print 'Product Update'
end