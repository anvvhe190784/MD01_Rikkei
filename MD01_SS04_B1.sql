insert into students (name, age, major, gpa)
values ('Hùng', 23, 'Hóa học', 3.4);

update students
set gpa = 3.6
where name = 'Bình';

delete from students
where gpa < 3.0;

select name, major
from students
order by gpa desc;

select distinct name
from students
where major = 'CNTT';

select *
from students
where gpa between 3.0 and 3.6;

select *
from students
where name ilike 'c%';

select *
from students
order by name asc
limit 3;

select *
from students
order by name asc
limit 3 offset 1;