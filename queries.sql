-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select categoryname, productname
from category as c
join product as p
on p.categoryid = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.id, o.OrderDate, s.CompanyName
from [order] as o 
join shipper as s
on o.ShipVia = s.id
where OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.productname, o.quantity
from product as p
join orderdetail as o
on o.productid = p.id
where o.orderid = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.id, c.companyname, e.lastname
from [order] as o
join customer as c
on o.customerid = c.id
join employee as e
on o.employeeid = e.id

--STRETCH #1
--Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

select c.categoryname, count(p.productid) as Count
from categories as c
join products as p
on p.categoryid = c.categoryid;