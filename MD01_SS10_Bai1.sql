create table products (
                          id serial primary key,
                          name varchar(100),
                          price numeric,
                          last_modified timestamp default current_timestamp
);

create or replace function update_last_modified()
    returns trigger
    language plpgsql
as $$
begin
    new.last_modified := current_timestamp;
    return new;
end;
$$;

create trigger trg_update_last_modified
    before update on products
    for each row
execute function update_last_modified();

insert into products (name, price)
values ('laptop', 1500);

update products
set price = 1400
where name = 'laptop';

select * from products;
