### b_트리거02 ###

# 트리거 예제 #

use market_db;

# singer 테이블: member 테이블에서 데이터를 가져옴
create table singer (
	select 
		mem_id, mem_name, mem_number, addr 
    from 
		`member`
);

-- 백업 테이블
-- : 변동 사항을 기록할 테이블
create table backup_singer (
	mem_id char(8) not null,
    mem_name varchar(10) not null,
    mem_number int not null,
    addr char(2) not null,
    
    modType char(2), -- 변경된 타입 (수정 | 삭제)
    modDate date, -- 변경된 날짜
    modUser varchar(30) -- 변경한 사용자
);

# 변경(update)가 발생했을 때 작동하는 트리거
drop trigger if exists singer_updateTrg;

delimiter $$
create trigger singer_updateTrg -- 트리거명
	after update -- 변경 후에 작동하도록 지정
	on singer -- 트리거를 부착할 테이블
	for each row 
begin
	insert into backup_singer
    values 
		(OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr
			, '수정', curdate(), current_user()
        );
end $$
delimiter ;

# OLD 테이블
# : update나 delete가 수행될 때
# : 변경되기 전의 데이터가 잠깐 저장되는 임시 테이블

# curdate(): 현재 날짜
# current_user(): 현재 작업 중인 사용자
select current_user();

select * from singer;

update singer 
set addr = '미국' 
where 
	mem_id = 'BLK';
    
update singer
set mem_number = 6
where
	mem_id = 'BLK';
    
select * from backup_singer;

# 삭제가 발생했을 때 작동하는 트리거
# singer_deleteTrg
drop trigger if exists singer_deleteTrg;

delimiter $$
create trigger singer_deleteTrg
	after delete
    on singer
    for each row
begin
	insert into backup_singer
		values 
			(OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr
			, '삭제', curdate(), current_user()
			);
end$$
delimiter ;

delete from singer 
where mem_number >= 7;

select * from backup_singer;
    
    
    
    
    
    
    
    