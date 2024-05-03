--1. test_user 계정을 생성하세요.
--   (비밀번호는 자유)
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

CREATE USER test_user IDENTIFIED BY qwer1234;
--2. test_user 계정은 connect, resource, dba 권한을 갖습니다.
GRANT CONNECT, resource, dba TO test_user;

--3. 해당 계정으로 로그인 하세요.
-- 완료 --

--4-1. 아래의 조건에 만족하는 테이블을 생성하세요
-- - 테이블명 : test_customers 
-- - 컬럼1 : test_c_id (데이터타입:숫자, 기본키를 가짐)
-- - 컬럼2 : test_c_name (데이터타입:문자, 빈값을 가질 수 없음)
-- - 컬럼3 : test_c_email(데이터타입:문자, 빈값을 가질 수 없음)
-- - 컬럼4 : test_c_phone(데이터타입:문자, 빈값을 가질 수 없음)
-- - 컬럼5 : test_c_indate(데이터 타입:날짜, 기본값:sysdate, 빈값이 들어올 수 없음)
CREATE TABLE test_customers (
	test_c_id NUMBER PRIMARY KEY,
	test_c_name varchar2(50) NOT NULL,
	test_c_email varchar2(30) NOT NULL,
	test_c_phone varchar2(50) NOT NULL,
	test_c_indate DATE DEFAULT sysdate NOT NULL
);

--4-2 아래의 조건에 만족하는 테이블을 생성하세요
-- - 테이블명 : test_orders
-- - 컬럼1 : test_o_id (데이터타입:숫자, 기본키를 가짐)
-- - 컬럼2 : test_o_date (데이터 타입:날짜, 기본값:sysdate, 빈값이 들어올 수 없음)
-- - 컬럼3 : test_o_name (데이터타입:문자, 빈값이 들어올 수 없음, 유일한 값을 가짐)
-- - 컬럼4 : test_o_amount (데이터타입:숫자, 빈값이 들어올수없음)
-- - 컬럼5 : test_c_id (데이터타입: 숫자, customers 테이블의 test_c_id를 참조함)

CREATE TABLE test_orders (
	test_o_id NUMBER PRIMARY KEY,
	test_o_date DATE DEFAULT sysdate NOT NULL,
	test_o_name varchar2(50) NOT NULL,
	test_o_amount NUMBER NOT NULL,
	test_c_id NUMBER REFERENCES test_customers(test_c_id)
);

--5-1 test_customers 테이블에 코멘트를 추가하세요.
-- - test_c_id : 고객 번호
-- - test_c_name : 고객 이름
-- - test_c_email : 고객 이메일
-- - test_c_phone : 고객 핸드폰
-- - test_c_indate : 고객 가입일
COMMENT ON COLUMN test_customers.test_c_id IS '고객 번호';
COMMENT ON COLUMN test_customers.test_c_name IS '고객 이름';
COMMENT ON COLUMN test_customers.test_c_email IS '고객 이메일';
COMMENT ON COLUMN test_customers.test_c_phone IS '고객 핸드폰';
COMMENT ON COLUMN test_customers.test_c_indate IS '고객 가입일';

--5-2 test_orders 테이블에 코멘트를 추가하세요.
-- - test_o_id : 주문 번호
-- - test_o_date : 주문 날짜
-- - test_o_name : 주문 상품
-- - test_o_amount : 주문 금액
-- - test_c_id : 고객 번호
COMMENT ON COLUMN test_orders.test_o_id IS '주문 번호';
COMMENT ON COLUMN test_orders.test_o_date IS '주문 날짜';
COMMENT ON COLUMN test_orders.test_o_name IS '주문 상품';
COMMENT ON COLUMN test_orders.test_o_amount IS '주문 금액';
COMMENT ON COLUMN test_orders.test_c_id IS '고객 번호';

COMMIT;

--6-1. test_c_seq 시퀀스를 생성하세요.
-- - customers 테이블에 사용되며 시작값1, 최소값1, 최대값99999를 가지며 1씩 증가합니다.
-- - 시퀀스는 순환되지 않으며 캐시를 사용하지 않습니다
CREATE SEQUENCE test_c_seq
START WITH 1
MINVALUE 1
MAXVALUE 99999
INCREMENT BY 1
nocycle
nocache;


--6-2 test_o_seq 시퀀스를 생성하세요.
-- - orders 테이블에 사용되며 시작값1, 최소값1, 최대값99999를 가지며 1씩 증가합니다.
-- - 시퀀스는 순환되지 않으며 캐시를 사용하지 않습니다
CREATE SEQUENCE test_o_seq
START WITH 1
MINVALUE 1
MAXVALUE 99999
INCREMENT BY 1
nocycle
nocache;


