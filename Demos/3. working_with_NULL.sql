-- null number == 0

select Name, Size, ISNULL(Size,0) as NumericSize
from SalesLT.Product

select Name, Size, Try_CAST(Size as int) as NumericSize,ISNULL(Try_CAST(Size as int),0) as NumericSize
from SalesLT.Product

-- NULL string = blank string
select ProductID, Name, Color, Size, Color + Size as Style
from SalesLT.Product

select ProductID, Name, Color, Size, isnull(Color, '') +',' + ISNULL(Size,'') as ProductDetails
from SalesLT.Product

-- multi color = null
select ProductID, Name, Color, nullif(Color, 'Multi')
from SalesLT.Product

-- find first non-null date
select Name, DiscontinuedDate, SellEndDate, SellStartDate,Coalesce(DiscontinuedDate, SellEndDate, SellStartDate) as LastActivity
from SalesLT.Product

-- Searched case
select Name, SellEndDate, 
		case
			when SellEndDate IS NULL then 'on sale'
			else 'Discontinued'
		end as SalesStatus
from SalesLT.Product

-- Simple case
select Name, Size, 
		case Size
			when 'S' Then 'Small'
			when 'M' Then 'Medium'
			when 'L' Then 'Large'
			when 'XL' Then 'Extra-Large'
			else ISNULL(Size, 'n/a')
		end as ProductSize
from SalesLT.Product