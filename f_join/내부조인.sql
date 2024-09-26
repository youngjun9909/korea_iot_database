### join (조인) ###

# join: 결합하다 
# : 두 개 이상의 테이블을 서로 연결하여 데이터를 조회하는 기능
#>> 여러 테이블에서 필요한 데이터를 얻기 위해 테이블을 묶어 출력

# 조인의 종류
# : 내부 조인 (inner join), 외부 조인 (outer join)
# , 자기 조인 (self join), 상호 조인 (across join)

### 1. 내부 조인 ###
# : 두 테이블의 공통된 값을 기준으로 데이터를 결합하는 조인 방식
# : 테이블 간에 일치하는 행만 결과에 반환
# - 일치하지 않을 경우 출력 X

/*
	SELECT
		테이블1컬럼, 테이블2컬럼 ...
	FROM
		테이블 1 (기준)
			INNER JOIN 테이블2 (연결)
            ON 테이블1.공통컬럼 = 테이블2.공통컬럼;
	
    # ON 키워드: 두 테이블 간의 공통된 열을 통해 데이터를 결합하는 기준
*/
#cf) INNER JOIN의 경우 축약형으로 JOIN 키워드만 사용 가능!

CREATE DATABASE IF NOT EXISTS `join`;
-- SQL의 예약어를 DB명 또는 Table 명으로 쓰는 경우 반드시 ``으로 감싸야함
USE `join`;

CREATE TABLE `member` (
	member_id int primary key,
    member_name varchar(50),
    member_age int
);

CREATE TABLE `purchase` (
	purchase_id int primary key,
    member_id int,
    item_name varchar(100),
    item_price int,
    foreign key (member_id) references member(member_id)
);

INSERT INTO member
VALUES
	(1, '박영준', 26),
    (2, '전우치', 30),
    (3, '홍길동', 34);
    
INSERT INTO purchase
value	
	(1, 1, '노트북', 200),
    (2, 2, '스마트폰', 130),
    (3, 1, '태블릿', 150),
    (4, 3, '이어폰', 30);
    
### 내부 조인 예제 ###
# : 회원과 그들이 구매한 상품 정보를 함께 조회
# > 구매 내역이 없는 회원의 정보는 출력 X
# > 기준이 되는 테이블의 모든 정보를 출력할 수 X

SELECT 
	member.member_name , purchase.item_name, purchase.item_price
FROM 
	member
		INNER JOIN purchase
        ON member.member_id = purchase.member_id;     
        
# 조건을 추가한 내부 조인
# item_price 가 150 이상인 상품을 구매한 회원 정보를 조회
SELECT 
	M.member_name, P.item_name, P.item_price
FROM 
	member as M
		JOIN purchase as P
        ON M.member_id = P.member_id
WHERE
	P.item_price >= 150;
    
    
### 특정 나이대의 회원이 구매한 상품 개수와 총 구매 금액 조회 ###
SELECT
	M.member_name,
    count(P.purchase_id) as item_count,-- 회원이 구매한 상품 개수
    sum(P.item_price) as total_price
FROM 
	member as M
		JOIN purchase P	
		ON M.member_id = P.member_id -- member_id 기준으로 두 테이블 조인
WHERE
	M.member_age BETWEEN 25 AND 30 -- 특정 나이대 설정
GROUP BY 
	M.member_name -- 회원별로 그룹화
HAVING
	count(P.purchase_id) >= 2
    and sum(P.item_price) >= 300;