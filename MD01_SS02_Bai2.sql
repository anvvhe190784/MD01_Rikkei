create database "UniversityDB";
create schema university;
create table university.Students (
    student_id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    birth_date date,
    email varchar unique not null
);
create table university.Courses (
    course_id serial primary key,
    course_name varchar(100) not null,
    credits int
);
create table university.Enrollments (
    enrollment_id serial primary key,
    student_id int,
    course_id int,
    enroll_date date,
    foreign key (student_id) references university.Students(student_id),
    foreign key (course_id) references university.Courses(course_id)
);