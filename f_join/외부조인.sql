### 조인 (join) ###

# 외부 조인 (outer join)
# : 두 개 이상의 테이블을 연결할 때, 조인 조건에 맞지 않는 행도 포함하여 결과를 반환
# > 한 쪽 테이블의 데이터가 없으면 null 값이 반환

# 외부 조인 종류
# left (outer) join, right (outer) join, full (outer) join

# 1. left join
# : 왼쪽 테이블의 모든 행을 포함
# : 오른쪽 테이블에서 일치하는 값이 없을 경우 null로 채움

# 2. right join
# : 오른족 테이블에서 모든 행을 포함
# : 왼쪽 테이블에서 일치하는 값이 없을 경우 null로 채움

# 3. full join
# : 양쪽 테이블의 모든 행을 포함, 일치하지 않으면 null로 채움

### left outer join 예제 ###
USE `join`;

CREATE TABLE customer (
	customer_id int auto_increment primary key,
    name varchar(50)
);

CREATE TABLE orders (
	order_id int primary key,
    customer_id int,
    order_date date,
    foreign key (customer_id) references customer(customer_id)
);

INSERT INTO customer (name) 
VALUES
	('박영준'),
	('홍길동'),
	('전우치');
    
INSERT INTO orders
VALUES
	(101,1,'2024-09-24'),
    (102,2,'2024-09-25');
    
### left 외부 조인 예제 ###
SELECT C.name, O.order_id, O.order_date
FROM customer C
	left outer join orders O
    ON C.customer_id = O.customer_id; 
    -- on 조건과 일치하는 데이터가 있으면 데이터 반환, 없을 경우 null을 반환
    
### right 외부 조인 예제 ###
SELECT C.name, O.order_id, O.order_date
FROM customer C
	right outer join orders O
    ON C.customer_id = O.customer_id;  
    
    
### left 외부 조인 ###
# 각 고객의 이름과 해당 고객이 주문한 총 주문 건수와 주문 날짜를 조회
# 주문이 없는 고객도 포함하여 조회, 주문 건수는 0 으로 표시
SELECT 	C.name,
		count(O.order_id) as total_orders, 
		max(O.order_date) as last_order_date
FROM customer C
	LEFT JOIN orders O
    ON C.customer_id = O.customer_id
GROUP BY C.name;
    
SELECT *
FROM customer C
	LEFT JOIN orders O
    ON C.customer_id = O.order_id
ORDER BY C.customer_id DESC;
    