select ProdCatID, Category, COUNT(ProductID) as Products
from 
	(select p.ProductID, p.Name as Product, pc.Name as Category, p.ProductCategoryID as ProdCatID
	from SalesLT.Product as p
	join SalesLT.ProductCategory as pc
	on p.ProductCategoryID = pc.ProductCategoryID) as ProdCats
group by ProdCatID, Category
order by ProdCatID,Category