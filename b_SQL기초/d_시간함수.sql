### now(), sysdate(), current_timestamp();

SELECT NOW()
	,SYSDATE()
    ,CURRENT_TIMESTAMP;

# NOW(): 서버의 시간을 가져오는 함수 
# SYSDATE(): 호출되는 시점을 반환
# CURRENT_TIMESTAMP: NOW()와 동일

# 차이점 
-- NOW(), CURRENT_TIMESTAMP
-- : 실행되는 시점에서 시간이 반환

-- SYSDATE()
-- : 호출되는 시점의 시간이 반환

SELECT NOW()
	, SYSDATE()
	,CURRENT_TIMESTAMP
    ,SLEEP(5) -- 시간을 지연키니는 함수 (5초)
	,NOW()
	, SYSDATE() -- 값이 호출되는 시점이 반환! (혼자 다름)
	,CURRENT_TIMESTAMP; 
    