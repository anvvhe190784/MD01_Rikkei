select sum(total_amount) as total_revenue, count(id) as total_orders, avg(total_amount) as average_order_value
from Orders;

select extract(year from order_date) as order_year, sum(total_amount) as annual_revenue
from Orders
group by extract(year from order_date);

select extract(year from order_date) as order_year, sum(total_amount) as annual_revenue
from Orders
group by extract(year from order_date)
having sum(total_amount) > 50000000;

select *
from Orders
order by total_amount desc
limit 5;