create table products (
                          id serial primary key,
                          name varchar(100),
                          stock int
);

create table orders (
                        id serial primary key,
                        product_id int references products(id),
                        quantity int
);

create or replace function update_stock_on_order()
    returns trigger
    language plpgsql
as $$
begin
    if (tg_op = 'INSERT') then
        update products
        set stock = stock - new.quantity
        where id = new.product_id;
        return new;

    elsif (tg_op = 'UPDATE') then
        update products
        set stock = stock + old.quantity - new.quantity
        where id = new.product_id;
        return new;

    elsif (tg_op = 'DELETE') then
        update products
        set stock = stock + old.quantity
        where id = old.product_id;
        return old;
    end if;

    return null;
end;
$$;

create trigger trg_update_inventory
    after insert or update or delete on orders
    for each row
execute function update_stock_on_order();