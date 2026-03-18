CREATE DATABASE EcommerceDB;

CREATE SCHEMA shop;

SET search_path TO shop;

CREATE TABLE Users (
        user_id SERIAL PRIMARY KEY,
        username VARCHAR(50) UNIQUE NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL,
        password VARCHAR(100) NOT NULL,
        role VARCHAR(20) CHECK (role IN ('Customer','Admin'))
);

CREATE TABLE Categories (
        category_id SERIAL PRIMARY KEY,
        category_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Products (
        product_id SERIAL PRIMARY KEY,
        product_name VARCHAR(100) NOT NULL,
        price NUMERIC(10,2) CHECK (price > 0),
        stock INT CHECK (stock >= 0),
        category_id INT,
        FOREIGN KEY (category_id) references Categories(category_id)
);

CREATE TABLE Orders (
        order_id SERIAL PRIMARY KEY,
        user_id INT ,
        order_date DATE NOT NULL,
        status VARCHAR(20) CHECK (status IN ('Pending','Shipped','Delivered','Cancelled')),
        FOREIGN KEY (user_id) references  Users(user_id)
);

CREATE TABLE OrderDetails (
        order_detail_id SERIAL PRIMARY KEY,
        order_id INT,
        product_id INT,
        quantity INT CHECK (quantity > 0),
        price_each NUMERIC(10,2) CHECK (price_each > 0),
        FOREIGN KEY (order_id) references Orders(order_id),
        FOREIGN KEY (product_id) references Products(product_id)
);

CREATE TABLE Payments (
        payment_id SERIAL PRIMARY KEY,
        order_id INT UNIQUE,
        amount NUMERIC(10,2) CHECK (amount >= 0) ,
        payment_date DATE NOT NULL ,
        method VARCHAR(30) CHECK (method IN ('Credit Card','Momo','Bank Transfer','Cash')),
        FOREIGN KEY (order_id) references Orders(order_id)
);


