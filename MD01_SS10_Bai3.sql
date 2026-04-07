create table employees (
                           id serial primary key,
                           name varchar(100),
                           position varchar(50),
                           salary numeric
);

create table employees_log (
                               log_id serial primary key,
                               employee_id int,
                               operation varchar(10),
                               old_data jsonb,
                               new_data jsonb,
                               change_time timestamp default current_timestamp
);

create or replace function log_employee_changes()
    returns trigger
    language plpgsql
as $$
begin
    if (tg_op = 'INSERT') then
        insert into employees_log (employee_id, operation, new_data)
        values (new.id, 'INSERT', to_jsonb(new));
        return new;

    elsif (tg_op = 'UPDATE') then
        insert into employees_log (employee_id, operation, old_data, new_data)
        values (new.id, 'UPDATE', to_jsonb(old), to_jsonb(new));
        return new;

    elsif (tg_op = 'DELETE') then
        insert into employees_log (employee_id, operation, old_data)
        values (old.id, 'DELETE', to_jsonb(old));
        return old;
    end if;

    return null;
end;
$$;

create trigger trg_employees_audit
    after insert or update or delete on employees
    for each row
execute function log_employee_changes();

insert into employees (name, position, salary)
values ('trần văn b', 'developer', 2000);

update employees
set salary = 2500
where name = 'trần văn b';

delete from employees
where id = 1;

select * from employees_log;