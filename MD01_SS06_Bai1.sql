insert into Product (ProductID, ProductName, Category, Price, StockQuantity)
values
    (1, 'iPhone 15 Pro', 'Điện tử', 28000000, 15),
    (2, 'Chuột không dây', 'Phụ kiện', 500000, 50),
    (3, 'Tai nghe Sony', 'Điện tử', 8500000, 10),
    (4, 'Bàn phím cơ', 'Phụ kiện', 1200000, 20),
    (5, 'Loa Bluetooth', 'Điện tử', 4500000, 5);

select *
from Product;

select p.ProductName, p.Price
from Product as p
order by p.Price desc
limit 3;

select p.ProductName, p.Category, p.Price
from Product as p
where p.Category = 'Điện tử' and p.Price < 10000000;

select p.ProductName, p.StockQuantity
from Product as p
order by p.StockQuantity asc;