INSERT INTO DDL_JOB VALUES(2, '이름1', 1);
INSERT INTO DDL_JOB VALUES(3, '이름2', 1);
INSERT INTO DDL_JOB VALUES(4, '이름3', 1);

SELECT * FROM DDL_JOB dj;

COMMIT;  

DELETE FROM DDL_JOB dj ;

ROLLBACK;

UPDATE DDL_JOB 
SET JOB_NAME = '롤백 테스트중'
WHERE JOB_CODE = 4;
COMMIT;


-- 직무 추가
SELECT * FROM DDL_JOB;
INSERT INTO DDL_JOB dj VALUES(5, '직무 추가', 1);



UPDATE DDL_JOB SET JOB_NAME = '직무 변경'
WHERE JOB_CODE =3;
SAVEPOINT sp2;

-- 직무 전체 삭제
DELETE FROM DDL_JOB;
SAVEPOINT sp3;

SELECT * FROM DDL_JOB;
ROLLBACK TO sp2;
SELECT * FROM DDL_JOB;



-- 실습
CREATE TABLE accounts (
	account_id NUMBER PRIMARY KEY,
	account_name VARCHAR(255),
	balance NUMBER
);

INSERT INTO accounts VALUES (1, 'Alice', 10000);
INSERT INTO accounts VALUES (2, 'Bob', 15000);
INSERT INTO accounts VALUES (3, 'Charlie', 20000);

SELECT * FROM accounts;

--1. Alice의 계좌에서 Bob이 계좌로 5000원을 이체합니다.
-- UPDATE문을 이용하여 Alice의 blance 컬럼의 값을 5000 뺍니다.
-- ex) SET balance = balance-5000
-- UPDATE문을 이용하여 Bob의 balance 컬럼의 값을 5000 더합니다.
UPDATE ACCOUNTS SET balance = balance-5000 WHERE account_id = 1;
UPDATE ACCOUNTS SET balance = balance+5000 WHERE account_id = 2;
--2. SAVEPOINT를 작성하세요.
SAVEPOINT q1;


--3. Charlie의 계좌에서 10000원을 출금하고, 그 후 ROLLBACK을 사용하여 해당 출금을
--취소합니다.
-- 세이브 포인트로 롤백하세요.
UPDATE ACCOUNTS SET balance = balance-10000 WHERE account_id = 3;
ROLLBACK TO q1;

SELECT * FROM accounts;
--4. 이후 COMMIT을 사용하여 데이터베이스에 반영하세요.
COMMIT;






