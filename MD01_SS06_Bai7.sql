select e.full_name, d.name
from Employee e
    inner join Department d on e.department_id = d.id;

select d.name as department_name, avg(e.salary) as avg_salary
from Employee e
    inner join Department d on e.department_id = d.id
group by d.name;

select d.name as department_name, avg(e.salary) as avg_salary
from Employee e
    inner join Department d on e.department_id = d.id
group by d.name
having avg(e.salary) > 10000000;

select d.name
from Department d
    left join Employee e on d.id = e.department_id
where e.id is null;
