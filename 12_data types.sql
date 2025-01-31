-- 12. data types

-- (1) 명시적 형변환
SELECT AVG(menu_price) FROM tbl_menu;
-- ANSI 표준 : cast
SELECT CAST(AVG(menu_price) AS SIGNED INTEGER) 
AS '평균 메뉴 가격' FROM tbl_menu;
-- mysql, mariadb : convert 제공
SELECT CONVERT(AVG(menu_price), SIGNED INTEGER) 
AS '평균 메뉴 가격' FROM tbl_menu;


SELECT CAST('2023$5$30' AS DATE);
SELECT CAST('2023/5/30' AS DATE);
SELECT CAST('2023%5%30' AS DATE);
SELECT CAST('2023@5@30' AS DATE);

SELECT CONVERT('2023$5$30', DATE);
SELECT CAST('2023/5/30' AS DATE);
SELECT CAST('2023%5%30' AS DATE);
SELECT CAST('2023@5@30' AS DATE);

-- 메뉴 가격 구하기
SELECT CAST(menu_price AS CHAR(5)) FROM tbl_menu;
SELECT CONCAT(CAST(menu_price AS CHAR(5)), '원') FROM tbl_menu;

-- 카테고리별 메뉴 가격합계 구하기
SELECT category_code, CONCAT(CAST(SUM(menu_price) AS CHAR(10)), '원') FROM tbl_menu GROUP BY category_code;