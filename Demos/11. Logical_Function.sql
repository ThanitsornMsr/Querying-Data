-- Logical Function

-- ISNUMERIC ( expression )  
select ISNUMERIC('109.99') as Is_a_Number -- 1 mean True
select ISNUMERIC('2020-02-17') as Is_a_Number -- 0 Mean False

select Name, Size as NumericSize
from SalesLT.Product
where ISNUMERIC(Size) = 1

-- IIF ( boolean_expression, true_value, false_value ) 
select Name, IIF(ProductCategoryID in (6,7,8),'Bike','Other') as ProductType
from SalesLT.Product

select Name, IIF(ISNUMERIC(Size) = 1, 'Numeric', 'Non-Numeric') as SizeType
from SalesLT.Product

-- CHOOSE ( index, val_1, val_2 [, val_n ] )  
select prd.Name as ProductName, cat.Name as Category,
		CHOOSE(cat.ParentProductCategoryID, 'Bike', 'Components', 'Clothing', 'Accessories') as ProductType
from SalesLT.Product as prd
join SalesLT.ProductCategory as cat
on prd.ProductCategoryID = cat.ProductCategoryID
