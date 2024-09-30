### 트랜잭션 ###
/*
## 트랜잭션

- DB에서 하나의 논리적인 작업 단위로 처리되는 연산들의 집합
- 일관성, 무결성을 유지하면서 다수의 작업을 한 번에 처

> **트랜잭션 특징**
> 
- ACID 특성을 따름
- **Atiomicity (원자성)** -  All or Nothing : 모두 성공적으로 완료되거나 모두 취소
- **Contitency (일관성)** : 트랜잭션 실행 전후에 DB상태는 일관되게 유지
- **Isolation (독립성)** : 하나의 트랜잭션 실행 시 다른 트랜잭션이 간섭할 수 없다
- **Durability (지속성)** : 트랜잭션이 성공적으로 완료된 경우 시스템 오류가 발생하더라도 결과가 영구적으로 저장

> **트랜잭션 작업 흐름**
> 
- 트랜잭션 실행 단계
1. 트랜잭션 시작
2. 작업 실행 - 여러 SQL 명령어를 통해 트랜잭션 내에서 실행
3. 커밋(Commit) - 모든 작업이 성공적으로 완료되면 DB에 변경사항을 확정하는 명령 실행 
4. 롤백(Rollback) - 작업 중 오류 발생 | 작업을 취소하고 싶을 때 롤백 명령어를 통해 DB를 트랜잭션   시작 전 상태로 되돌림

> **트랜잭션 사용법**
> 
- start transaction : 트랜잭션 시작
- commit : 작업 완료 시 , 변경 사항을 DB에 저장
- rollback : 작업을 취소하고, 변경사항을 트랜잭션 시작 전으로 되돌림
- savepoint : 트랜잭션 내에서 특정 지점을 저장하여 해당 지점으로 롤백
*/
-- start transaction  
	-- 해당 블럭 내의 명령어들은 하나으 명령어처럼 처리
	-- 성공하던지, 다 실패하던지 둘 중 하나의 결과만을 반환
	-- A의 계좌로부터 인출;
	-- B의 계좌로 입금;
-- commit;

drop database if exists `트랜잭션`;
create database `트랜잭션`;
use `트랜잭션`;

create table member (
	m_id int primary key,
    m_name varchar(50),
    m_age int
);

create table buy (
	buy_id int primary key,
    m_id int,
    product_name varchar(100),
    price int,
    foreign key(m_id) references member(m_id)
);

start transaction;
insert into member (m_id, m_name, m_age) values (1,'박영준',26);
insert into buy 
values (1,1,'노트북',2000);

# 예외가 없으면 변경사항을 저장
commit;

select * from member;
select * from buy;

create table account (
	account_id varchar(10) primary key,
    account_holder varchar(50),
    balance int
);

insert into account 
values ('A','박영준', 5000),
		('B','홍길동', 5000);

start transaction

update account 
set 
	balance = balance - 1000
where account_id = 'A';

update account 
set 
	balance = balance + 1000
where account_id = 'B';

commit;

select * from account;

### 계좌 이체 내역을 기록하는 테이블 ###
create table transaction_log (
	transaction_id int primary key,
    from_account_id int,
    to_accoun_id int,
    amount int,
    transaction_date timestamp default current_timestamp,
    foreign key (from_account_id) references `account`(account_id),
    foreign key (to_accoun_id) references `account`(account_id)
);






