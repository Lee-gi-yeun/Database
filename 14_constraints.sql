-- 14. constraints (제약조건)
-- : 테이블에 데이터가 입력 되거나 수정 될 때의 규칙
-- 데이터베이스 무결성 보장

-- (1) not null : null 값을 허용하지 않음
CREATE TABLE if NOT EXISTS user_notnull( user_no INT NOT NULL, 	-- 컬럼 레벨의 제약조건
user_id VARCHAR(255) NOT NULL, user_pwd VARCHAR(255) NOT NULL, 
user_name VARCHAR(255) NOT NULL, gender VARCHAR(3), phone VARCHAR(255) NOT NULL, email VARCHAR(255));

-- insert 테스트 (정상 수행)
INSERT INTO user_notnull
	VALUES (1,'user01', 'pass01', '홍길동', '남', '010-1111-1111','h@gmail.com');
-- insert 테스트 (not null 제약 조건)
INSERT INTO user_notnull
	VALUES (null,'user01', 'pass01', '홍길동', '남', '010-1111-1111','h@gmail.com');
	
	
-- (2) unique : 중복값 허가하지 않음
CREATE TABLE if NOT EXISTS user_unique( user_no INT NOT NULL UNIQUE,
user_id VARCHAR(255) NOT NULL, user_pwd VARCHAR(255) NOT NULL, 
user_name VARCHAR(255) NOT NULL, gender VARCHAR(3), phone VARCHAR(255) NOT NULL, email VARCHAR(255));

-- insert 테스트 (정상 수행)
INSERT INTO user_unique
	VALUES (1,'user01', 'pass01', '홍길동', '남', '010-1111-1111','h@gmail.com');
-- insert 테스트 (not null 제약 조건)
INSERT INTO user_unique
	VALUES (1,'user01', 'pass01', '홍길동', '남', '010-1111-1111','h@gmail.com');


-- (3) primary key : 테이블의 식별자 역할(한 행을 구분)
-- not null + unique
-- 한 테이블 당 하나만 설정 가능
CREATE TABLE if NOT EXISTS user_primarykey( user_no INT, 
user_id VARCHAR(255) NOT NULL, user_pwd VARCHAR(255) NOT NULL, 
user_name VARCHAR(255) NOT NULL, gender VARCHAR(3), phone VARCHAR(255) NOT NULL, email VARCHAR(255),
PRIMARY KEY(user_no));	--테이블 레벨에 제약 조건 작성

-- insert 테스트 (정상 수행)
INSERT INTO user_primarykey
	VALUES (1,'user01', 'pass01', '홍길동', '남', '010-1111-1111','h@gmail.com');
-- insert 테스트 (pk 제약조건)
INSERT INTO user_primarykey
	VALUES (NULL,'user01', 'pass01', '홍길동', '남', '010-1111-1111','h@gmail.com');
	

-- (4) foreign key : 참조 제약 조건(참조 무결성 위배하지 않도록)

-- 참조 대상 테이블
CREATE TABLE if NOT EXISTS user_grade(grade_code INT UNIQUE, grade_name VARCHAR(255) NOT NULL);

INSERT INTO user_grade VALUES (10, '일반회원'),(20, '우수회원'),(30, '특별회원');

SELECT * FROM user_grade;

-- fk 적용 테이블
CREATE TABLE if NOT EXISTS user_foreignkey( user_no INT, 
user_id VARCHAR(255) NOT NULL, user_pwd VARCHAR(255) NOT NULL, 
user_name VARCHAR(255) NOT NULL, gender VARCHAR(3), phone VARCHAR(255) NOT NULL, email VARCHAR(255),
grade_code INT, PRIMARY KEY(user_no), FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code));

-- insert 테스트 (정상 수행)
INSERT INTO user_foreignkey
	VALUES (1,'user01', 'pass01', '홍길동', '남', '010-1111-1111','h@gmail.com',20);
-- insert 테스트 (fk 제약 조건) null 값은 입력 가능함
INSERT INTO user_foreignkey
	VALUES (2,'user01', 'pass01', '홍길동', '남', '010-1111-1111','h@gmail.com',NULL);

-- 부모 테이블에서 참조 되고 있는 행을 delete
-- 현재 삭제룰이 삭제 불가로 되어 있어서 삭제할 수 없음
DELETE FROM user_grade WHERE grade_code=20;

-- fk 테이블(삭제룰 변경)
CREATE TABLE if NOT EXISTS user_foreignkey2( user_no INT, 
user_id VARCHAR(255) NOT NULL, user_pwd VARCHAR(255) NOT NULL, 
user_name VARCHAR(255) NOT NULL, gender VARCHAR(3), phone VARCHAR(255) NOT NULL, email VARCHAR(255),
grade_code INT, PRIMARY KEY(user_no), FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code) 
-- 삭제룰 생략 시 삭제 불가
	ON UPDATE SET NULL ON DELETE SET NULL);	
   -- : 수정 및 삭제 시 null 값으로 변경
	-- on update set cascade on delete set cascade
	-- : 수정 및 삭제 시 함께 삭제

-- insert 테스트 (정상 수행)
SHOW TABLES;
INSERT INTO user_foreignkey2
	VALUES (1,'user01', 'pass01', '홍길동', '남', '010-1111-1111','h@gmail.com',20);
-- insert 테스트 (fk 제약 조건) null 값은 입력 가능함
INSERT INTO user_foreignkey2
	VALUES (5,'user01', 'pass01', '홍길동', '남', '010-1111-1111','h@gmail.com',40);
INSERT INTO user_foreignkey2
	VALUES (4,'user01', 'pass01', '홍길동', '남', '010-1111-1111','h@gmail.com',null);
	
	SELECT * FROM user_foreignkey2;
	
-- (5) check 제약 조건
CREATE TABLE if NOT EXISTS user_check(user_no INT AUTO_INCREMENT PRIMARY KEY, user_name VARCHAR(255) NOT NULL, 
gender VARCHAR(3) CHECK (gender IN('남','여')), age INT CHECK(age >=19));

-- insert 테스트(정상 수행)
INSERT INTO user_check 
	VALUES (null,'홍길동','남',20);
-- insert 테스트(check 제약조건 위반)
INSERT INTO user_check 
	VALUES (null,'홍길동','남자',16);
	

-- (6) default : 컬럼에 null 값 대신 기본 값 적용 가능
CREATE TABLE if NOT EXISTS tbl_country(country_code INT AUTO_INCREMENT PRIMARY KEY, country_name VARCHAR(255) DEFAULT '한국',
population VARCHAR(255) DEFAULT '0명', add_day DATE DEFAULT (CURRENT_DATE), add_time DATETIME DEFAULT (CURRENT_TIME));

INSERT INTO tbl_country
	VALUES (NULL,DEFAULT,DEFAULT,DEFAULT,DEFAULT);

SELECT * FROM tbl_country;
	