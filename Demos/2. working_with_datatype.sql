-- cast
select cast(ProductID as varchar(3)) + ':' + Name as ProductName
from SalesLT.Product

-- convert
select convert(varchar(5), ProductID) + ';' + name as ProductName
from SalesLT.Product

-- convert date
select SellStartDate,
		CONVERT(nvarchar(30), SellStartDate) as ConvertedDate,
		CONVERT(nvarchar(30), SellStartDate, 126) as ISO8601FormatDate
from SalesLT.Product
-- convert -> mon dd yyyy hh:miAM/PM, yyyy-mm-ddThh:mi:ss.mmm

--Try to cast

select Name, Size as NumericSize
from SalesLT.Product

-- Fail Conversion failed when converting the nvarchar value 'M' to data type int.

select Name, CAST(Size as int) as NumericSize
from SalesLT.Product

select Name, Try_CAST(Size as int) as NumericSize
from SalesLT.Product
