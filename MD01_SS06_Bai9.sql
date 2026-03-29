select p.name as product_name, sum(p.price * od.quantity) as total_sales
from Product p
    join OrderDetail od on p.id = od.product_id
group by p.name;

select p.category, avg(p.price * od.quantity) as avg_revenue
from Product p
    join OrderDetail od on p.id = od.product_id
group by p.category;

select p.category, avg(p.price * od.quantity) as avg_revenue
from Product p
    join OrderDetail od on p.id = od.product_id
group by p.category
having avg(p.price * od.quantity) > 20000000;

select p.name, sum(p.price * od.quantity) as total_sales
from Product p
    join OrderDetail od on p.id = od.product_id
group by p.name
having sum(p.price * od.quantity) > (
    select avg(total_product_sales) from (
        select sum(p2.price * od2.quantity) as total_product_sales
        from Product p2
            join OrderDetail od2 on p2.id = od2.product_id
        group by p2.id
        ) as sub
);

select p.name, sum(od.quantity) as total_quantity
from Product p
    left join OrderDetail od on p.id = od.product_id
group by p.name;