create or replace procedure update_product_price(
    p_category_id int,
    p_increase_percent numeric
)
language plpgsql
as $$
declare
    v_record record;
    v_new_price numeric;
begin
    for v_record in
        select product_id, price
        from products
        where category_id = p_category_id
        loop
            v_new_price := v_record.price + (v_record.price * p_increase_percent / 100);

            update products
            set price = v_new_price
            where product_id = v_record.product_id;
        end loop;
end;
$$;

call update_product_price(5, 10);

select * from products
where category_id = 5;