--테이블명 : example_member
--
--회원번호 : em_no
--아이디 : em_id
--비밀번호 : em_pwd
--이메일 : em_email
--
--이름 : em_name
--생년월일 : em_birth_date
--통신사 : em_mobile_carrier (SKT, KT, LG U+)
--휴대전화번호 : em_phone_number
--
--성별 : em_gender  (W, M)
--국적 : em_nationality  (내국인, 외국인)
--
--약관동의 : em_agreed_terms (Y)



--테이블명 : example_member
CREATE TABLE example_member (
	em_no NUMBER PRIMARY KEY,
	em_id varchar2(30) UNIQUE NOT NULL,
	em_pwd varchar2(255) NOT NULL,	
	em_email varchar2(100),
	em_name varchar2(30) NOT NULL,
	em_birth_date varchar2(8) NOT NULL,
	em_mobile_carrier varchar2(10) NOT NULL CHECK(em_mobile_carrier IN('SKT', 'KT', 'LG U+')),
	em_phone_number  varchar2(20) NOT NULL,
	em_gender varchar2(10) NOT NULL CHECK(em_gender IN('W', 'M')),
	em_nationality varchar2(10) NOT NULL CHECK(em_nationality IN('내국인', '외국인')),
	em_agreed_terms varchar2(10) NOT NULL CHECK(em_agreed_terms IN('Y'))
);

-- 첫 번째 레코드
INSERT INTO example_member (
    em_no,
    em_id,
    em_pwd,
    em_email,
    em_name,
    em_birth_date,
    em_mobile_carrier,
    em_phone_number,
    em_gender,
    em_nationality,
    em_agreed_terms
) VALUES (
    1,
    'user123',
    'securepassword123',
    'user123@example.com',
    '홍길동',
    '19900101',
    'SKT',
    '010-1234-5678',
    'M',
    '내국인',
    'Y'
);

-- 두 번째 레코드
INSERT INTO example_member (
    em_no,
    em_id,
    em_pwd,
    em_email,
    em_name,
    em_birth_date,
    em_mobile_carrier,
    em_phone_number,
    em_gender,
    em_nationality,
    em_agreed_terms
) VALUES (
    2,
    'user124',
    'password456',
    'user124@example.com',
    '이영희',
    '19850315',
    'KT',
    '010-9876-5432',
    'W',
    '내국인',
    'Y'
);

-- 세 번째 레코드
INSERT INTO example_member (
    em_no,
    em_id,
    em_pwd,
    em_email,
    em_name,
    em_birth_date,
    em_mobile_carrier,
    em_phone_number,
    em_gender,
    em_nationality,
    em_agreed_terms
) VALUES (
    3,
    'user125',
    'mysecret789',
    'user125@example.com',
    '김철수',
    '19951120',
    'LG U+',
    '010-2468-1357',
    'M',
    '외국인',
    'Y'
);

DROP TABLE EXAMPLE_MEMBER ;

COMMENT ON COLUMN example_member.em_no IS '회원번호';
COMMENT ON COLUMN example_member.em_id IS '아이디';
COMMENT ON COLUMN example_member.em_pwd IS '비밀번호';
COMMENT ON COLUMN example_member.em_email IS '이메일';
COMMENT ON COLUMN example_member.em_name IS '이름';
COMMENT ON COLUMN example_member.em_birth_date IS '생년월일';
COMMENT ON COLUMN example_member.em_mobile_carrier IS '통신사';
COMMENT ON COLUMN example_member.em_phone_number IS '휴대전화번호';
COMMENT ON COLUMN example_member.em_gender IS '성별';
COMMENT ON COLUMN example_member.em_nationality IS '국적';
COMMENT ON COLUMN example_member.em_agreed_terms IS '약관동의';

SELECT * FROM EXAMPLE_MEMBER em ;

--테이블명 : example_board
--
--게시글 번호 : eb_no
--제목 : eb_title
--내용 : eb_content
--작성일 : eb_date
--조회수 : eb_views
--
--작성자 : em_no 참조


CREATE TABLE example_board (
	eb_no NUMBER PRIMARY KEY,
	eb_title varchar2(100) NOT NULL,
	eb_content CLOB NOT NULL,
	eb_date DATE DEFAULT sysdate NOT NULL,
	eb_views NUMBER DEFAULT 0 NOT NULL,
	em_no NUMBER REFERENCES example_member(em_no)
);

INSERT INTO EXAMPLE_BOARD eb VALUES(1, '제목1', '내용1', DEFAULT, DEFAULT, 3);
INSERT INTO EXAMPLE_BOARD eb VALUES(2, '제목2', '내용2', DEFAULT, DEFAULT, 1);
INSERT INTO EXAMPLE_BOARD eb VALUES(3, '제목3', '내용3', DEFAULT, DEFAULT, 3);

SELECT * FROM EXAMPLE_BOARD eb ;
SELECT * FROM EXAMPLE_MEMBER em ;

COMMENT ON COLUMN example_board.eb_no IS '게시글 번호';
COMMENT ON COLUMN example_board.eb_title IS '제목';
COMMENT ON COLUMN example_board.eb_content IS '내용';
COMMENT ON COLUMN example_board.eb_date IS '작성일';
COMMENT ON COLUMN example_board.eb_views IS '조회수';
COMMENT ON COLUMN example_board.em_no IS '작성자 참조';

SELECT EB_TITLE, eb.EB_CONTENT, EB_DATE, EB_VIEWS, em_name 
FROM EXAMPLE_BOARD eb
JOIN EXAMPLE_MEMBER em ON eb.EM_NO = em.EM_NO ;





