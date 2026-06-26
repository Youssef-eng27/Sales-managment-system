create database Sales_DB
use Sales_DB


--creation entities--
create table customers(
cust_id int primary key ,
cust_name nvarchar(50) not null,
city nvarchar (50) not null,
)

create table products(
productID int primary key ,
product_name nvarchar(50) not null,
price int not null)

create table Orders
(
OrderID int primary key ,
quantity int not null,
orderDATE date not null,
cust_id int ,
constraint fk_cust foreign key (cust_id) references customers(cust_id),
product_id int ,
constraint productfk foreign key (product_id) references  products(productID)
)
--update some problems--
update customers set cust_name='Salma'      where cust_id =26
update customers set cust_name='Merna'       where cust_id =27
update customers set cust_name='Sohila'     where cust_id =22
update customers set cust_name='Ibrahim'       where cust_id =24
update customers set cust_name='Muhammed'       where cust_id =30

select * from customers


--insertion--
insert into customers
values (21,'Rawan','IND'), 
(24,'Younis','IR'), 
(25,'Hazem','LIB'), 
(26,'Rawan','IR'), 
(23,'Ola','EGY'), 
(31,'Reem','IR'), 
(27,'Rawan','DE'), 
(29,'Younis','EGY'), 
(22,'Hazem','LIB'), 
(30,'Ola','PAR')
insert into customers
values (45,'body','US'),
(47,'aziz','US'),
(46,'tefa','US')
INSERT INTO products
values (1010,'Peril',419), 
(1001,'Nevia',609), 
(1006,'Starvile',436), 
(1009,'Rexona',148), 
(1008,'Familia',676), 
(1005,'Starvile',110), 
(1003,'Vatika',729), 
(1002,'Oxi',560),
(1007,'Bahi',101),
(1000,'Fa',418)
select* from products

insert into Orders
values (11,6,'2026-06-23',21,1004), 
(7,8,'2026-06-17',24,1001), 
(9,9,'2026-06-24',25,1000), 
(4,8,'2026-06-06',24,1009), 
(5,8,'2026-06-16',21,1007), 
(2,5,'2026-06-07',31,1005), 
(8,5,'2026-06-17',27,1001),
(10,2,'2026-06-28',29,1000), 
(3,3,'2026-06-30',31,1007),
(6,6,'2026-06-24',30,1000)

-- Show all orders with customer name, product name, quantity, and price--
select *
from Orders as o 
left join customers as c on c.cust_id=o.cust_id
left join products as p on o.product_id = p.productID
--Calculate total value of each order--
select OrderID,
quantity * price as total_each_sale,
orderDATE
from Orders as o 
left join products as p on o.product_id = p.productID
--Show total sales for each product--
select product_name,
sum(quantity * price) as total_each_sale
from Orders as o 
right join products as p on o.product_id = p.productID
group by product_name
--Show top 3 best-selling products--
select top (3) product_name,
sum(quantity * price) as total_each_sale
from Orders as o 
right join products as p on o.product_id = p.productID
group by product_name
order by sum(quantity * price) desc
--Show number of orders per customer--
select count(OrderID) as num_ord,
cust_name
from Orders as o 
 join customers as c on c.cust_id=o.cust_id
 group by cust_name

-- Show customers who never ordered--
 select cust_name,
 OrderID
 from customers as c left join Orders as o on c.cust_id=o.cust_id
 where o.cust_id is null
 --Show average order value--
 select avg (quantity * price) as average_order
 from Orders as o 
 left join products as p on o.product_id = p.productID
 --Show total sales per city--
 select sum(quantity * price) as total_each_sale,
 city
from Orders as o 
left join customers as c on c.cust_id=o.cust_id
left join products as p on o.product_id = p.productID
group by city