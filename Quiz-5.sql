--Q0. 실습 준비
--1. shopping_admin 계정을 생성하세요.
--2. shopping_admin 계정은 아래에 대한 권한을 추가 하세요.
-- connect, resource, dba
--3. 해당 계정으로 DBeaver에서 로그인을 하고 새로운 SQL 편집기를 활용하세요.
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER shopping_admin IDENTIFIED BY qwer1234;
GRANT CONNECT, resource, dba TO shopping_admin;

--Q1-1. 아래의 요구사항에 맞춰 테이블을 생성하세요.
--1. customers 테이블 생성
----> customer_no 컬럼은 NUMBER, 기본키를 가집니다
----> customer_name 컬럼은 이름을 작성하며 빈값이 올 수 없습니다.
--또한 적절한 데이터 타입을 설정하세요.
---> customer_gender 컬럼을 성별을 가지며 W(여자) 또는 M(남자)만을 가집니다.
--또한 적절한 데이터 타입을 설정하고, NULL을 가질 수 없습니다
---> customer_email 컬럼은 이메일을 작성하며 유일한 값을 가지며 빈값이 올 수 없습니다.
--또한 적절한 데이터 타입을 설정하세요.
---> customer_phone 컬럼은 핸드폰 번호를 작성하며 빈값이 올 수 없습니다.
--또한 적절한 데이터 타입을 설정하세요.
CREATE TABLE customers (
	customer_no NUMBER PRIMARY KEY,
	customer_name varchar2(50) NOT NULL,
	customer_gender varchar2(10) CHECK(customer_gender IN('W','M')) NOT NULL,
	customer_email varchar2(30) NOT NULL,
	customer_phone varchar2(50) NOT NULL);
--2. 각각의 컬럼에 대한 코멘트를 적용하세요.
COMMENT ON COLUMN customers.customer_no IS '고객 번호';
COMMENT ON COLUMN customers.customer_name IS '고객 이름';
COMMENT ON COLUMN customers.customer_gender IS '고객 성별';
COMMENT ON COLUMN customers.customer_email IS '고객 이메일';
COMMENT ON COLUMN customers.customer_phone IS '고객 전화번호';

COMMIT;

SELECT * FROM customers ;


--Q1-2. 아래의 요구사항에 맞춰 테이블을 생성하세요
--1. orders 테이블 생성
---> order_no 컬럼은 NUMBER, 기본키를 가집니다.
---> order_date 컬럼은 주문 날짜를 작성하며 기본값으로 SYSDATE를 갖습니다.
--또한 빈값을 가질 수 없으며 적절한 데이터 타입을 설정하세요.
---> order_name 컬럼은 주문 상품을 작성하며 빈값을 가질 수 없습니다.
--또한 적절한 데이터 타입을 설정하세요.
---> order_amount 컬럼은 주문 금액을 작성하며 빈값을 가질 수 없습니다.
--또한 적절한 데이터 타입을 설정하세요.
---> customer_no 컬럼은 customers 테이블의 customer_no 컬럼을 참조합니다.

CREATE TABLE orders (
	order_no NUMBER PRIMARY KEY,
	order_date DATE DEFAULT sysdate,
	order_name varchar2(30) NOT NULL,
	order_amount varchar2(30) NOT NULL,
	customer_no NUMBER REFERENCES customers(customer_no)
);

--ALTER TABLE STAFF MODIFY (TE_DEPARTMENT VARCHAR2(100));
----2. DEPARTMENT 컬럼의 데이터 형식을 VARCHAR2(100)으로 변경

--2. 각각의 컬럼에 대한 코멘트를 적용하세요.
COMMENT ON COLUMN orders.order_no IS '주문 번호';
COMMENT ON COLUMN orders.order_date IS '주문 날짜';
COMMENT ON COLUMN orders.order_name IS '주문 상품';
COMMENT ON COLUMN orders.order_amount IS '주문 금액';
COMMENT ON COLUMN orders.customer_no IS '고객 번호';

COMMIT;

-- Q2. 시퀀스 생성
--1. customers 시퀀스 생성
-- 해당 시퀀스는 customer_seq 이름을 가지며 1로 시작하여 1씩 증가합니다.
CREATE SEQUENCE customers_seq
START WITH 1
INCREMENT BY 1;



--2. orders 시퀀스 생성
-- 해당 시퀀스는 order_seq 이름을 가지며 1로 시작하여 1씩 증가합니다.
CREATE SEQUENCE order_seq
START WITH 1
INCREMENT BY 1;
--3. 위의 시퀀스들은 NOCACHE, NOCYCLE을 가지며 그 외 설정은 생략하여 생성하세요.


--Q3-1. customers 테이블에 아래의 데이터를 삽입하세요
--customer_no는 시퀀스를 활용해야 합니다.
--'John Doe', 'M', 'john.doe@example.com', '123-456-7890'
--'Jane Smith', 'W', 'jane.smith@example.com', '987-654-3210'
--'Bob Johnson', 'M', 'bob.johnson@example.com', '555-555-5555'
--'Alice White', 'W', 'alice.white@example.com', '777-777-7777'
--'Charlie Brown', 'M', 'charlie.brown@example.com', '999-999-9999'
--'Eva Davis', 'W', 'eva.davis@example.com', '111-111-1111'
--'Frank Lee', 'M', 'frank.lee@example.com', '222-222-2222'
--'Grace Taylor', 'W', 'grace.taylor@example.com', '333-333-3333'
--'David Clark', 'M', 'david.clark@example.com', '444-444-4444'
--'Helen Wilson', 'W', 'helen.wilson@example.com', '666-666-6666

