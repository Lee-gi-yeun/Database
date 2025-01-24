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