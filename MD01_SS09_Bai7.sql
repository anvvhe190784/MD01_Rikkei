create or replace procedure add_order(
    p_customer_id int,
    p_amount numeric
)
language plpgsql
as $$
begin
    if not exists (
        select 1
        from customers
        where customer_id = p_customer_id
    ) then
        raise exception 'khách hàng với mã % không tồn tại trong hệ thống', p_customer_id;
    end if;

    insert into orders (customer_id, amount, order_date)
    values (p_customer_id, p_amount, current_date);

    raise notice 'thêm đơn hàng thành công cho khách hàng %', p_customer_id;
end;
$$;

