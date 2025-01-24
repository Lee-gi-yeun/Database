-- 04. distinct : 중복 컬럼 값 제거 후 조회

SELECT category_code
	FROM tbl_menu
	ORDER BY category_code;
	
-- 메뉴 테이블에 존재하는 카테고리의 종류를 조회
SELECT 
	DISTINCT category_code
		FROM tbl_menu
		ORDER BY category_code;
		
SELECT 
	DISTINCT ref_category_code
	FROM tbl_category
	ORDER BY 1;
	
SELECT
	category_code, orderable_status
	FROM tbl_menu;

SELECT
	DISTINCT category_code, orderable_status
	FROM tbl_menu;