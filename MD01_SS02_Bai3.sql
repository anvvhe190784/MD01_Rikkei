create database "SalesDB";
create schema sales;
create table sales.Customers (
    customer_id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar unique not null,
    phone varchar
);
create table sales.Products (
    product_id serial primary key,
    product_name varchar(100) not null,
    price real not null,
    stock_quantity int not null
);
create table sales.Orders (
    order_id serial primary key,
    customer_id int,
    order_date date not null,
    foreign key (customer_id) references sales.Customers(customer_id)
);
create table sales.OrderItems (
    order_item_id serial primary key,
    order_id int,
    product_id int,
    quantity int not null check (quantity >= 1),
    foreign key (order_id) references sales.Orders(order_id),
    foreign key (product_id) references sales.Products(product_id)
);