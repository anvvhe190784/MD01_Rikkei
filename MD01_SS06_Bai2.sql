insert into Employee (full_name, department, salary, hire_date)
values
    ('nguyễn văn an', 'it', 15000000, '2023-05-15'),
    ('lê thị bình', 'hr', 8000000, '2022-10-20'),
    ('trần an nhiên', 'it', 12000000, '2023-01-10'),
    ('phạm minh tuấn', 'marketing', 5500000, '2023-11-05'),
    ('hoàng bảo an', 'sales', 9500000, '2024-02-14'),
    ('đỗ thùy chi', 'it', 5000000, '2023-12-25');

update Employee e
set salary = e.salary * 1.1
where e.department = 'it';

delete from Employee e
where e.salary < 6000000;

select e.id, e.full_name, e.department
from Employee as e
where e.full_name ilike '%an%';

select e.full_name, e.hire_date
from Employee as e
where e.hire_date between '2023-01-01' and '2023-12-31';

