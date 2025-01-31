-- set operators : 두개 이상의 select문의 결과 집합을 결합
-- union, union all, intersect, minus

-- 1.union
-- 두 개 이상의 select문의 결과를 결합하여 중복 레코드 제거 후 반환
SELECT menu_code, menu_name, menu_price, category_code, orderable_status
	FROM tbl_menu
	WHERE category_code=10
		UNION
SELECT menu_code, menu_name, menu_price, category_code, orderable_status
	FROM tbl_menu
	WHERE menu_price<9000;
	
-- 2.union all
-- 두 개 이상의 select 문의 결과를 결합하여 중복 레코드 제거하지 않고 반환
SELECT menu_code, menu_name, menu_price, category_code, orderable_status
	FROM tbl_menu
	WHERE category_code=10
		UNION ALL
SELECT menu_code, menu_name, menu_price, category_code, orderable_status
	FROM tbl_menu
	WHERE menu_price<9000;
	
-- 3.intersect : 두 select의 결과 중 공통되는 레코드만 반환
-- mysql, mariadb에서는 제공하지 않는 연산자로 inner join 또는 in 연산자로 구현 가능하다

-- (1) inner join
SELECT a.menu_code, a.menu_name, a.menu_price, a.category_code, a.orderable_status
	FROM tbl_menu a
	JOIN (SELECT menu_code, menu_name, menu_price, category_code, orderable_status
				FROM tbl_menu 
				WHERE menu_price<9000) b ON (a.menu_code = b.menu_code)
	WHERE a.category_code=10;
	
-- (2) in 연산자
SELECT a.menu_code, a.menu_name, a.menu_price, a.category_code, a.orderable_status
	FROM tbl_menu a
	WHERE a.category_code=10
	AND a.menu_code IN (SELECT menu_code
								FROM tbl_menu
								WHERE menu_price<9000);
								
-- 4. minus : 첫 번째 select 문의 결과에서 두 번째 select문의 결과가 포함하는 레코드를 제외한 레코드를 반환
-- mysql, mariadb에서는 제공하지 않는 연산자로 left join을 통해 구현 가능하다
SELECT a.menu_code, a.menu_name, a.menu_price, a.category_code, a.orderable_status
	FROM tbl_menu a
	LEFT JOIN (SELECT menu_code, menu_name, menu_price, category_code, orderable_status
				FROM tbl_menu 
				WHERE menu_price<9000) b ON (a.menu_code = b.menu_code)
	WHERE a.category_code=10
		AND b.menu_code IS NULL;


-- 13. 차장(J4) 이상 직급을 가진 직원과 사원(J7) 직급을 가진 
-- 직원들의 급여 합계를 비교하여 결과를 출력하시오. (SET OPERATOR 사용) (2행)
SELECT 
       '차장 이상' AS 구분, 
       SUM(a.salary) AS 급여합계
  FROM employee a
  WHERE a.job_code IN ('J1', 'J2', 'J3', 'J4')
UNION ALL
SELECT 
       '사원' AS 구분, 
       SUM(a.salary) AS 급여합계
  FROM employee a
  WHERE a.job_code = 'J7';
  
