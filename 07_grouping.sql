-- 07. grouping 

-- groupby : 결과 집합을 특정 열의 값에 따라 그룹화
-- having : groupby절과 함께 사용하며 그룹의 조건을 적용

-- 그룹함수 : count, sum, avg, min, max
SELECT category_code 
	 	, COUNT(*)
	FROM tbl_menu
	GROUP BY category_code;
	
-- count 함수의 특성
SELECT COUNT(*),	-- * 모든행
		 COUNT(category_code),	-- 컬럼명 기재 시 값이 있는 행만 카운트
		 COUNT(ref_category_code)	-- null 값은 카운트 하지 않음
	FROM tbl_category;
	
-- sum : 숫자 합계 계산
SELECT category_code 
	 	, SUM(menu_price)
	FROM tbl_menu
	GROUP BY category_code;
	
-- avg : 숫자 평균 계산
SELECT category_code 
	 	, AVG(menu_price)
	FROM tbl_menu
	GROUP BY category_code;
	
-- min, max는 모든 데이터 타입을 대상으로 사용 가능
SELECT 
	MIN(emp_name),
	MAX(emp_name),
	MIN(hire_date),
	MAX(hire_date)
		FROM employee;
		
-- group by에서 2개 이상의 그룹생성
SELECT 
	menu_price,
	category_code,
	COUNT(*)
	FROM tbl_menu
	GROUP BY menu_price, category_code;
	
-- 카테고리별로 메뉴 가격 평균이 10000원 이상인 카테고리의 카테고리 코드, 카테고리명, 평균 메뉴 가격 조회
SELECT a.category_code, b.category_name, AVG(a.menu_price)
		FROM  tbl_menu a
		JOIN tbl_category b ON a.category_code = b.category_code
		GROUP BY a.category_code, b.category_name
		HAVING AVG(a.menu_price) > 10000;
		
-- 앞 숫자는 내부 실행 순서, 작성 순서가 문법적 작성 순서
-- 6 select : 조회 컬럼
-- 1 from : 조회 대상 테이블
-- 2 join : 조회 대상 테이블
-- 3 where : 테이블 행을 조건으로 필터링
-- 4 group by : 대상 컬럼으로 결과 집합 그룹핑
-- 5 having : 그룹핑 결과를 조건으로 필터링
-- 7 order by : 정렬 기준

-- rollup : 중간 집계 함수로 group by와 함께 사용
-- group by 절의 첫 번째 기준에 대한 중간 집계 + 총 집계 값이 result set에 포함된다.
SELECT category_code, SUM(menu_price)
	FROM tbl_menu
	GROUP BY category_code
	WITH ROLLUP;
	
SELECT menu_price, category_code, SUM(menu_price)
	FROM tbl_menu
	GROUP BY menu_price, category_code
	WITH ROLLUP;
