create or replace procedure adjust_salary(
    p_emp_id int,
    out p_new_salary numeric
)
language plpgsql
as $$
declare
    v_job_level int;
    v_current_salary numeric;
    v_increase_rate numeric;
begin
    select job_level, salary
    into v_job_level, v_current_salary
    from employees
    where emp_id = p_emp_id;

    if v_job_level = 1 then
        v_increase_rate := 0.05;
    elseif v_job_level = 2 then
        v_increase_rate := 0.10;
    elseif v_job_level = 3 then
        v_increase_rate := 0.15;
    else
        v_increase_rate := 0;
    end if;

    update employees
    set salary = salary + (salary * v_increase_rate)
    where emp_id = p_emp_id
    returning salary into p_new_salary;
end;
$$;

call adjust_salary(3, null);