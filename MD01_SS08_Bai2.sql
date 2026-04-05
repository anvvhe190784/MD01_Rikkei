create or replace procedure check_stock(
    p_id int,
    p_qty int
)
language plpgsql
as $$
declare
    v_current_stock int;
begin
    select quantity
    into v_current_stock
    from inventory
    where product_id = p_id;

    if v_current_stock < p_qty then
        raise exception 'Không đủ hàng trong kho';
    end if;

    raise notice 'Kiểm tra thành công: đủ hàng trong kho';
end;
$$;

call check_stock(1, 10);
call check_stock(1, 100);