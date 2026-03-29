select c.name, sum(o.total_amount) as total_spent
from Customer c
    join Orders o on c.id = o.customer_id
group by c.name
order by total_spent desc;

select c.name, sum(o.total_amount) as total_spent
from Customer c
    join Orders o on c.id = o.customer_id
group by c.name
having sum(o.total_amount) = (
    select max(total_customer_spent) from (
        select sum(total_amount) as total_customer_spent
        from Orders
        group by customer_id
    ) as sub
);

select c.name
from Customer c
    left join Orders o on c.id = o.customer_id
where o.id is null;

select c.name, sum(o.total_amount) as total_spent
from Customer c
    join Orders o on c.id = o.customer_id
group by c.name
having sum(o.total_amount) > (
    select avg(total_customer_spent) from (
        select sum(total_amount) as total_customer_spent
        from Orders
        group by customer_id
    ) as sub
);