create or replace procedure add_order_and_update_customer(
    p_customer_id int,
    p_amount numeric
)
language plpgsql
as $$
declare
    v_customer_exists boolean;
begin
    select exists(
        select 1
        from customers
        where customer_id = p_customer_id
    )
    into v_customer_exists;

    if not v_customer_exists then
        raise exception 'không tìm thấy khách hàng có mã %', p_customer_id;
    end if;

    begin
        insert into orders (customer_id, total_amount)
        values (p_customer_id, p_amount);

        update customers
        set total_spent = total_spent + p_amount
        where customer_id = p_customer_id;

    exception
        when others then
            raise exception 'lỗi hệ thống khi xử lý đơn hàng: %', sqlerrm;
    end;

    raise notice 'đã thêm đơn hàng và cập nhật tổng chi tiêu cho khách hàng %', p_customer_id;
end;
$$;

call add_order_and_update_customer(10, 250.0);

select * from orders where customer_id = 10;
select * from customers where customer_id = 10;