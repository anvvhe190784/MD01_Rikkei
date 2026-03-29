insert into Product (id, name, category, price, stock)
values 
    (1, 'iPhone 15 Pro', 'Điện tử', 28000000, 15),
    (2, 'Chuột không dây', 'Phụ kiện', 500000, 50),
    (3, 'Tai nghe Sony', 'Điện tử', 8500000, 10),
    (4, 'Bàn phím cơ', 'Phụ kiện', 1200000, 20),
    (5, 'Loa Bluetooth', 'Điện tử', 4500000, 5);

select *
from Product;

select p.name, p.price
from Product as p
order by p.price desc
limit 3;

select p.name, p.category, p.price
from Product as p
where p.category = 'Điện tử' and p.price < 10000000;

select p.name, p.stock
from Product as p
order by p.stock asc;
