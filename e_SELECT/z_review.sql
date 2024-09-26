USE korea_db;

# 1 
SELECT name, contact, grade  FROM `members`;

# 2
SELECT name, grade FROM `members`
WHERE area_code = 'seoul';

# 3
SELECT name, join_date FROM members
WHERE grade in('Gold', 'Platinum', 'Diamond'); # not in = 포함되지 않을 경우

#4
SELECT name, join_date FROM members
WHERE year(join_date) = 2023; # 20230101 이상 20231231 이하

#5
SELECT name, points FROM members
WHERE points >= 100;

#6
SELECT name, grade FROM members
WHERE gender = 'Male' AND grade in('Gold', 'Platinum', 'Diamond');

#7
SELECT member_id, max(purchase_date) as last_purchase_date FROM purchases
GROUP BY member_id # 회원별로 구매 데이터를 묶어 
ORDER BY last_purchase_date desc # 그 데이터들 중 제일 최근 데이터만 뽑아 
LIMIT 3; # 상위 3 명만을 반환 

#8 
SELECT member_id, sum(amount) as total_spent FROM purchases
GROUP BY member_id;
