-- 06.join : 두 개 이상의 테이블을 관련 있는 컬럼을 통해 결합
USE menudb;

SELECT * FROM tbl_menu;
SELECT * FROM tbl_category;

-- 조인의 종류
-- 1. inner join : 두 테이블의 교집합을 반환
-- (1) on : join할 테이블의 컬럼명이 동일하거나 동일하지 않거나 사용 가능
SELECT menu_name, category_name
	FROM tbl_menu a
	JOIN tbl_category b ON a.category_code = b.category_code;

-- (2) using : join할 테이블의 컬럼명이 동일한 경우만 사용 가능
SELECT menu_name, category_name
	FROM tbl_menu
	JOIN tbl_category USING (category_code);
	
-- employee와 department join
SELECT
	a.emp_name, b.dept_title
	FROM employee a
	JOIN department b
	ON a.dept_code = b.dept_id;
-- inner join은 교집합만 반환하므로 위의 예시에서는 dept_code가 null인 사원은 result set에 포함되지 않는다 -> outer join 활용

-- 2. left [outer] join
-- : 왼쪽 테이블의 모든 레코드와 오른쪽 테이블에서 일치하는 레코드를 반환
SELECT
	a.emp_name, b.dept_title
	FROM employee a
	LEFT JOIN department b
	ON a.dept_code = b.dept_id;

-- 3. right [outer] join
-- : 오른쪽 테이블의 모든 레코드와 왼쪽 테이블에서 일치하는 레코드를 반환
SELECT
	a.emp_name, b.dept_title
	FROM employee a
	RIGHT JOIN department b
	ON a.dept_code = b.dept_id;

-- 4. cross join : 두 테이블의 가능한 모든 조합을 반환하는 조인
SELECT 
	a.menu_name,b.category_name
		FROM tbl_menu a
		CROSS JOIN tbl_category b;
		
-- 5. self join : 같은 데이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 유형의 조인
SELECT  a.category_name 하위분류
		, b.category_name 상위분류
	FROM tbl_category a
	JOIN tbl_category b ON a. ref_category_code= b.category_code;
	
	
	SELECT * FROM employee;
	
SELECT a.EMP_NAME 관리자명
		,b.EMP_NAME 사원
	FROM employee a
	RIGHT JOIN employee b ON a.EMP_ID = b.MANAGER_ID;
	
-- employeedb 에서 다중 테이블join 사원명, 부서명, 직급명 조회
SELECT emp_name 
	, dept_title 
	, job_name 
	FROM employee a
	LEFT JOIN department b ON a.dept_code = b.dept_id
	JOIN job c ON a.JOB_CODE = c.JOB_CODE;
	
-- 사원명, 근무 지역명, 근무 국가명 조회
SELECT emp_name, local_name, national_name
	FROM employee a
	LEFT JOIN department b ON a.dept_code = b.dept_id
	LEFT JOIN location c ON b.location_id = c.local_code
	LEFT JOIN national d ON c.national_code = d.national_code;
	
	