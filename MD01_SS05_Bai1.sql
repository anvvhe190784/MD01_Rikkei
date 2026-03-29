select p.category, sum(o.total_price) as total_sales, sum(o.quantity) as total_quantity
from products p
    join orders o on p.product_id = o.product_id
group by p.category
having sum(o.total_price) > 2000
order by total_sales desc;