-- display a list of product colors
select ISNULL(Color, 'None') as Color
from SalesLT.Product

-- distinct display a list of product colors with the word 'none' 
select distinct ISNULL(Color, 'None') as Color
from SalesLT.Product

-- distinct display a list of product colors with the word 'none' if value is null sorted by color
select distinct ISNULL(Color, 'None') as Color
from SalesLT.Product
order by Color

-- distinct display a list of product colors with the word 'none' if value is null  and a '-' if the size is null sorted by color
select distinct ISNULL(Color, 'None') as Color, /* ISNULL(Size, '-') as */ Size
from SalesLT.Product
order by Color

-- Display the top 100 product by list price
select top(100) Name, ListPrice
from SalesLT.Product
order by ListPrice desc

-- Display the first ten products by product number
select Name, ListPrice
from SalesLT.Product
order by ProductNumber
offset 0 rows
fetch next 10 rows only

-- Display the next ten products by product number
select Name, ListPrice
from SalesLT.Product
order by ProductNumber
offset 10 rows
fetch first 10 rows only