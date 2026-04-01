create view v_order_summary as
select c.full_name, o.total_amount, o.order_date
from customer c
    join orders o on c.customer_id = o.customer_id;

select * from v_order_summary;

create view v_large_orders as
select * from orders
where total_amount >= 1000000;

update v_large_orders
set order_date = '2026-04-01'
where order_id = 1;

create view v_monthly_sales as
select extract(year from o.order_date) as sales_year, extract(month from o.order_date) as sales_month, sum(o.total_amount) as total_revenue
from orders o
group by extract(year from o.order_date), extract(month from o.order_date);

drop view v_monthly_sales;