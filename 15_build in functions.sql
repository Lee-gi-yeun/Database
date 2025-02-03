-- 15. build in functions (내장 함수)

--  (1) 문자열 관련 함수

-- ASCII(아스키코드), CHAR(숫자)
SELECT ASCII('A'), CHAR(65);

-- bit : bit 수, char : 문자 수, length : byte 수
SELECT BIT_LENGTH('pie'), CHAR_LENGTH('pie'), LENGTH('pie');

-- 한글 값은 저장 시 3byte
SELECT BIT_LENGTH(menu_name), CHAR_LENGTH(menu_name), LENGTH(menu_name)
	FROM tbl_menu;
	
-- concat(문자열1, 문자열2)
-- concat(구분자, 문자열1, 문자열2, ...)
SELECT CONCAT('호랑이', '기린', '토끼');
SELECT CONCAT_WS(',','호랑이', '기린', '토끼');

-- 문자 탐색 시 사용 될 수 있는 함수들
SELECT 
		ELT(2, '사과', '딸기', '바나나'),				
		-- 첫번쨰 인자인 숫자 위치에 있는 문자 반환
		FIELD('딸기', '사과', '딸기', '바나나'),		 
		-- 첫번째 인자인 문자가 있는 위치의 숫자 반환
		FIND_IN_SET('바나나', '사과,딸기,바나나'),
		-- 첫번째 인자인 문자가 셋 안에서 있는 위치 숫자 반환
		INSTR('사과딸기바나나', '딸기'),
		-- 두번째 인자인 문자가 첫번쨰 인자 문자열 내부에서의 시작 위치 반환
		LOCATE('딸기', '사과딸기바나나');
		-- 첫번째 인자가 두번쨰 인자 문자열 내부에서의 시작 위치 반환 (INSTR과 인자 순서만 반대
		
-- format(숫자, 소수점 자리수)
SELECT FORMAT(123123123123.567567, 3);

-- bin : 2진수, oct : 8진수, hex : 16진수
SELECT BIN(65), OCT(65), HEX(65);

-- insert 
SELECT INSERT('내 이름은 아무개입니다.', 7, 3, '홍길동');

-- left, right 
SELECT LEFT('Hello world!', 3), RIGHT('Hello world!', 3);

-- upper, lower : 대문자 소문자 변경
SELECT UPPER('Hello world!'), LOWER('Hello world!');

-- lpad, rpad : 자릿수 맞추기
SELECT LPAD('왼쪽', 6, '@'), RPAD('오른쪽', 6, '@');

-- ltrim, rtrim : 공백 제거
SELECT LTRIM('  왼쪽  '),RTRIM('  오른쪽  ');

-- trim
-- both, leading, trailing : 공백 제거 leading : 왼쪽 공백 제거, trailing : 오른쪽 공백 제거
SELECT TRIM('   mariadb   '), TRIM(BOTH '@' FROM '@@@mariadb@@@');