alter table library.Books
    add column genre varchar;
alter table library.Books
    rename column available to is_available;
alter table library.Members
    drop column email;
drop table sales.OrderDetails;
