create database "LibraryDB";
create schema sales;
create table sales.Products (
    product_id serial primary key,
    product_name varchar,
    price numeric(10,2),
    stock_quantity integer
);
create table sales.Orders (
    order_id serial primary key,
    order_date date default current_date,
    member_id integer,
    foreign key (member_id) references library.Members(member_id)
);
create table sales.OrderDetails (
    order_detail_id serial primary key,
    order_id integer references sales.Orders(order_id),
    product_id integer references sales.Products(product_id),
    quantity integer
);
