# 학교 관리 시스템 
create database school_db;
use school_db;

create table Students(
	student_id int auto_increment primary key,
    student_name varchar(255),
    student_major varchar(255),
    entrance_year year
);

create table Professors(
	professor_id int auto_increment primary key,
    professor_name varchar(255),
    department varchar(255),
    office varchar(255)
);

create table Courses(
	course_id int auto_increment primary key,
    course_name varchar(255),
    professor_id int,
    credit int
);

create table Enrollments(
	enrollment_id int,
	student_id int,
    course_id int,
    enrollment_year year,
    Semester int
);















