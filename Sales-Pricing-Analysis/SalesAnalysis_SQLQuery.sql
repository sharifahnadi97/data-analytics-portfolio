-- Creating new table

create or alter view SalesData as

with all_orders as
(
select OrderID, CustomerID, ProductID, OrderDate, Quantity, Revenue, COGS
from Orders_2023

union all

select OrderID, CustomerID, ProductID, OrderDate, Quantity, Revenue, COGS
from Orders_2024

union all

select OrderID, CustomerID, ProductID, OrderDate, Quantity, Revenue, COGS
from Orders_2025
)

select a.OrderID, a.CustomerID, a.ProductID, a.OrderDate, a.Quantity, a.Revenue, 
    case when a.Revenue is null then p.Price*a.Quantity else a.Revenue end as CleanedRevenue,
    case when a.Revenue is null then p.Price*a.Quantity else a.Revenue end - a.COGS as Profit,
    a.COGS, c.Region, c.CustomerJoinDate, p.ProductName, p.ProductCategory, p.Price, p.Base_Cost
from all_orders a
left join customers c
on a.CustomerID = c.CustomerID
left join products p
on a.ProductID = p.ProductID
where a.CustomerID is not null;