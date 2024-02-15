use GourmetShop


--Write a query that returns the total sales of a single product 'name' 
--showing the product name and total sales aliased to Total Sales

--1

Select Sum(Quantity * oi.UnitPrice)[Total Sales], ProductName[name] from OrderItem oi
left join Product p on p.Id = oi.ProductId
Group by ProductName
Order by ProductName asc


--Write a query to determine the top 25 suppliers by total units of all 
--their products sold. Show supplier name and unit total aliased to Total Units Sold.

--2
Select Top 25 CompanyName, ProductName, Quantity from Supplier s
inner join Product p on s.Id = p.Id
inner join OrderItem oi on oi.Id = p.Id
Order by [Quantity] desc



--Write a query to determine the top 10 suppliers by sales and show each’s 
--suppliers sales total. Show supplier, sales total aliased to Total Sales, 

--3
Select Top 10 Sum(Quantity *oi.UnitPrice) as [Total Sales], CompanyName from Supplier s
inner join Product p on s.Id = p.Id
inner join OrderItem oi on oi.Id = p.Id
Group by CompanyName
Order by [Total Sales] desc

--4
--List all Products that have been sold to customers not living in France. 
--List product name only

Select ProductName from Product p
inner join OrderItem oi on p.Id = oi.Id
inner join [Order] o on oi.Id = o.Id
inner join Customer C on o.Id = c.Id
Where not Country = 'France'

--List the total sales by customer for all customers who live in France or Germany. 
--Show customers first and last name, their total sales formatted as currency and 
--the associated country they live in.

Select Format(SUM(Quantity * oi.UnitPrice), 'c2') as [Total Sales], ProductName, FirstName, LastName  from Product p
inner join OrderItem oi on p.Id = oi.Id
inner join [Order] o on oi.Id = o.Id
inner join Customer C on o.Id = c.Id
Where Country = 'Germany' or Country = 'France'
Group by ProductName, LastName, FirstName


