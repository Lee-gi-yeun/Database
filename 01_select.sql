-- 01. select : 특정 테이블에서 원하는 데이터 조회

SELECT menu_name FROM tbl_menu;

SELECT 
		menu_code
		, menu_name
		, menu_price
		, category_code
		, orderable_status
	FROM tbl_menu;

SELECT * FROM tbl_menu;

-- 단독으로 select문 사용	
-- 블록 영역 명령어 실행시 ctrl + F9
SELECT 7+3;
SELECT 7*3;
SELECT 7%3;

-- 내장함수 확인
SELECT NOW();
SELECT CONCAT('홍',' ','길동');

-- 컬럼 별칭
SELECT NOW() AS 현재시간;
SELECT CONCAT('홍',' ','길동') AS 'Full name';

