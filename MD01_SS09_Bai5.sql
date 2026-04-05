create or replace procedure calculate_total_sales(
    start_date date,
    end_date date,
    out total numeric
)
    language plpgsql
as $$
begin
    select sum(amount)
    into total
    from sales
    where sale_date between start_date and end_date;
end;
$$;

call calculate_total_sales('2026-01-01', '2026-03-31', null);