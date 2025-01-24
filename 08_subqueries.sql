-- 08. subqueries : 메인 쿼리 내에서 실행되는 보조 쿼리

-- '민트미역국'과 같은 카테고리인 메뉴를 조회
SELECT menu_name
	FROM tbl_menu
	WHERE menu_name='민트미역국';
	
SELECT menu_name
	FROM tbl_menu
	WHERE category_code=4;
-- 위의 질의를 하나의 질의로 변경
SELECT menu_name
	FROM tbl_menu
	WHERE category_code = (SELECT category_code
									FROM tbl_menu
									WHERE menu_name='민트미역국');
									
-- 서브쿼리가 from절에서 사용 될 경우 인라인 뷰 라고 한다.
-- from절에 서브쿼리를 사용할 경우 반드시 별칭(AS)을 작성해야 한며 서브 쿼리 내부에 함수를 사용할 경우 별칭을 통해 컬럼명으로 
-- 지칭할 수 있도록 작성해야 한다
SELECT MAX(COUNT)
	FROM(SELECT COUNT(*) AS count
		FROM tbl_menu
		GROUP BY category_code) AS countmenu;