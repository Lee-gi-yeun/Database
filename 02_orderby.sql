-- 02. orderby : result set을 정렬

SELECT menu_code, menu_name, menu_price FROM tbl_menu ORDER BY menu_price DESC, menu_code;
-- order by menu_price ASC;  asc는 오름차순 

-- order by 절 뒤에 컬럼 명 외에 연산 결과, 별칭 등을 사용할 수 없음
SELECT menu_code, menu_name, menu_price * menu_code FROM tbl_menu ORDER BY menu_price * menu_code;

SELECT menu_code '메뉴코드'
	, menu_name '메뉴명'
	, menu_price * menu_code '연산결과'
	FROM tbl_menu ORDER BY 연산결과;
	

-- field 함수 : 첫번재 인자가 그 뒤에 3개 중 몇번째에 있는지
SELECT FIELD('A','A','B','C');
SELECT FIELD('B','A','B','C');
SELECT FIELD('C','A','B','C');

-- field 함수를 활용하면 정렬 데이터 기준을 설정할 수 있음
SELECT
		  menu_name
		, orderable_status
		, FIELD(orderable_status,'Y','N')
	FROM tbl_menu
ORDER BY FIELD(orderable_status,'Y','N');


-- null 값의 정렬 방식
SELECT category_code, category_name, ref_category_code
	FROM tbl_category
--	ORDER BY ref_category_code;/
-- ORDER BY ref_category_code DESC;
-- ORDER BY -ref_category_code DESC;
ORDER BY -ref_category_code;

