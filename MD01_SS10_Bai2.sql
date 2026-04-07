create table customers (
                           id serial primary key,
                           name varchar(100),
                           credit_limit numeric
);

create table orders (
                        id serial primary key,
                        customer_id int references customers(id),
                        order_amount numeric
);

create or replace function check_credit_limit()
    returns trigger
    language plpgsql
as $$
declare
    v_current_total numeric;
    v_limit numeric;
begin
    select coalesce(sum(order_amount), 0)
    into v_current_total
    from orders
    where customer_id = new.customer_id;

    select credit_limit
    into v_limit
    from customers
    where id = new.customer_id;

    if (v_current_total + new.order_amount) > v_limit then
        raise exception 'không thể thêm đơn hàng: tổng giá trị (%) vượt quá hạn mức tín dụng (%)',
            (v_current_total + new.order_amount), v_limit;
    end if;

    return new;
end;
$$;

create trigger trg_check_credit
    before insert on orders
    for each row
execute function check_credit_limit();

insert into customers (name, credit_limit)
values ('nguyễn văn a', 1000);

insert into orders (customer_id, order_amount)
values (1, 500);

insert into orders (customer_id, order_amount)
values (1, 600);