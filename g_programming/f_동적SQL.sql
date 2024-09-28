### 동적 SQL ###
# : 상황에 따라 내용 변경이 필요한 경우 사용하는 기능

# prepare & execute
# prepare : SQL문을 실행하지 않고 미리 준비
# execute : 준비한 SQL문을 실행
# +) deallocate prepare: 문장을 해제 - 메모리를 효율적으로 사용

use market_db;

# prepare 쿼리문명 
# from '쿼리문 내용';

-- from 뒤의 SQL쿼리문은 문자열로 작성
-- : 작은 따옴표 사용을 권장
-- : 쿼리문 내의 문자열 데이터 사용 시 쌍따옴표를 권장

prepare myQuery
	from '
		select * from member
        where
			mem_id = "BLK";
        ';
        
execute myQuery;
deallocate prepare myQuery;
    
# execute myQuery; : 메모리의 할당을 해제 Error

# 동적 SQL문의 활용
# : 보안이 필요한 출입문에서 출입한 내역을 자동으로 기록 
# > 어떠한 DB 변동사항에 대해 반응하는 동작을 정의

drop table if exists gate_table;
create table gete_table(
	id int auto_increment primary key,
    entry_time datetime
); 

# current_timestamp: now()와 동일
set @curDate = current_timestamp();

prepare myQuery
	from 'insert into gate_table values(null, ?)';
# ?의 경우 SQL문에서 사용하는 파라미터
# : 플레이스 홀더, 실제 사용 시 using 키워드를 사용하여 해당 값을 전달

execute myQuery using @curDate;
# deallocate prepare myQuery;

select * from gate_table;
    