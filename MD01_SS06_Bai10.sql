select name, city
from OldCustomers
union
select name, city
from NewCustomers;

select name, city
from OldCustomers
intersect
select name, city
from NewCustomers;

select all_c.city, count(*) as total_customers
from (
    select city
    from OldCustomers
    union all
    select city
    from NewCustomers
) as all_c
group by all_c.city;

select all_c.city, count(*) as customer_count
from (
    select city
    from OldCustomers
    union all
    select city
    from NewCustomers
) as all_c
group by all_c.city
having count(*) = (
    select max(city_count)
    from (
        select count(*) as city_count
        from (
            select city
            from OldCustomers
            union all
            select city
            from NewCustomers
        ) as temp
        group by city
    ) as sub
);