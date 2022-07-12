#question 1

SELECT * FROM Shippers 

#question 2

SELECT categoryname, description
FROM Categories

#question 3

SELECT firstname, lastname, hiredate
FROM employees
WHERE title = ‘Sale Representative’

#question 4

SELECT firstname, lastname, hiredate
FROM employees
WHERE title = ‘Sale Representatives’ AND address = ‘USA’

#question 5

SELECT orderid, orderdate 
FROM orders
WHERE employeeid = 5

#question 6

SELECT supplierid, contactname, contacttitle, 
FROM suppliers
WHERE contacttitle <> ‘Marketing Manager’

#question 7

SELECT productid, productname 
FROM products 
WHERE productname LIKE ‘%queso%’

#question 8

SELECT orderid, customerid, shipcountry
FROM orders
WHERE shipcountry = ‘France’ OR shipcountry = ‘Bergium’

#question 9

SELECT orderid, customerid, shipcountry, orderdate
FROM orders
WHERE shipcountry IN (’Brazil’,’Mexico’.’Argentina’,’Venezuela’

#question 10

SELECT firstname, lastname, birthday, title
FROM employees
ORDER BY birthday 

#question 11

SELECT firstname, lastname, DATEFORMAT(birthday, '%Y-%m-%d' ) as onlydateofbirth
FROM employees
ORDER BY birthday 

#question 12 

SELECT firstname, lastname, CONCAT(firstname,’ ‘,lastname) as fullname
FROM employees

#question 13

SELECT orderid, productid, unitprice, quantity, (unitprice*quantity) as totalprice
FROM orderdetails

#question 14 

SELECT COUNT DISTINCT (customerid) as total_customer
FROM customers

#question 15 

SELECT min(orderdate)
FROM orders

#question 16

SELECT distinct country 
FROM customers
GROUP BY country

#question 17

SELECT , contactitle, COUNT(contacttitle)
FROM customers
GROUP BY contactitle

#question 18 

SELECT product.productid, product.productname, suppliers.company_name
FROM products JOIN suppliers
    ON products.supplier_id = suppliers.supplier_id
ORDER BY productid

#question 19 

SELECT orders.orderid, orders.DATEFORMAT(orderdate, '%Y-%m-%d') as orderdate, 
    shippers.companyname
FROM orders JOIN shippers
    ON orders.shipvia = shippers.shipper_id

#question 20

SELECT categoryid, COUNT(productid) as total_product, catgory.categoryname
FROM products JOIN category 
    ON products.categoryid = products.categoryid
GROUP BY categoryname
ORDER BY totala_product DESC

#question 21

SELECT country, city, COUNT(customerid) as total_cus
FROM customers
GROUP BY country, city

#question 22

SELECT productid, productname
FROM products
WHERE unitsinstock < reorderlevel
ORDER BY productid

#question 23

SELECT productid, productname, unitinstock, reorderlevel, discontinued
FROM products
WHERE (unitsinstock  + unitsonorder) ≤ reorderlevel 
AND discontinued = 0

#question 24

SELECT customerid, companyname, region
FROM customer
ORDER BY region, customerid

#question 25

SELECT shipcountry, AVG(freight) as freight_charge
FROM orders
GROUP BY shipcountry
ORDER BY freight_charge DESC
LIMIT 3

#question 26 

SELECT shipcountry, AVG(freight) as freight_charge
FROM orders
WHERE year(orderdate) = 2015
GROUP BY shipcountry
ORDER BY freight_charge DESC

#question 27 

###Answer: For a datetime field, the value ‘12/31/2015’ is equivalent ONLY to ‘2015-12-31 00:00:00.000 and NOT to values have a time component

#question 28
SELECT TOP (3) shipcountry, avg(freight)  avgg_cost
FROM orders
WHERE OrderDate >= DATEADD(yy, -1, (SELECT Max(OrderDate) FROM orders))
GROUP BY shipcountry
ORDER BY AverageFreight DESC

#question 29

SELECT orders.employeeid, employees.lastname, orders.orderid, products.productname, orderdetails.quantity
FROM orders JOIN orderdetails ON orders.orders = orderdetail.orders
            JOIN employees ON orders.employeeid = employees.employeeid
            JOIN orderdetails ON orders.orderid = orderdetail.orderid
            JOIN products ON orderdetails.productid = products.productid

#question 30

SELECT [customer](http://customer.name)id, customername
FROM customer 
WHERE customerid NOT EXIST IN (SELECT customer_id FROM orderid)

##other solution 
SELECT customername, cutomerid 
FROM customer
WHERE NOT EXISTS
                (SELECT customerid FROM orders 
                WHERE orders.customerid = customer.customerid)

#question 31

SELECT customers.customerid, orders.customerid, orders.employeeid
FROM customer LEFT JOIN orders
ON orders.customerid = customer.customerid 
AND orders.employeeid = 4
WHERE orders.customerid IS NULL

#question 32

SELECT customers.customername, customers.companyname, orders.orderid, SUM(quantity*price) AS totalorderamount
FROM orders JOIN customer ON orders.customerid = customers.customerid
            JOIN ordersdetails ON orders.orderid = orderdetails.orderid
WHERE orders.orderdate  >= ‘20160101’ AND orders.orderdate < ‘20170101’
GROUP BY customers.customerid, customers.companyname, orders.orderid
HAVING SUM(quantity * unitprice) >10000
ORDER BY totalorderamount DESC 

#question 33

SELECT customers.customername, customers.companyname, orders.orderid, SUM(quantity*price) AS totalorderamount
FROM orders JOIN customer ON orders.customerid = customers.customerid
            JOIN ordersdetails ON orders.orderid = orderdetails.orderid
WHERE orders.orderdate  >= ‘20160101’ AND orders.orderdate < ‘20170101’
GROUP BY customers.customerid, customers.companyname, orders.orderid
HAVING SUM(quantity * unitprice) >15000
ORDER BY totalorderamount DESC 

#question 34

SELECT customers.customername, customers.companyname, orders.orderid, SUM(quantity*price) AS totalorderamount, SUM((price*quantity*(1-Discount)) as totalafter discount 
FROM orders JOIN customer ON orders.customerid = customers.customerid
            JOIN ordersdetails ON orders.orderid = orderdetails.orderid
WHERE orders.orderdate  >= ‘20160101’ AND orders.orderdate < ‘20170101’
GROUP BY customers.customerid, customers.companyname, orders.orderid
HAVING SUM(quantity * unitprice* (1-discount) >10000
ORDER BY totalorderamount DESC 

#question 35

SELECT employees.employeeid, orders.orderid, order.orderdate
FROM employees JOIN orders ON employees.employeeid = orders.employeeid
WHERE orderdate = LAST_DAY(orderdate)
ORDER BY employeeid, orderid

#question 36 

SELECT oders.orderid, oderdetails.COUNT(*) as totalorderdetails
FROM orders JOIN ordersdetails ON orders.orderid = orderdetails.orderid
GROUP BY orders.orderid
ORDER BY COUNT(*) DESC

#question 37
SELECT * FROM orders
ORDER BY RAND()

#question 38

SELECT orders.orderid
FROM orderdetails 
WHERE quantity >= 60 
GROUP BY orderid, quantity
HAVING (*) > 1

#question 39
SELECT orderid, productid, unitprice
FROM orderdetails 
WHERE quantity >= 60 
GROUP BY orderid, quantity
HAVING (*) > 1

##another solution
with DuplicateOrders as 
(SELECT orderid FROM oderdetails 
                WHERE quantity ≥ 60
                GROUP BY orderid, quantity
                HAVING COUNT(*) >1)
SELECT orderid, productid, unitprice, quantity, discount
FROM orderdetails
WHERE orderid IN (SELECT orderid FROM DuplicatOrders)
ORDER BY orderid, quantity

#question 41

SELECT orderid, orderdate, requireddate, shippeddate
FROM orders
WHERE shipdate > requireddate

#question 42 

SELECT employee.employeeid, lastname, COUNT(*) as totallateorders
FROM orders JOIN employees ON employees.employeeid = orders.employeeid
WHERE requiredate < = shipdate
GROUP BY employees.employeeid, employees.lastname

#question 43

with Orderlate as (SELECT employeeid, COUNT(*) as total_orders_late
FROM orders
WHERE shipdate > requireddate GROUP BY employeeid),
Allorders as (SELECT employeeid, COUNT(*) as totalorders 
                FROM orders GROUP BY employeeid)
SELECT employees.employeeid, lastname, Allorders.totalorders, Orderlate.total_orders_late
FROM Employees JOIN Allorders ON Allorders.employeeid = employees.employeeid
                JOIN Lateorders ON Lateorders.employeeid = employees.employeeid

#question 44

with Orderlate as (SELECT employeeid, COUNT(*) as total_orders_late
FROM orders
WHERE shipdate > requireddate GROUP BY employeeid),
Allorders as (SELECT employeeid, COUNT(*) as totalorders 
                FROM orders GROUP BY employeeid)
SELECT employees.employeeid, lastname, Allorders.totalorders, Orderlate.total_orders_late
FROM Employees JOIN Allorders ON Allorders.employeeid = employees.employeeid
            LEFT JOIN Lateorders ON Lateorders.employeeid = employees.employeeid

#question 45

with Lateorders as (SELECT employeeid, COUNT(*) as total_late_orders
FROM orders
WHERE shipdate > requireddate GROUP BY employeeid),
Allorders as (SELECT employeeid, COUNT(*) as totalorders 
                FROM orders GROUP BY employeeid)
SELECT employees.employeeid, lastname, Allorders.totalorders, 
        total_late_orders = lateorders.total_late_orders
            CASE WHEN Orderlate.total_late_orders IS NULL THEN 0
                ELSE Lateorders.total_late_orders
FROM Employees JOIN Allorders ON Allorders.employeeid = employees.employeeid
LEFT JOIN Lateorders ON Lateorders.employeeid = employees.employeeid

#question 46

with Lateorders as (SELECT employeeid, COUNT(employeeid) as total_late_orders
FROM orders
WHERE shipdate >  requireddate GROUP BY employeeid),
Allorders as (SELECT employeeid, COUNT(*) as total_orders 
                FROM orders GROUP BY employeeid)
SELECT employees.employeeid, lastname, Allorders.totalorders as total_orders, 
        total_late_orders = ISNULL(lateorders.total_late_orders,0),
        precentage = ((total_late_orders*1.00)/total_orders)*100
FROM Employees JOIN Allorders ON Allorders.employeeid = employees.employeeid
                LEFT JOIN Lateorders ON Lateorders.employeeid = employees.employeeid
ORDER BY percentage DESC

#question 47 

with Lateorders as (SELECT employeeid, COUNT(employeeid) as total_late_orders
FROM orders
WHERE shipdate >  requireddate GROUP BY employeeid),
Allorders as (SELECT employeeid, COUNT(*) as total_orders 
                FROM orders GROUP BY employeeid)

SELECT employees.employeeid, lastname, Allorders.totalorders as total_orders, 
        total_late_orders = ISNULL(lateorders.total_late_orders,0),
        precentage_ = CONVERT(decimal(10,2),(total_late_orders*1.00/total_orders*100))
FROM Employees JOIN Allorders ON Allorders.employeeid = employees.employeeid
                LEFT JOIN Lateorders ON Lateorders.employeeid = employees.employeeid
ORDER BY percentage_ DESC

#question 48 

with Orders_2016 as (SELECT customers.customerid, customer.companyname, SUM(quantity*unitprice) as total_orders_16
                    FROM orders JOIN orderdetails ON orders.ordersid = orderdetails.orderid
                    JOIN customers ON orders.customerid = customer.customerid
                    WHERE orderdate  >= ‘20160101’ AND orderdate <’20170101’
                    GROUP BY customers.customerid, customers.companyname)
SELECT customerid, companyname, total_orders_16,
        customergroup = 
            CASE
                WHEN total_orders_16 between 0 and 1000 then ‘Low’
                    WHEN total_orders_16 between 10001 and 5000 then ‘Medium’
                    WHEN total_orders_16 between 50001 and 10000 then ‘High’
                    WHEN total_orders_16 > 10000 then ‘Very High’
                END
FROM Orders_16
ORDER BY customerid

#question 49

with Orders_2016 as (SELECT customers.customerid, customer.companyname, SUM(quantity*unitprice) as total_orders_16
                    FROM orders JOIN orderdetails ON orders.ordersid = orderdetails.orderid
                    JOIN customers ON orders.customerid = customer.customerid
WHERE orderdate  >= ‘20160101’ AND orderdate <’20170101’
GROUP BY customers.customerid, customers.companyname)
SELECT customerid, companyname, total_orders_16,
        customergroup = 
                CASE
                    WHEN total_orders_16 > 0 and total_orders_16 < 1000 then ‘Low’
                    WHEN total_orders_16 >= 1000 and total_orders_16 < 5000 then ‘Medium’
                    WHEN total_orders_16 >= 5000 and total_orders_16 < 10000 then ‘High’
                    WHEN total_orders_16 >= 10000  then ‘Very High’
                END
FROM Orders_16
ORDER BY customerid

#question 50

with Orders_2016 as (SELECT customers.customerid, customer.companyname, SUM(quantity*unitprice) as total_orders_16
                    FROM orders JOIN orderdetails ON orders.ordersid = orderdetails.orderid
                    JOIN customers ON orders.customerid = customer.customerid
WHERE orderdate  >= ‘20160101’ AND orderdate <’20170101’
GROUP BY customers.customerid, customers.companyname),
grouping_customer as (SELECT customerid, companyname, total_orders_16,
                                customergroup = 
                CASE
                    WHEN total_orders_16 > 0 and total_orders_16 < 1000 then ‘Low’
                    WHEN total_orders_16 >= 1000 and total_orders_16 < 5000 then ‘Medium’
                    WHEN total_orders_16 >= 5000 and total_orders_16 < 10000 then ‘High’
                    WHEN total_orders_16 >= 10000  then ‘Very High’
                END
                    FROM Orders_16
                    ORDER BY customerid)
SELECT customergroup, COUNT(*) as totalingroup,
        (COUNT(*) 1.0/(SELECT * FROM grouping_customer) as percentagegroup 
FROM grouping_customer
GROUP BY grouping_customer

#question 51

with Orders2016 as (SELECT custosmers.customerid, customers.companyname,
                            Total_order_amount = SUM(Quantity*UnitPrice)
FROM customers JOIN orders ON customers.customerid = orders.customerid
                JOIN orderdetails ON orders.orderid = orderdetails.orderid
WHERE orderdate >= ‘20160101’ AND orderdate > ‘20170101’
GROUP BY customers.customerid, customers.companyname)
SELECT customer id, companyname, totalorderamount, customergroupname
FROM Orders2016 JOIN CustomerGroupThreholds 
                    ON Orders2016.total_order_amount BETWEEN 
                        CustomerGroupThreholds.RangeBottom AND CustomerGroupThreholds.RangeTop 
ORDER BY customerid
#question 52 

SELECT country FROM customers 
UNION 
SELECT country FROM suppliers 
ORDER BY country

#question 53 

with SupplierCountries as 
(SELECT DISTINCT country FROM suppliers)
with CustomerCountries as
(SELECT DISTINCT country FROM customers)
SELECT SupplierCountries.country as suppliercountry,
        CustomerCountries.country as customercountry
FROM SupplierCountry OUTER JOIN CustomerCountries 
                            ON CustomerCountries.country = SupplierCountry.Country

#question 54

with SupplierCountries as 
(SELECT DISTINCT country, COUNT(*) as total FROM suppliers GROUP BY country)
with CustomerCountries as
(SELECT DISTINCT country, COUNT(*) as total FROM customers GROUP BY country)
SELECT country = ISNULL(SupplierCountries.country, CustomerCountries.country),
TotalSuppliers = ISNULL(SupplierCountries.total, 0),
TotalCustomers = ISNULL(CustomerCountries.total, 0)
FROM SupplierCountries OUT JOIN CustomerCountries
           ON CustomerCountries.country = SupplierCountries.country

#question 55

with OrdersbyCountry as
(SELECT shipcountry, customerid, orderid, 
        orderdate = CONVERT(date, orderdate),
        rank() OVER (PARTITION BY shipcountry ORDER BY orderdate) as ranking
FROM orders)
SELECT shipcountry, customerid, orderid, orderdate
FROM OrdersbyCountry
WHERE ranking = 1
ORDER BY shipcountry

#question 56

SELECT initial_orders.customerid, initial_orders.orderid, 
        initialorderdate = CONVERT(date, initial_orders.orderdate),
        next_orders.orderid,
        nextorderdate = CONVERT(date, next_orders.orderdate),
        daydiff(dd, initial_orders.ordedate, next_orders.orderdate)
FROM orders as initial_orders JOIN orders orders as next_orders
                                ON initial_orders.customerid = next_orders.customerid
WHERE initial_orders.orderid < nextorder.orderid
            AND datediff(dd, initial_orders.ordedate, next_orders.orderdate) <=5
ORDER BY initial_orders.customerid,initial_orders.orderid

#question 57

with customer_orders as
(SELECT customerid, 
        orderid as initial_order_id,    
        orderdate as initial_order_date, 
        LEAD (orders.orderdate, 1) OVER (PARTITION BY customerid ORDER BY orderdate) AS next_order_date
FROM orders 
ORDER BY orders.customer, initial_order_date) 
SELECT *, (customer_orders.next_order_date - customer_orders.initial_oder_date) AS daysbetween
FROM customer_orders
WHERE (customer_orders.next_order_date - customer_orders.initial_oder_date) <= 5