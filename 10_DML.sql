-- 10.DML(Data Manipulation Language)
-- : 데이터 조작 언어. 테이블에 값을 삽입하거나 수정하거나 삭제한다

-- insert, update, delete

-- (1) insert : 새로운 행을 추가
INSERT 
	INTO tbl_menu
VALUES (NULL, '바나나해장국',8500,4,'Y');

SELECT * FROM tbl_menu;