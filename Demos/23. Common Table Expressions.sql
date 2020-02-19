-- using a cte
with ProductsByCategory(ProductId, ProductName, Category)
as 
(
	select p.ProductID, p.Name, pc.Name as Category
	from SalesLT.Product as p
	join SalesLT.ProductCategory as pc
	on p.ProductCategoryID = pc.ProductCategoryID
)

select Category, count(ProductId) as Products
from ProductsByCategory
group by Category
order by Category

-- Recursive cte
select *
from SalesLT.Employee

-- Using the cte to perform recursion
with OrgReport(ManagerID, EmployeeID, EmployeeName, Level)
as
(
	-- Anchor query
	select e.ManagerID, e.EmployeeID, e.EmployeeName, 0
	from SalesLT.Employee as e
	where ManagerID is null
	union all

	--Recursice query
	select e.ManagerID, e.EmployeeID, e.EmployeeName, level+1
	from SalesLT.Employee as e
	inner join OrgReport as o
	on e.ManagerID = o.EmployeeID
)

select * 
from OrgReport
option( maxrecursion 3)