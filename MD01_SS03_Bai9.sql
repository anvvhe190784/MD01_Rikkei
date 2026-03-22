create database "SchoolDB";
create table Students (
    student_id int primary key,
    name varchar,
    dob date
);
create table Courses (
    course_id int primary key,
    course_name varchar,
    credits int
);
create table Enrollments (
    enrollment_id int primary key,
    student_id int,
    course_id int,
    grade char(1) check (grade in ('A','B','C','D','F')),
    foreign key (student_id) references Students(student_id),
    foreign key (course_id) references Courses(course_id)
);
