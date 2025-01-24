-- 03. where : 특정 조건에 맞는 레코드만 선택

-- 1. 비교 연산자
SELECT menu_code, menu_name
	FROM tbl_menu
-- 	WHERE orderable_status ='Y';
-- 	WHERE orderable_status !='Y';
-- 값이 일치하지 않는지 확인(!=, <>)
		WHERE orderable_status <'Y';
			

SELECT menu_name, menu_price
	FROM tbl_menu
		WHERE menu_price>= 13000;

-- 2.논리 연산자
-- a and b : a와 b 모두 만족할 경우 true
-- 주문 가능하며 category_code가 10에 해당하는 메뉴
SELECT * FROM tbl_menu
	WHERE orderable_status = 'Y'
	AND category_code = 10;
-- a or b : a또는 b 하나만 만족해도 true
-- 주문 가능 하거나 category_code가 10에 해당하는 경우
SELECT * FROM tbl_menu
	WHERE orderable_status = 'Y'
	OR category_code = 10;
	
-- and 와 or 중 and가 우선순위가 더 높음
SELECT * FROM tbl_menu
	WHERE category_code=4
	OR menu_price = 9000
	AND menu_code >10;
	
SELECT * FROM tbl_menu
	WHERE (category_code=4
	OR menu_price = 9000)
	AND menu_code >10;

-- 3. between and 연산자
SELECT * FROM tbl_menu
	WHERE menu_price >= 10000
	AND menu_price <= 25000
	ORDER BY menu_price;
	
SELECT * FROM tbl_menu
--	WHERE menu_price >= 10000
--	AND menu_price <= 25000
	WHERE menu_price BETWEEN 10000 AND 25000
	ORDER BY menu_price;
	
SELECT * FROM tbl_menu
--	WHERE menu_price >= 10000
--	AND menu_price <= 25000
	WHERE menu_price NOT BETWEEN 10000 AND 25000
	ORDER BY menu_price;
	
-- 4. like 연산자
SELECT * FROM tbl_menu
	WHERE menu_name LIKE '%마늘%'; -- 해당 키워드 포함
	
SELECT * FROM tbl_menu
	WHERE menu_name LIKE '%아메리카노'; -- 해당 키워드로 끝나야함

SELECT * FROM tbl_menu
	WHERE menu_name LIKE '흑%'; -- 해당 키워드 시작	

SELECT * FROM tbl_menu
	WHERE menu_name LIKE '_마늘%'; -- '_'는 자리 차지
	
-- '_' 나 '%'와 같은 기호를 실제로 검색하고 싶을 경우
--  LIKE '%\_%' 또는 
--  LIKE '%!_%' ESCAPE '!'와 같은 방식으로 ESCAPE 함

-- NOT 연산자와 조합
SELECT * FROM tbl_menu
	WHERE menu_name NOT LIKE '%마늘%'; -- 해당 키워드 제외
	
-- 메뉴 가격이 5000원 이고 카테고리 코드가 10 이며 메뉴 이름에 갈치가 들어가는 메뉴의 모든 컬럼 값 조회
SELECT * FROM tbl_menu
	WHERE menu_price>5000 AND category_code = 10 AND menu_name LIKE '%갈치%';