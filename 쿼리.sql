-- 00_계정 생성

-- swcamp 라는 새로운 계정 생성
CREATE USER 'swcamp'@'%' IDENTIFIED BY 'swcamp';

-- 기본적으로 존재하는 데이터베이스를 사용
USE mysql;

SELECT * FROM USER;

CREATE DATABASE menudb;
SHOW DATABASES;
-- swcamp의 권한 확인
SHOW GRANTS FOR 'swcamp'@'%';
-- swcamp가 menudb를 사용할 수 있도록 모든 권한 부여
GRANT ALL PRIVILEGES ON menudb.* TO 'swcamp'@'%';

-- menudb database 사용
USE menudb;

menudb