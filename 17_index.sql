-- 17. index : 데이터 검색 속도 향상

CREATE TABLE phone (
    phone_code INT PRIMARY KEY,
    phone_name VARCHAR(100),
    phone_price DECIMAL(10, 2)
);

INSERT 
  INTO phone
VALUES 
(1, 'galaxyS23', 120000),
(2, 'galaxyS24', 130000),
(3, 'galaxyS25', 140000);

SELECT * FROM phone;

-- 인덱스 없이 확인하면 using where
EXPLAIN SELECT * FROM phone WHERE phone_name='galaxyS23';

-- phone_name 컬럼에 인덱스 생성
CREATE INDEX idx_name ON phone(phone_name);

-- 인덱스 생성 후 확인 하면 Using index condition
EXPLAIN SELECT * FROM phone WHERE phone_name='galaxyS23';

-- 복합 인덱스 생성
CREATE INDEX idx_name_price ON phone(phone_name, phone_price);

-- 인덱스 조회
SHOW INDEX FROM phone;

-- 데이터베이스(스키마)에 존재하는 인덱스 조회
SELECT * FROM information_schema.statistics
	WHERE table_schema = 'menudb';
	
-- 인덱스에 해당하는 컬럼 값이 변화하면 인덱스도 변화해야 함
-- 인덱스 최적화 (재구성)
ALTER TABLE phone DROP INDEX idx_name;
ALTER TABLE phone ADD INDEX idx_name(phone_name);

OPTIMIZE TABLE phone;


