-- Challenge 1: Inserting 

--1. Insert a product

insert into SalesLT.Product
values
('LED Light', 'LT-L123', Null, 2.56, 12.99, null, null, 37, null, GETDATE(), null, null, null, null, NEWID(), getdate())

select *
from SalesLT.Product

--2. Insert a new category with two products

insert into SalesLT.ProductCategory
values
(4, 'Bells and Horns', NEWID(), GETDATE())

select *
from SalesLT.ProductCategory

insert into SalesLT.Product
values
('Bicycle Bell', 'BB-RING', null, 2.47, 4.99, null, null, 42, null, GETDATE(), null, null, null, null, NEWID(), GETDATE()),
('Bicycle Horn', 'BB-PARP', null, 1.29, 3.75, null, null, 42, null, GETDATE(), null, null, null, null, NEWID(), GETDATE())

select *
from SalesLT.Product

--Challenge 2: Updating Products
--1. Update product prices

update SalesLT.Product
set ListPrice = ROUND(ListPrice*1.1,2)
where ProductCategoryID = 42

select * 
from SalesLT.Product

--2. Discontinue products

select *
from SalesLT.Product
where ProductCategoryID = 37

update SalesLT.Product
set SellEndDate = iif(SellEndDate is not null, GETDATE(), NULL)
where ProductCategoryID = 37

-- Challenge 3: Deleting Products
-- 1. Delete a product category and its products

delete from SalesLT.Product
where ProductCategoryID = 42

delete from SalesLT.ProductCategory
where ProductCategoryID = 42

select * from SalesLT.Product
select * from SalesLT.ProductCategory







