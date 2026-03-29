insert into Customer (name, email, phone, points)
values
    ('nguyễn văn an', 'an@gmail.com', '0912345678', 500),
    ('lê thị bình', 'binh@gmail.com', '0922345678', 1200),
    ('trần an nhiên', 'nhien@gmail.com', '0932345678', 800),
    ('phạm minh tuấn', null, '0942345678', 300),
    ('hoàng bảo an', 'baoan@gmail.com', '0952345678', 1500),
    ('đỗ thùy chi', 'chi@gmail.com', '0962345678', 950),
    ('nguyễn văn an', 'vanan@gmail.com', '0972345678', 1100);

select distinct c.name
from Customer c;

select c.id, c.name, c.phone
from Customer c
where c.email is null;

select c.name, c.points
from Customer as c
order by c.points desc
limit 3 offset 1;

select c.id, c.name, c.points
from Customer as c
order by c.name desc;