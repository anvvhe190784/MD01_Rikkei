select c.customer_name, sum(o.total_price) as total_revenue, count(o.order_id) as order_count
from customers c
    join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(o.total_price) > 2000;

select c.customer_name, sum(o.total_price) as total_revenue
from customers c
    join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(o.total_price) > (
    select avg(customer_revenue)
    from (
        select customer_id, sum(total_price) as customer_revenue
        from orders
        group by customer_id
         ) customer_revenue_summary
);

select c.city, sum(o.total_price) as total_revenue
from customers c
    join orders o on c.customer_id = o.customer_id
group by c.city
having sum(o.total_price) = (
    select max(city_revenue)
    from (
        select c.city, sum(o.total_price) as city_revenue
        from customers c
            join orders o on c.customer_id = o.customer_id
            group by c.city
         ) city_revenue_summary
);