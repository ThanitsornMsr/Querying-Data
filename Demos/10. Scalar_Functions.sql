-- Scarlar Functions 
select Year(SellStartDate) as SellStartYear, ProductID, Name
from SalesLT.Product
order by SellStartDate

select YEAR(SellStartDate) as SellStartYear,
		DATENAME(mm,SellStartDate) as SellStartMonth,
		Day(SellStartDate) as SellStartDay,
		DATENAME(dw, SellStartDate) as SellStartWeekday,
		ProductID, Name
from SalesLT.Product
order by SellStartYear

select DATEDIFF(yy,SellStartDate,GETDATE()) as YearSold,
		ProductID, Name
from SalesLT.Product
order by ProductID

select upper(Name) as ProductName
from SalesLT.Product

select CONCAT(FirstName+' ',LastName) as FullName
from SalesLT.Customer

Select Name, ProductNumber, LEFT(ProductNumber, 2) as ProductType
From SalesLT.Product

Select Name, ProductNumber,
		LEFT(ProductNumber, 2) as ProductType,
		SUBSTRING(ProductNumber, CHARINDEX('-', ProductNumber) + 1, 4) as ModelCode,
		SUBSTRING(ProductNumber, Len(ProductNumber) - CHARINDEX('-',Reverse(right(ProductNumber,3))) + 2, 2) as SizeCode
from SalesLT.Product

select Name, ProductNumber, right(ProductNumber,3), 
		Reverse(right(ProductNumber,3)), 
		CHARINDEX('-',Reverse(right(ProductNumber,3))) as DashIndex, -- dash number 
		Len(ProductNumber) - CHARINDEX('-',Reverse(right(ProductNumber,3))) + 2 as StartNumber
from SalesLT.Product