--7-1. customers 테이블에 아래의 데이터를 추가하세요.
--- 이름:John, 이메일:john@gmail.com, 핸드폰번호: 123-456-7890, 가입일:현재 시간
--- 이름:Jane, 이메일:jane@gmail.com, 핸드폰번호: 987-654-3210, 가입일:현재 시간
--- 이름:Alice, 이메일:alice@gmail.com, 핸드폰번호: 555-555-5555, 가입일:현재 시간
--- 이름:Bob, 이메일:bob@gmail.com, 핸드폰번호: 111-222-3333, 가입일:현재 시간
--- 이름:Eve, 이메일:eve@gmail.com, 핸드폰번호: 444-777-8888, 가입일:현재 시간
INSERT INTO test_customers 
VALUES(test_c_seq.nextval,'John', 'john@gmail.com', '123-456-7890', DEFAULT);
INSERT INTO test_customers 
VALUES(test_c_seq.nextval,'Jane', 'jane@gmail.com', '987-654-3210', DEFAULT);
INSERT INTO test_customers 
VALUES(test_c_seq.nextval,'Alice', 'alice@gmail.com', '555-555-5555', DEFAULT);
INSERT INTO test_customers 
VALUES(test_c_seq.nextval,'Bob', 'bob@gmail.com', '111-222-3333', DEFAULT);
INSERT INTO test_customers 
VALUES(test_c_seq.nextval,'Eve', 'eve@gmail.com', '444-777-8888', DEFAULT);

--7-2. orders 테이블에 아래의 데이터를 추가하세요.
--- 날짜: 현재시간, 상품: 핸드폰, 금액: 1500000, 고객번호:3
--- 날짜: 현재시간, 상품: 데스크탑, 금액: 750000, 고객번호:2
--- 날짜: 현재시간, 상품: 마우스, 금액:70000, 고객번호:2
--- 날짜: 현재시간, 상품: 모니터, 금액: 350000, 고객번호:1
--- 날짜: 현재시간, 상품: 스피커, 금액: 130000, 고객번호:4
INSERT INTO test_orders
VALUES(test_o_seq.nextval, DEFAULT, '핸드폰', 1500000, 3);
INSERT INTO test_orders
VALUES(test_o_seq.nextval, DEFAULT, '데스크탑', 750000, 2);
INSERT INTO test_orders
VALUES(test_o_seq.nextval, DEFAULT, '마우스', 70000, 2);
INSERT INTO test_orders
VALUES(test_o_seq.nextval, DEFAULT, '모니터', 350000, 1);
INSERT INTO test_orders
VALUES(test_o_seq.nextval, DEFAULT, '스피커', 130000, 4);

COMMIT;

SELECT * FROM TEST_CUSTOMERS ;
SELECT * FROM TEST_ORDERS ;

--8. 이름이 Jane인 유저의 이메일을 test@gmail.com 으로 변경하는 쿼리를 작성하세요.
UPDATE TEST_CUSTOMERS SET TEST_C_EMAIL = 'test@gmail.com'
WHERE TEST_C_NAME = 'Jane';

COMMIT;


--9. 아래의 조건에 맞춰 데이터를 조회하세요.
--- 이름이 John인 유저의 정보 조회
SELECT * FROM TEST_CUSTOMERS tc WHERE TEST_C_NAME = 'John';
--- 이름이 e로 끝나는 유저의 정보 조회
SELECT * FROM TEST_CUSTOMERS tc WHERE TEST_C_NAME LIKE '%e';
--- 주문 금액이 200000 이상인 주문상품, 고객번호 조회
--   단, 내림차순으로 정렬되어야 합니다.
SELECT TEST_O_NAME, TEST_C_ID FROM TEST_ORDERS to2 
WHERE TEST_O_AMOUNT >= 200000
ORDER BY TEST_O_NAME DESC;
--- 이메일이 bob@gmail.com인 이름, 주문 상품, 주문 금액 조회 
SELECT TEST_C_NAME, o2.TEST_O_NAME, o2.TEST_O_AMOUNT FROM TEST_CUSTOMERS c2
JOIN TEST_ORDERS o2 ON c2.TEST_C_ID = o2.TEST_C_ID 
WHERE c2.TEST_C_EMAIL = 'bob@gmail.com';

--- 주문 금액이 가장 높은 상위 2명의 이름, 주문 금액 조회
--   단, 내림차순으로 정렬되어야 합니다.
SELECT TEST_C_NAME, o2.TEST_O_AMOUNT FROM TEST_ORDERS o2
JOIN TEST_CUSTOMERS c2 on c2.TEST_C_ID  = O2.TEST_C_ID 
ORDER BY TEST_O_AMOUNT DESC
FETCH FIRST 2 ROW ONLY;

COMMIT;

SAVEPOINT test1;

SELECT * FROM TEST_ORDERS to2 ; 

--10-1. 해당 사항을 모두 데이터베이스에 반영하고 DELETE FROM test_orders 쿼리를 실행하세요.
DELETE FROM TEST_ORDERS to2 ;

--10-2. TCL을 활용하여 test_orders 테이블에 있는 데이터를 삭제하기 전으로 되돌아가세요.
ROLLBACK TO test1;