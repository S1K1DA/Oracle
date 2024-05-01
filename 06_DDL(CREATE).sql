CREATE TABLE ddl_member (
	member_no NUMBER PRIMARY KEY,
	member_id varchar2(30) UNIQUE NOT NULL,
	member_pwd varchar2(255) NOT NULL,
	member_name varchar2(30) NOT NULL,
	member_gender varchar2(5) CHECK(member_gender IN('W', 'M')) NOT NULL,
	member_point NUMBER DEFAULT 0,
	member_indate DATE DEFAULT sysdate);

INSERT INTO DDL_MEMBER VALUES(1,'아이디1', 'qwer1234!', '홍길동', 'M',DEFAULT,DEFAULT);
INSERT INTO DDL_MEMBER VALUES(2,'아이디2', 'qwer1234!', '신사임당', 'W',DEFAULT,DEFAULT);
INSERT INTO DDL_MEMBER VALUES(3,'아이디3', 'qwer1234!', '이순신', 'M',DEFAULT,DEFAULT);

CREATE TABLE ddl_job (
	job_code NUMBER PRIMARY KEY,
	job_name varchar2(100),
	member_no NUMBER REFERENCES ddl_member(member_no) ON DELETE SET NULL
);

INSERT INTO DDL_JOB VALUES(1, '개발자', 3);

SELECT * FROM DDL_MEMBER dm ;
SELECT * FROM DDL_JOB dj ;

DELETE FROM DDL_MEMBER WHERE member_no = 3;

--DROP TABLE DDL_MEMBER ;
DROP TABLE DDL_JOB ;


COMMENT ON COLUMN ddl_member.MEMBER_ID IS '아이디 컬럼임';

--1. 테이블 명 : ddl_free_board
--2. 컬럼은 아래와 같습니다.
-- BOARD_NO NUMBER
-- BOARD_TITLE VARCHAR2(100)
-- BOARD_CONTENT CLOB
-- BOARD_DATE DATE
-- BOARD_VIEWS NUMBER
CREATE TABLE ddl_free_board (
board_no NUMBER NOT NULL UNIQUE,
board_title varchar2(100) NOT NULL,
board_content clob NOT NULL,
board_date DATE,
board_views number);



DROP TABLE DDL_FREE_BOARD ; 
--3. 각각의 컬럼에 코멘트를 추가합니다.
-- BOARD_NO : 게시판 번호
-- BOARD_TITLE : 게시판 제목
-- BOARD_CONTENT : 게시판 내용
-- BOARD_DATE : 게시판 작성일
-- BOARD_VIEWS : 게시판 조회수
COMMENT ON COLUMN ddl_free_board.board_no IS '게시판 번호';
COMMENT ON COLUMN ddl_free_board.board_title IS '게시판 제목';
COMMENT ON COLUMN ddl_free_board.board_content IS '게시판 내용';
COMMENT ON COLUMN ddl_free_board.board_date IS '게시판 작성일';
COMMENT ON COLUMN ddl_free_board.board_views IS '게시판 조회수';

INSERT INTO DDL_FREE_BOARD VALUES (1,'test1','test1',sysdate,5);
INSERT INTO DDL_FREE_BOARD VALUES (2,'test2','test2',sysdate,20);
INSERT INTO DDL_FREE_BOARD VALUES (3,'test3','test3',sysdate,15);

SELECT * FROM DDL_FREE_BOARD dfb; 





