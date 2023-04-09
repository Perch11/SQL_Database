create table salesman
(
    salesman_id INT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    city        VARCHAR(50) NOT NULL,
    commission  DECIMAL(3, 2)
);
insert into salesman (salesman_id, salesman_name, city, commision)
values (19, 'Benoit Bould', 'Austin', 0.89);

create table customer
(
    customer_id INT PRIMARY KEY,
    cust_name   VARCHAR(50) not null,
    city        VARCHAR(50) not null,
    grade       INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman (salesman_id)
);
insert into customer (customer_id, cust_name, city, grade, salesman_id)
values (1, 'Manya Blackledge', 'Tuateta', 450, 13);

//1
select salesman.name, customer.cust_name, customer.city
from salesman,
     customer
where salesman.city = customer.city
    // 2
select customer.cust_name, customer.city, orders.ord_no, orders.purch_amt
from customer,
     orders
where orders.purch_amt between 500 and 2000
  and customer.customer_id = orders.customer_id
    // 3
select customer.cust_name, customer.city, salesman.name, salesman.commission
from customer,
     salesman
where customer.salesman_id = salesman.salesman_id
    // 4
select customer.cust_name, customer.city, salesman.name, salesman.city, salesman.commission
from customer
         join salesman using (salesman_id)
where salesman.commission > 0.12
    // 5
select customer.cust_name, customer.city, salesman.name, salesman.city, salesman.commission
from customer
         join salesman using (salesman_id)
where customer.city <> salesman.city
  and salesman.commission > 0.12
    // 6
SELECT orders.ord_no,
       orders.ord_date,
       orders.purch_amt,
       customer.cust_name AS "Customer Name",
       customer.grade,
       salesman.name      AS "Salesman",
       salesman.commission
FROM orders
         INNER JOIN customer using (customer_id)
         INNER JOIN salesman ON orders.salesman_id = salesman.salesman_id;
//7
SELECT *
FROM orders
         NATURAL JOIN customer
         NATURAL JOIN salesman;

//8
SELECT customer.cust_name,
       customer.city,
       customer.grade,
       salesman.name AS "Salesman",
       salesman.city
FROM customer
         LEFT JOIN salesman
                   ON customer.salesman_id = salesman.salesman_id
ORDER BY customer.customer_id;
//9
SELECT customer.cust_name,
       customer.city,
       customer.grade,
       salesman.name AS "Salesman",
       salesman.city
FROM customer
         LEFT JOIN salesman
                   ON customer.salesman_id = customer.salesman_id
WHERE customer.grade < 300
    // 10
SELECT customer.cust_name,
       customer.city,
       orders.ord_no,
       orders.ord_date,
       orders.purch_amt AS "Order_amt"
FROM customer
         LEFT JOIN orders
                   ON customer.customer_id = orders.customer_id
ORDER BY orders.ord_date;
//12
SELECT customer.cust_name,
       customer.city,
       customer.grade,
       salesman.name AS "Salesman",
       salesman.city
FROM salesman
         LEFT JOIN customer
                   ON salesman.salesman_id = customer.salesman_id
ORDER BY salesman.salesman_id;
//14
SELECT customer.cust_name,
       customer.city,
       customer.grade,
       salesman.name AS "Salesman",
       orders.ord_no,
       orders.ord_date,
       orders.purch_amt
FROM salesman
         LEFT JOIN customer
                   ON salesman.salesman_id = customer.salesman_id
         LEFT JOIN orders
                   ON orders.customer_id = customer.customer_id
WHERE orders.purch_amt >= 2000
  AND customer.grade IS NOT NULL;
//15
SELECT customer.cust_name,
       customer.city,
       customer.ord_no,
       orders.ord_date,
       orders.purch_amt AS "Order_amt"
FROM customer
         LEFT JOIN orders ON customer.customer_id = orders.customer_id;
//16
SELECT customer.cust_name,
       customer.city,
       orders.ord_no,
       orders.ord_date,
       orders.purch_amt AS "Order_amt"
FROM customer
         FULL JOIN orders
                   ON customer.customer_id = orders.customer_id
WHERE customer.grade IS NOT NULL;
//21
SELECT *
FROM item
         JOIN company
              ON item.pro_com = company.com_id;
//22
SELECT item.pro_name, pro_price, company.com_name
FROM item
         JOIN company
              ON item.pro_com = company.com_id;
//23
SELECT company.com_name, avg(item.pro_price)
FROM item
         JOIN company
              ON item.pro_com = company.com_id;
//24
SELECT company.com_name, avg(item.pro_price)
FROM item
         JOIN company
              ON item.pro_com = company.com_id;
HAVING avg(item.pro_price) >= 350;
//25
SELECT item.pro_name, item.pro_price, company.com_name
FROM item INNER JOIN company
                            ON item.pro_com = company.com_id
                                AND item.pro_price =
                                    (
                                        SELECT MAX(item.pro_price)
                                        FROM item
                                        WHERE item.pro_com = company.com_id
                                    );
//29
SELECT department.dpt_name,count(*) as "Count employees"
FROM details
         INNER JOIN department
                    ON details.emp_dept = department.dpt_code
HAVING COUNT(*) > 2;
