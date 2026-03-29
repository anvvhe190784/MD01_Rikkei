insert into OrderInfo (customer_id, order_date, total, status)
values
    (1, '2024-10-05', 1200000, 'Completed'),
    (2, '2024-10-15', 450000, 'Pending'),
    (3, '2024-11-01', 800000, 'Shipped'),
    (1, '2024-10-25', 2500000, 'Completed'),
    (4, '2024-09-20', 300000, 'Cancelled');

select o.id, o.total, o.status
from OrderInfo o
where o.total > 500000;

select o.id, o.order_date, o.total
from OrderInfo o
where o.order_date between '2024-10-01' and '2024-10-31';

select o.id, o.total, o.status
from OrderInfo o
where o.status <> 'Completed';

select o.id, o.order_date, o.total
from OrderInfo o
order by o.order_date desc
limit 2;