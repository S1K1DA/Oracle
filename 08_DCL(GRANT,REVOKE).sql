ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

CREATE USER grantuser IDENTIFIED BY qwer1234;

GRANT CREATE SESSION TO grantuser;

GRANT CREATE TABLE TO grantuser;

CREATE TABLE grant_test (
	test_id varchar2(50) PRIMARY KEY,
	test_name varchar2(50)
);


-- id : hr  pwd : qwer1234!

GRANT SELECT ON hr.EMPLOYEES TO grantuser;

SELECT * FROM hr.EMPLOYEES e ;


ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

--1. web_back 계정을 생성한 후 아래의 시나리오에 맞춰 권한을 부여하세요.
-- HR 개발팀의 백엔드 직원들만 사용하는 계정입니다.
-- 오라클에 접속할 수 있어야 하며 테이블을 생성할 수 있는 권한을 가집니다.
-- HR 스키마의 EMPLOYEES 테이블을 조작(DML)할 수 있는 모든 권한을 가집니다.
CREATE USER web_back IDENTIFIED BY qwer1234;
GRANT CREATE SESSION TO web_back;
GRANT CREATE TABLE TO web_back;

GRANT SELECT, INSERT, UPDATE, DELETE ON hr.EMPLOYEES TO web_back;

REVOKE 	SELECT, 
		INSERT,
		UPDATE,
		DELETE
		ON hr.EMPLOYEES 
 FROM web_back;


--2. web_front 계정을 생성한 후 아래의 시나리오에 맞춰 권한을 부여하세요.
-- HR 개발팀의 프론트 직원들만 사용하는 계정입니다.
-- 오라클에 접속할 수 있어야 하며 테이블을 생성할 수 없습니다.
-- HR 스키마의 EMPLOYEES 테이블을 조회할 수 있는 권한만을 가지며, 그 외
--데이터의 추가/수정/삭제에 대한 권한은 가질 수 없습니다.

CREATE USER web_front IDENTIFIED BY qwer1234;

GRANT CREATE SESSION TO web_front;
GRANT SELECT ON hr.EMPLOYEES TO web_front;

REVOKE SELECT
ON hr.EMPLOYEES 
FROM WEB_FRONT;

REVOKE SELECT ON hr.EMPLOYEES FROM GRANTUSER;


CREATE ROLE back_dev;  --롤 생성
GRANT SELECT, INSERT, UPDATE, DELETE ON hr.EMPLOYEES TO back_dev; --롤 권한 부여
GRANT back_dev TO web_back;-- 사용자에게 롤 권한 부여

CREATE ROLE front_dev;
GRANT SELECT ON hr.EMPLOYEES TO front_dev; 
GRANT front_dev TO web_front;

REVOKE front_dev FROM WEB_FRONT; -- 웹프론트한테있는 프론트 데브 삭제

SELECT * FROM dba_tab_privs WHERE table_name ='EMPLOYEES';

SELECT * FROM dba_role_privs WHERE grantee='WEB_FRONT';

SELECT * FROM role_sys_privs; -- CREATE, ALTER, DROP

REVOKE DELETE ON hr.EMPLOYEES  FROM back_dev; -- back_dev안에 있는 DELETE권한을 뺏기

DROP ROLE front_dev; -- 롤 삭제















