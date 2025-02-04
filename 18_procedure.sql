-- 18. procedure (프로시저)

-- (1) 매개변수 없는 간단한 예제

DELIMITER //

CREATE PROCEDURE getAllEmployee()
BEGIN
		SELECT emp_id, emp_name, salary
			FROM employee;
END //

DELIMITER ;

-- 프로시저 호출
CALL getAllEmployee();

-- (2) in 매개변수 : 호츨 시 전달 된 값을 사용
-- 특정 부서의 직원 정보 조회프로시저

-- 프로시저 생성
DELIMITER //

CREATE PROCEDURE getEmployeesByDepartment(IN dept CHAR(2))
BEGIN
		SELECT emp_id, emp_name, salary
			FROM employee
			WHERE dept_code = dept;
END //

DELIMITER ;

-- 프로시저 호출
CALL getEmployeesByDepartment('D9');
CALL getEmployeesByDepartment('D5');


-- (3) out 매개변수 : 결과 값을 호출한 곳을 ㅗ반환
-- 특정 직원의 급여를 반환하는 프로시저

-- 프로시저 생성
DELIMITER //
CREATE PROCEDURE getEmployeeSalary(IN id VARCHAR(3),OUT sal DECIMAL(10,2))
BEGIN
		SELECT salary INTO sal
			FROM employee
			WHERE emp_id=id;
END //
DELIMITER ;

-- 프로시저 호출
-- '@' : 사용자 변수 선언
SET @sal = 0;
CALL getEmployeeSalary('201',@sal);
SELECT @sal;


-- (4) inout 매개변수 
-- 특정 직원의 급여를 증가시키고 증가된 급여(보너스 포함) 반환

-- 프로시저 생성
DELIMITER //
CREATE PROCEDURE updateAndReturnSalary(IN id VARCHAR(3),INOUT sal DECIMAL(10,2))
BEGIN
		UPDATE employee
			SET salary = sal
			WHERE emp_id = id;
			
		SELECT salary + (salary * IFNULL(bonus,0)) INTO sal
			FROM employee
			WHERE emp_id=id;
END //
DELIMITER ;

-- 프로시저 호출
-- '@' : 사용자 변수 선언
SET @new_sal = 9000000;
CALL updateAndReturnSalary('200',@new_sal);
SELECT @new_sal;


-- (5) if else 활용 
-- 특정 직원의 급여가 특정 값 보다 높은지 여부를 확인

-- 프로시저 생성
DELIMITER //
CREATE PROCEDURE checkEmployeeSalary(IN id VARCHAR(3),IN threshold DECIMAL(10,2),OUT result VARCHAR(50))
BEGIN
		-- 내부에서 사용할 별도의 변수 선언
		DECLARE sal DECIMAL(10,2);
		
		SELECT salary INTO sal
			FROM employee
			WHERE emp_id = id;
			
			if sal > threshold then
				SET result = '기준치를 넘는 급여입니다.';
			Else
				SET result = '기준치와 같거나 기준치 이하의 급여입니다.';
			END if;
END //
DELIMITER ;

-- 프로시저 호출
-- '@' : 사용자 변수 선언
SET @result = '';
CALL checkEmployeeSalary('200', 10000000, @result);
SELECT @result;


-- (6) case 활용 
-- 특정 직원의 부서에 따른 메세지 확인

-- 프로시저 생성
DELIMITER //
CREATE PROCEDURE getDepartmentMessage(IN id VARCHAR(3), OUT message VARCHAR(50))
BEGIN
		-- 내부에서 사용할 별도의 변수 선언
		DECLARE dept VARCHAR(50);
		
		SELECT dept_code INTO dept
			FROM employee
			WHERE emp_id = id;
			
		CASE
			WHEN dept = 'D1' THEN
				SET message = '인사 관리부 직원이시군요.';
			WHEN dept = 'D2' THEN
				SET message = '회계 관리부 직원이시군요.';
			WHEN dept = 'D3' THEN
				SET message = '마케팅부 직원이시군요.';
			ELSE
				SET message = '어떤 부서 직원인지 모르겠어요.';
		END CASE;
END //
DELIMITER ;

-- 프로시저 호출
-- '@' : 사용자 변수 선언
SET @message = '';
CALL getDepartmentMessage('221', @message);
SELECT @message;


-- (7) while 활용 

-- 프로시저 생성
DELIMITER //
CREATE PROCEDURE calculateSumUpTo(IN max_num INT, OUT sum_result INT)
BEGIN
		-- 내부에서 사용할 별도의 변수 선언
		DECLARE current_num INT DEFAULT 1;
		DECLARE total_sum INT DEFAULT 0;
		
		while current_num <= max_num DO
			SET total_sum = total_sum + current_num;
			SET current_num = current_num +1;
		END while;
		
		SET sum_result = total_sum;
END //
DELIMITER ;

-- 프로시저 호출
-- '@' : 사용자 변수 선언
SET @sum_result = 0;
CALL calculateSumUpTo(10,@sum_result);
SELECT @sum_result;

