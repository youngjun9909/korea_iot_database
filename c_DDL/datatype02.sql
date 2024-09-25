### 날짜형, 열거형 데이터 타입 ###

/*
	5. 날짜형
    : 날짜 및 시간을 저장할 때 사용
    
    a) date (3byte)
    : 날짜만 저장 / YYYY-MM-DD 형식
    EX) 기념일, 생일 등
    
    b) time (3byte)
    : 시간만 저장 / HH:MM:SS 형식
    
    c) datetime (8byte)
    : 날짜와 시간을 저장 / YYYY-MM-DD HH:MM:SS 형식
    EX) 구매 일자, 가입 일자 등
*/

create table events (
	event_name VARCHAR(100),
    event_date DATE
);

INSERT INTO events
VALUE('Birthday', '2024-09-24');

SELECT * FROM events;

/*
	6. 열거형 타입(enum)
    : 사전에 정의된 값의 집합 중 하나의 값을 저장
    > 제한된 값 목록 중에서 선택
    
*/
drop table rainbow;

create table rainbow(
	color enum('red', 'orenge', 'yellow', 'blue'),
    descriptions varchar(100)
);

INSERT INTO rainbow
VALUE 
	('red', '빨강'),
	('orenge', '주황'),
    ('yellow', '노랑'),
    ('blue', '파랑')
;

select * from rainbow;

