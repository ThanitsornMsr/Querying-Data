-- Temporary Table
create table #Colors
(Color varchar(15))

insert into #Colors
select distinct Color
from SalesLT.Product

select *
from #Colors

-- Table Variable have to do everything in the one batch of commands.
declare @Colors as table(Color varchar(15))

insert into @Colors
select distinct Color
from SalesLT.Product

select *
from @Colors

-- New Batch
select * 
from #Colors

select *
from @Colors -- now out of scope