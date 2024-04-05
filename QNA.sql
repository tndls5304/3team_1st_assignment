--------------------------------
---------- 시퀀스 삭제-----------
--------------------------------
DROP SEQUENCE SEQ_QNA_NO;

--------------------------------
---------- 시퀀스 생성 -----------
--------------------------------
CREATE SEQUENCE SEQ_QNA_NO NOCACHE NOCYCLE;




--------------------------------
---------- 테이블 생성 -----------
--------------------------------
DROP TABLE QNA CASCADE CONSTRAINTS;
CREATE TABLE QNA(
	NO	NUMBER	CONSTRAINT PK_QNA_NO PRIMARY KEY,
	USER_TITLE	VARCHAR2(100)	 NOT NULL,
	USER_CONTENTS	VARCHAR2(100)	NOT NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE NOT NULL,
	CATEGORY	VARCHAR2(100)	NOT NULL,
	WRITER_NO	NUMBER	NOT NULL,
	MASTER_TITLE	VARCHAR2(100)	NOT  NULL,
	MASTER_CONTENTS	VARCHAR2(100)	NOT NULL,
	MODIFY_DATE TIMESTAMP	DEFAULT SYSDATE NOT NULL,
    DEL_YN  CHAR(1) DEFAULT 'N' NOT NULL
);


-- ''' ||
--관리자 답변
INSERT INTO QNA(NO, MASTER_TITLE,MASTER_CONTENTS) VALUES(SEQ_QNA_NO.NEXTVAL , '가나', '다라');
INSERT INTO QNA(NO, MASTER_TITLE,MASTER_CONTENTS) VALUES(SEQ_QNA_NO.NEXTVAL , ?, ?);
-- 게시글 작성
INSERT INTO QNA(NO, TITLE, CONTENTS, WRITER_NO) VALUES(SEQ_QNA_NO.NEXTVAL , ?, ?, ?);
INSERT INTO QNA(NO, USER_TITLE, USER_CONTENTS) VALUES(SEQ_QNA_NO.NEXTVAL , '가나', '다라' );

-- 게시글 목록 조회(오래된순)
SELECT * FROM QNA ORDER BY NO ASC;

--게시글 전체 조회
SELECT * FROM QNA;
-- 게시글 상세 조회 
SELECT * FROM QNA WHERE NO = ?;

-- 게시글 검색 (제목)
SELECT * FROM QNA WHERE TITLE LIKE '%?%';

-- 게시글 검색 (내용)
SELECT * FROM QNA WHERE CONTENT LIKE '%?%';

-- 게시글 수정 (작성자 또는 관리자 만 가능)
UPDATE QNA SET USER_TITLE = ? , USER_CONTENTS = ? , MODIFY_DATE = SYSDATE WHERE NO = ?;

-- 게시글 삭제 (작성자 또는 관리자 만 가능)
UPDATE QNA SET DEL_YN = 'Y' , MODIFY_DATE = SYSDATE WHERE NO = ?;





--------------------------------
---------- 외래키 추가 -----------
--------------------------------
ALTER TABLE QNA
ADD CONSTRAINT FK_QNA_NO
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);