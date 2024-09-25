/*
	1. DDL
    CREATE(생성),DROP(삭제), ALTER(수정), TRUNCATE(삭제)
    >> 데이터베이스, 테이블에 적용
    
    +) USE: 데이터베이스 지정 키워드
    +) DESC(DESCRIBE): 테이블 구조 조회
    +) SHOW 데이터베이스명: 데이터베이스 목록 조회
    +) IF EXISTS / IF NOT EXISTS: 존재할 경우 실행/ 존재하지 않을 경우 실행
    
    2. 데이터 타입 
    : 정수형, 문자형, 실수형, 논리형, 날짜형, 열거형
*/

/* 예제 실습 */
# 1. 데이터베이스 생성
# 야구 팀 관리 데이터를 저장하는 데이터베이스
# : baseball_league;
CREATE DATABASE baseball_league;

# 2. 데이터베이스 선택
USE baseball_league;

# 3. 테이블 생성
# >> a. 팀 테이블 생성
# : teams(team_id, name, city, founded_year)
# >> b. 선수 테이블 생성
# : players(player_id, name, position)
# position 열거형 (타자, 투수, 내야수, 외야수)
CREATE TABLE teams(
	team_id int,
    name varchar(100),
    city varchar(100),
    founded_year year
);

CREATE TABLE players(
	player_id int,
    name varchar(100),
    position enum('타자', '투수', '내야수', '외야수')
);

# 4. 각 테이블 구조 확인
DESCRIBE teams;
DESC players;

# SELECT * FROM teams;
# SELECT * FROM players;

# 5. 테이블 구조 수정
# : players테이블에 birth_date 컬럼 추가
ALTER TABLE players
ADD birth_date DATE; 

DESC players;
# SELECT * FROM players;

# 6. 테이블 삭제
# : 테이블이 존재한다면 테이블 삭제
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS players;

# 7. 데이터베이스 삭제
DROP DATABASE baseball_league;
