### 스토어드 프로시저 예제 ###

# 1. case 문 활용

# 총 구매액
# 1500 이상 - 최우수 고객
# 1000 ~ 1499 - 우수 고객
# 1 ~ 999 - 일반 고객
# 0 이하 (구매내역 X) - 일반 회원
USE market_db;
SELECT * FROM buy;

SELECT M.mem_id, M.mem_name, SUM(price * amount) AS "총 구매액",
	CASE
		WHEN SUM(price * amount) >= 1500 THEN '최우수 고객'
		WHEN SUM(price * amount) >= 1000 THEN '우수 고객'
		WHEN SUM(price * amount) >= 1 THEN '일반 고객'
        else
			'일반 회원'
	END '회원 등급' # case문을 히원 등급 열(컬럼)으로 생성
FROM member M
	LEFT JOIN buy B
    ON B.mem_id = M.mem_id
GROUP BY M.mem_id
ORDER BY '총 구매액' DESC;