select cat.ParentProductCategoryName, cat.ProductCategoryName, count(prd.Productid) as Products
from SalesLT.vGetAllCategories as cat
left join SalesLT.Product as prd
on prd.ProductCategoryID = cat.ProductCategoryID
--group by cat.ParentProductCategoryName, cat.ProductCategoryName
--group by grouping sets(cat.ParentProductCategoryName, cat.ProductCategoryName, ())
--group by rollup(cat.ParentProductCategoryName, cat.ProductCategoryName)
group by cube (cat.ParentProductCategoryName, cat.ProductCategoryName)
order by cat.ParentProductCategoryName, cat.ProductCategoryName
