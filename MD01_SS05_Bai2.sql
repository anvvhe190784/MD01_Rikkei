select p.product_name, sum(o.total_price) as total_revenue
from products p
    join orders o on p.product_id = o.product_id
group by p.product_id, p.product_name
having sum(o.total_price) = (
    select max(total_revenue)
    from (
        select sum(total_price) as total_revenue
            from orders
            group by product_id
         ) as total_revenue
);

select p.category, sum(o.total_price) as total_revenue
from products p
    join orders o on p.product_id = o.product_id
group by p.category;
