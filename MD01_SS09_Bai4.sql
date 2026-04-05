create or replace view v_customer_sales_summary as
select customer_id, sum(amount) as total_amount
from sales
group by customer_id;

select *
from v_customer_sales_summary
where total_amount > 1000;

update v_customer_sales_summary
set total_amount = 2000
where customer_id = 1;