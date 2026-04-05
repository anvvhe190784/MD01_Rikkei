create index idx_orders_customer_id on orders(customer_id);

explain analyze
select *
from orders
where customer_id = 12345;