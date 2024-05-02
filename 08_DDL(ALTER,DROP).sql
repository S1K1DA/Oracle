CREATE TABLE ddl_alter (
	alter_id varchar2(255) PRIMARY KEY,
	alter_name VARchar2(255), 
	alter_as varchar2(255)
);

-- 테이블 이름 변경
ALTER TABLE ddl_alter RENAME TO ddl_arter_test;


-- 테이블 구조 변경
ALTER TABLE ddl_arter_test MODIFY (
	alter_name varchar(30) NOT NULL,
	alter_as varchar(30) NOT NULL
);

-- 테이블 컬럼 이름 변경
ALTER TABLE DDL_ARTER_TEST RENAME COLUMN  alter_name TO alter_name_test;
SELECT * FROM DDL_ARTER_TEST ;

ALTER TABLE ddl_arter_test DROP COLUMN alter_name_test;
SELECT * FROM DDL_ARTER_TEST dat ;

ALTER TABLE DDL_ARTER_TEST ADD(
	alter_name varchar2(3) NOT NULL
);
SELECT * FROM DDL_ARTER_TEST dat ;

-- 컬럼에 제약조건 추가
ALTER TABLE DDL_ARTER_TEST ADD CONSTRAINT alter_name_unique unique(alter_name);


ALTER TABLE DDL_ARTER_TEST DROP CONSTRAINT alter_name_unique;

CREATE TABLE test_employees (
   te_id NUMBER PRIMARY KEY,
   te_first_name varchar2(50),
   te_last_name varchar2(50),
   te_salary NUMBER,
   te_department varchar2(50)
);

SELECT * FROM Staff;

--1. Employees 테이블의 이름을 "Staff"로 변경
ALTER TABLE test_employees RENAME TO Staff;

--2. Department 컬럼의 데이터 형식을 VARCHAR2(100)으로 변경
ALTER TABLE staff MODIFY (
	te_department varchar2(100)
);

--3. LastName 컬럼의 이름을 "Surname"으로 변경
ALTER TABLE staff RENAME COLUMN te_last_name TO surname; 

--4. FirstName 컬럼 삭제
ALTER TABLE staff DROP COLUMN te_first_name;

--5. HireDate라는 DATE 데이터 형식의 새로운 컬럼을 추가
ALTER TABLE staff ADD (
	hiredate DATE 
);

--6. SalaryCheck 라는 이름을 가진 UNIQUE 제약 조건을 추가
-- 이 제약 조건은 "Salary" 컬럼에 적용
ALTER TABLE staff ADD CONSTRAINT salarycheck unique(te_salary);

--7. 아래 쿼리를 이용하여 PRIMARY KEY 제약조건의 이름을 확인하고 PK_EMPLOYEE로 변경
SELECT CONSTRAINT_NAME, COLUMN_NAME FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'STAFF';

ALTER TABLE STAFF RENAME CONSTRAINT SYS_C008436 TO PK_EMPLOYEE;


CREATE TABLE PARENT_TB (
PARENT_ID NUMBER PRIMARY KEY,
PARENT_NAME VARCHAR2(50)
);

CREATE TABLE CHILD_TB (
CHILD_ID NUMBER PRIMARY KEY,
CHILD_NAME VARCHAR2(50),
PARENT_ID NUMBER,
CONSTRAINT FK_PARENT FOREIGN KEY (PARENT_ID) REFERENCES PARENT_TB(PARENT_ID)
);

DROP TABLE parent_tb CASCADE CONSTRAINTS ;












