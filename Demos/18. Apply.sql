-- Display the sales order details for items that are equal to the maximum unit price for that sales order

CREATE FUNCTION SalesLT.udfMaxUnitPrice (@SalesOrderID INTEGER)  
RETURNS TABLE   
AS
RETURN
SELECT SalesOrderID, Max(UnitPrice) as MaxUnitPrice
FROM SalesLT.SalesOrderDetail
WHERE SalesOrderID = @SalesOrderID
GROUP BY SalesOrderID

select soh.SalesOrderID, mup.MaxUnitPrice
from SalesLT.SalesOrderHeader as soh
cross apply SalesLT.udfMaxUnitPrice(soh.SalesOrderID) as mup
order by soh.SalesOrderID
