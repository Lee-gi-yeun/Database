-- 11. transaction
-- : 데이터베이스에서 한 번에 수행 되는 작업의 단위

-- 기본적으로 commit이 자동으로 수행되도록 설정 되어 있으므로 변경한 뒤 테스트 한다.
SET autocommit = 1;		-- autocommit활성화
SET autocommit = ON;		-- autocommit활성화
SET autocommit = 0;		-- autocommit 비활성화
SET autocommit = OFF;	-- autocommit 비 활성화

START TRANSACTION;

SELECT * FROM tbl_menu;

INSERT INTO tbl_menu VALUES (NULL, '바나나해장국',8500,4,'Y');
UPDATE tbl_menu SET menu_name ='수정된 이름' WHERE menu_code=5;

-- 현재 tracsaction을 rollback
ROLLBACK;

-- 현재 transaction을 commit
COMMIT;
-- commit 이후 rollback 수행하면 마지막 commit 시점으로 돌아감