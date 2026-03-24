insert into students (full_name, gender, birth_year, major, gpa)
values ('Phan Hoàng Nam', 'Nam', 2003, 'CNTT', 3.8);

update students
set gpa = 3.4
where full_name = 'Lê Quốc Cường';

delete from students
where gpa is null ;

select *
from students
where major = 'CNTT' and gpa >= 3.0
limit 3;

select distinct major
from students;

select *
from students
where major = 'CNTT'
order by gpa desc, full_name asc;

select *
from students
where full_name like 'Nguyễn%';

select *
from students
where birth_year between 2001 and 2003;