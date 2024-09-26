### baseball_league를 사용한 조인 예제 ###
use baseball_league;

# 1. 내부 조인
# 타자인 선수와 해당 선수가 속한 팀 이름 가져오기
SELECT T.name, P.name
FROM teams T
	INNER JOIN players P
    ON T.team_id = P.team_id
WHERE P.position = '타자';

# 1990년 이후 창단된 팀의 선수 목록 가져오기
SELECT P.name, T.name
FROM teams T
	INNER JOIN players P
	ON T.team_id = P.team_id
WHERE T.founded_year > 1990;

# 2. 외부 조인
# 모든 팀과 그 팀에 속한 선수 목록 가져오기
SELECT T.name tema_name, P.name player_name
FROM teams T
	LEFT JOIN players P
	ON T.team_id = P.team_id;
	
# 모든 선수와 해당 선수가 속한 팀 이름 가져오기
SELECT T.name tema_name, P.name player_name
FROM teams T
	RIGHT JOIN players P
	ON T.team_id = P.team_id;

# 모든 팀과 해당 팀에 속한 타자 목록 가져오기
SELECT T.name tema_name, P.name player_name, P.position
FROM teams T
	LEFT JOIN players P
    ON T.team_id = P.team_id
WHERE P.position = '타자';