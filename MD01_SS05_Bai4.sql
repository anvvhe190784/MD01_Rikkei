select c.customer_name, o.order_date, o.total_amount
from customers c
    join orders o on c.customer_id = o.customer_id;

select sum(total_amount) as total_revenue, avg(total_amount) as avg_order_value, max(total_amount) as max_order, min(total_amount) as min_order, count(order_id) as order_count
from orders;

select c.city, sum(o.total_amount) as total_revenue
from customers c
    join orders o on c.customer_id = o.customer_id
group by c.city
having sum(o.total_amount) > 10000;

select c.customer_name, o.order_date, oi.product_name, oi.quantity, oi.price
from customers c
    join orders o on c.customer_id = o.customer_id
    join order_items oi on o.order_id = oi.order_id;

select c.customer_name, sum(o.total_amount) as total_revenue
from customers c
    join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(o.total_amount) = (
    select max(customer_revenue)
    from (
        select customer_id, sum(total_amount) as customer_revenue
        from orders
        group by customer_id
         ) customer_revenue_summary
);