-- pivot
select *
from ( 
	select p.ProductID, pc.Name, ISNULL(p.Color, 'Uncolored') as Color
	from SalesLT.ProductCategory as pc
	join SalesLT.Product as p
	on pc.ProductCategoryID = p.ProductCategoryID
	) as ppc
pivot (count(ProductID) for Color in ([Red],[Blue],[Black],[Silver],[Yellow],[Grey],[Multi],[Uncolored])) as pvt
order by Name;

-- unpivoting
create table #ProductColorPivots
(Name varchar(50),
Red int,
Blue int,
Black int,
Silver int,
Yellow int,
Grey int,
Multi int,
Uncolored int)

insert into #ProductColorPivots
select *
from ( 
	select p.ProductID, pc.Name, ISNULL(p.Color, 'Uncolored') as Color
	from SalesLT.ProductCategory as pc
	join SalesLT.Product as p
	on pc.ProductCategoryID = p.ProductCategoryID
	) as ppc
pivot (count(ProductID) for Color in ([Red],[Blue],[Black],[Silver],[Yellow],[Grey],[Multi],[Uncolored])) as pvt
order by Name;

select Name, Color, ProductCount
from ( 
	select Name,
	[Red],[Blue],[Black],[Silver],[Yellow],[Grey],[Multi],[Uncolored]
	from #ProductColorPivots
	) as pcp
unpivot (ProductCount for Color in ([Red],[Blue],[Black],[Silver],[Yellow],[Grey],[Multi],[Uncolored])) as ProductCount

-- Unpivot
CREATE TABLE #SalesByQuarter
(ProductID int,
 Q1 money,
 Q2 money,
 Q3 money,
 Q4 money);

INSERT INTO #SalesByQuarter
VALUES
(1, 19999.00, 21567.00, 23340.00, 25876.00),
(2, 10997.00, 12465.00, 13367.00, 14365.00),
(3, 21900.00, 21999.00, 23376.00, 23676.00);

SELECT * FROM #SalesByQuarter;

SELECT ProductID, Period, Revenue
FROM
(SELECT ProductID,
Q1, Q2, Q3, Q4
FROM #SalesByQuarter) sbq
UNPIVOT
(Revenue FOR Period IN (Q1, Q2, Q3, Q4)
) AS RevenueReport


