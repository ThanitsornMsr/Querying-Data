-- Challenge 1: Retrieve Data for Transportation Reports

/*Initially, you need to produce a list of all of you customers' locations. Write a Transact-SQL query that
queries the Address table and retrieves all values for City and StateProvince, removing duplicates*/
Select distinct City, StateProvince
from SalesLT.Address
order by StateProvince

/*Transportation costs are increasing and you need to identify the heaviest products. Retrieve the names
of the top ten percent of products by weight*/
select top 10 percent Name, Weight
from SalesLT.Product
order by Weight desc

/*The heaviest ten products are transported by a specialist carrier, therefore you need to modify the
previous query to list the heaviest 100 products not including the heaviest ten.*/
select Name, Weight
from SalesLT.Product
order by Weight desc
offset 10 rows
fetch first 100 rows only

--Challenge 2: Retrieve Product Data
/*Initially, you need to find the names, colors, and sizes of the products with a product model ID 1.*/
select Name, Color, Size
from SalesLT.Product
where ProductModelID = 1

/*Retrieve the product number and name of the products that have a color of 'black', 'red', or 'white' and
a size of 'S' or 'M'.*/
select ProductNumber, Name, Color, Size
from SalesLT.Product
where Color in ('Black', 'Red', 'White') and Size in ('S', 'M')

/*Retrieve the product number, name, and list price of products whose product number begins 'BK-'.*/
select ProductNumber, Name, ListPrice
from SalesLT.Product
where ProductNumber LIKE 'BK-%'

/*Modify your previous query to retrieve the product number, name, and list price of products whose
product number begins 'BK-' followed by any character other than 'R’, and ends with a '-' followed by
any two numerals.*/
select ProductNumber, Name, ListPrice
from SalesLT.Product
where ProductNumber LIKE 'BK-[a-qs-z]__[a-qs-z]-[0-9][0-9]'

