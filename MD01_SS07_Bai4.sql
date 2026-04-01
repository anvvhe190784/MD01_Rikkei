create view v_revenue_by_region as
select c.region, sum(o.total_amount) as total_revenue
from customer c
    join orders o on c.customer_id = o.customer_id
group by c.region;

select v.region, v.total_revenue
from v_revenue_by_region v
order by v.total_revenue desc
limit 3;

create view v_revenue_above_avg as
select v.region, v.total_revenue
from v_revenue_by_region v
where v.total_revenue > (select avg(total_revenue) from v_revenue_by_region);

