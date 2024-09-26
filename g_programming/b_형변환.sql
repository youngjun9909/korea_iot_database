### 데이터 형 변환 ###
# 기본 데이터 타입 간의 명시를 달리하는 문법
USE market_db;
### 형 변환의 종류
# 1. 명시적인 변환
# cast(), convert() - 형식만 다르고 기능은 동일
-- cast(값 as 데이터 형식)
-- convert(값, 데이터 형식)


SELECT AVG(price) as '평균 가격' -- 실수값이 반환
FROM buy;

# cf) 형변환 시 정수형 데이터타입 - signed, unsigned 만 사용 가능
# signed: 부호가 있는 정수
# unsigned: 부호가 없는 정수 
SELECT CAST(AVG(price) AS SIGNED)
FROM buy;

# 날짜 형 변환 (포맷을 맞추기 위함)
# date 타입 : YYYY-MM-DD

SELECT CAST('2022$12$12' AS DATE);
SELECT CAST('2022&12&12' AS DATE);
SELECT CAST('2022*12*12' AS DATE);

# 2. 묵시적인 변환
# : 별도의 지시없이 자동 변환
SELECT '100'+'200';

# cf) 문자열을 이어서 작성: concat()함수 사용
SELECT CONCAT('100', '200'); 











