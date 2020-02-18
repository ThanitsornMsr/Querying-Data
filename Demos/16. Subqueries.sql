/*	Subqueries are Transact-SQL queries nested within an outer query.
	Scalar subqueries return a single value.
	Multi-valued subqueries return a single-column rowset.*/

select MAX(UnitPrice)
from SalesLT.SalesOrderDetail
-- 1466.01

select *
from SalesLT.Product
where ListPrice > 1466.01

select *
from SalesLT.Product
where ListPrice >
	(select MAX(UnitPrice)
	from SalesLT.SalesOrderDetail)