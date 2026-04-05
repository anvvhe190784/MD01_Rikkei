create or replace procedure calculate_discount(
    p_id int,
    out p_final_price numeric
)
language plpgsql
as $$
declare
    v_price numeric;
    v_discount_percent int;
begin
    select price, discount_percent
    into v_price, v_discount_percent
    from products
    where id = p_id;

    if v_discount_percent > 50 then
        v_discount_percent := 50;
    end if;

    p_final_price := v_price - (v_price * v_discount_percent / 100);

    update products
    set price = p_final_price
    where id = p_id;
end;
$$;

call calculate_discount(2, null);