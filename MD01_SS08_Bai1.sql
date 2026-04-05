create or replace procedure calculate_order_total(
    order_id_input int,
    out total numeric
)
language plpgsql
as $$
begin
    select sum(quantity * unit_price)
    into total
    from order_detail
    where order_id = order_id_input;
end;
$$;

call calculate_order_total(1, null);