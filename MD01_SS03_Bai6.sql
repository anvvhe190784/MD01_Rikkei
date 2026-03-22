create database "LibraryDB";
create schema library;
create table library.Books (
    book_id int primary key,
    title varchar,
    author varchar,
    published_year int,
    available boolean default true
);
create table library.Members (
    member_id int primary key,
    name varchar,
    email varchar unique,
    join_date date default current_date
);