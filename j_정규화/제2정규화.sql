### 제2정규형 ###
/*
	2NF의 정의
    : DB 정규화의 두 번째
    : 1NF를 만족하면서 모든 비기본 속성이 기본키에 완전히 함수적 종속인 상태
    
    cf) 완전히 함수적 종속
    # : 속성이 기본키 전체에 종속되어 있으며 기본키의 일부분만으로는 결정할 수 없는 경우
    
    cf) 부분 종속
    : 속성이 기본키의 일부에만 종속되는 경우
    EX) 기본키가 복합키인 경우 그 중 일부 키에만 종속된다면 부분 종속
    
*/
use `정규화`;
create table employees (
	empolyee_id varchar(10) primary key,
    department_name varchar(50),
    foreign key(department_name) references departments(department_name)
);

create table departments (
	department_name varchar(50) primary key,
    location varchar(50),
    supervisor_id varchar(10)
);

insert into departments
values
	('sales','seoul', 's1'),
	('HR','busan', 's2');

insert into employees
values
	('e1','sales'),
	('e2','sales'),
	('e3','HR');
    
select * from departments;
select * from employees;






