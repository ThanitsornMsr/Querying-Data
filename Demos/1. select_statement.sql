/* select * from SalesLT.Product; */
/*select ProductID, Name, ListPrice, StandardCost as cost, ListPrice - StandardCost as Margin, Color /*as or not as can run */
from SalesLT.Product */

select ProductID, Name, Color, Size, Color + Size as Style
from SalesLT.Product
