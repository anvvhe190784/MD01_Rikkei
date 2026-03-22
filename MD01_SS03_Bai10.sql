create database "CompanyDB";
create table Departments (
    department_id int primary key,
    department_name varchar
);
create table Employees (
    emp_id int primary key,
    name varchar,
    dob date,
    department_id int,
    foreign key (department_id) references Departments(department_id)
);
create table Projects (
    project_id int primary key,
    project_name varchar,
    start_date date,
    end_date date
);
create table EmployeeProjects (
    emp_id int,
    project_id int,
    primary key (emp_id, project_id),
    foreign key (emp_id) references Employees(emp_id),
    foreign key (project_id) references  Projects(project_id)
);