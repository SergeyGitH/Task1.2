CREATE table if not exists products ( 
	product_id int,
	product_name varchar(64),
	product_category_id int,
	product_price float )
DISTRIBUTED BY (product_id)
PARTITION BY LIST (product_category_id)
( partition category_1 values (1),
	partition category_2 values (2),
	partition category_3 values (3),
	partition category_4 values (4)
)
	
insert into products values 
(1, 'milk' , 1, 90.00),
(2, 'bread' , 2, 75.00),
(3, 'coffee' , 3, 300.00),
(4, 'tea' , 3, 115.00),
(5, 'sugar' , 4, 50.00);


CREATE table if not exists sales ( 
	sales_id int,
	product_id int,
	sale_date DATE,
	sale_sum int )
DISTRIBUTED BY (sales_id)
PARTITION BY RANGE (sale_date)
( START (date '2023-01-01') INCLUSIVE
   END (date '2023-08-30') EXCLUSIVE
   EVERY (INTERVAL '1 month') );
	
  
insert into sales values 
(1, 1 , '2023-02-01', 10),
(2, 2 , '2023-03-01', 11),
(3, 5 , '2023-04-03', 20),
(4, 3 , '2023-04-05', 13),
(5, 5 , '2023-05-07', 12),
(6, 1 , '2023-06-01', 21),
(7, 4 , '2023-06-11', 5),
(8, 2 , '2023-07-10', 7),
(9, 5 , '2023-07-13', 22),
(10, 2 , '2023-08-01', 17);

set optimizer = on;




select 
	sum(sales.sale_sum * products.product_price) as sales
from sales
join products on sales.product_id = products.product_id 
where sales.product_id = 2 and sale_date between date '2023-07-01' and date '2023-08-30'