INSERT INTO customers 
VALUES(customers_seq.nextval,'John Doe', 'M', 'john.doe@example.com', '123-456-7890');
INSERT INTO customers 
VALUES(customers_seq.nextval,'Jane Smith', 'W', 'jane.smith@example.com', '987-654-3210');
INSERT INTO customers 
VALUES(customers_seq.nextval,'Bob Johnson', 'M', 'bob.johnson@example.com', '555-555-5555');
INSERT INTO customers 
VALUES(customers_seq.nextval,'Alice White', 'W', 'alice.white@example.com', '777-777-7777');
INSERT INTO customers 
VALUES(customers_seq.nextval,'Charlie Brown', 'M', 'charlie.brown@example.com', '999-999-9999');
INSERT INTO customers 
VALUES(customers_seq.nextval,'Eva Davis', 'W', 'eva.davis@example.com', '111-111-1111');
INSERT INTO customers 
VALUES(customers_seq.nextval,'Frank Lee', 'M', 'frank.lee@example.com', '222-222-2222');
INSERT INTO customers 
VALUES(customers_seq.nextval,'Grace Taylor', 'W', 'grace.taylor@example.com', '333-333-3333');
INSERT INTO customers 
VALUES(customers_seq.nextval,'David Clark', 'M', 'david.clark@example.com', '444-444-4444');
INSERT INTO customers 
VALUES(customers_seq.nextval,'Helen Wilson', 'W', 'helen.wilson@example.com', '666-666-6666');

COMMIT;
SELECT * FROM customers;

--Q3-2. orders 테이블에 아래의 데이터를 삽입하세요
--order_no는 시퀀스를 활용해야 합니다.
--'마우스',10000, 1
--'데스크탑',15000, 2
--'스캐너',20000, 3
--'마우스패드',7500, 4
--'조이스틱',30000, 5
--'모니터',12500, 6
--'마우스패드',18000, 7
--'허브',9000, 8
--'데스크탑',22000, 9
--'데스크탑',17500, 10
INSERT INTO orders 
VALUES(order_seq.nextval,DEFAULT ,'마우스',10000, 1);
INSERT INTO orders 
VALUES(order_seq.nextval,DEFAULT ,'데스크탑',15000, 2);
INSERT INTO orders 
VALUES(order_seq.nextval,DEFAULT ,'스캐너',20000, 3);
INSERT INTO orders 
VALUES(order_seq.nextval,DEFAULT ,'마우스패드',7500, 4);
INSERT INTO orders 
VALUES(order_seq.nextval,DEFAULT ,'조이스틱',30000, 5);
INSERT INTO orders 
VALUES(order_seq.nextval,DEFAULT ,'모니터',12500, 6);
INSERT INTO orders 
VALUES(order_seq.nextval,DEFAULT ,'마우스패드',18000, 7);
INSERT INTO orders 
VALUES(order_seq.nextval,DEFAULT ,'허브',9000, 8);
INSERT INTO orders 
VALUES(order_seq.nextval,DEFAULT ,'데스크탑',22000, 9);
INSERT INTO orders 
VALUES(order_seq.nextval,DEFAULT ,'데스크탑',17500, 10);

COMMIT;

--Q4. 실습
--1. 데스크탑을 구입한 고객이 몇 명인지 조회하세요.
SELECT COUNT(*) FROM orders WHERE order_name = '데스크탑';

--2. 마우스패드를 구입한 고객의 이름을 조회하세요.
SELECT c.CUSTOMER_NAME  FROM ORDERS o 
JOIN CUSTOMERS c ON c.CUSTOMER_NO = o.CUSTOMER_NO 
WHERE order_name = '마우스패드';

--3. 주문 금액이 20000원 이상인 고객들의 이메일과 핸드폰 번호를 조회하세요.
SELECT c.CUSTOMER_NAME, c.CUSTOMER_EMAIL, c.CUSTOMER_PHONE  FROM ORDERS o 
JOIN CUSTOMERS c ON c.CUSTOMER_NO = o.CUSTOMER_NO 
WHERE order_amount >= 20000;

SELECT * FROM ORDERS o ;
--4. 가장 큰 금액의 물품을 구입한 고객의 이름과 주문 상품을 조회하세요.
SELECT * FROM ORDERS o 
JOIN CUSTOMERS c ON c.CUSTOMER_NO = o.CUSTOMER_NO;
ORDER BY order_amount DESC 
FETCH FIRST 1 ROW ONLY;

--5. 모든 주문의 합계 금액을 조회하세요.
--6. 전체 주문에 대한 평균 금액을 구하세요.
--7. 핸드폰 번호가 0으로 끝나는 고객의 이름을 조회하세요.
--8. 이름에 i가 들어가는 모든 고객의 번호와 이름을 조회하고 내림차순으로 정렬하세요








