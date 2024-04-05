--------------------------------
---------- ������ ����-----------
--------------------------------
DROP SEQUENCE SEQ_QNA_NO;

--------------------------------
---------- ������ ���� -----------
--------------------------------
CREATE SEQUENCE SEQ_QNA_NO NOCACHE NOCYCLE;




--------------------------------
---------- ���̺� ���� -----------
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
--������ �亯
INSERT INTO QNA(NO, MASTER_TITLE,MASTER_CONTENTS) VALUES(SEQ_QNA_NO.NEXTVAL , '����', '�ٶ�');
INSERT INTO QNA(NO, MASTER_TITLE,MASTER_CONTENTS) VALUES(SEQ_QNA_NO.NEXTVAL , ?, ?);
-- �Խñ� �ۼ�
INSERT INTO QNA(NO, TITLE, CONTENTS, WRITER_NO) VALUES(SEQ_QNA_NO.NEXTVAL , ?, ?, ?);
INSERT INTO QNA(NO, USER_TITLE, USER_CONTENTS) VALUES(SEQ_QNA_NO.NEXTVAL , '����', '�ٶ�' );

-- �Խñ� ��� ��ȸ(�����ȼ�)
SELECT * FROM QNA ORDER BY NO ASC;

--�Խñ� ��ü ��ȸ
SELECT * FROM QNA;
-- �Խñ� �� ��ȸ 
SELECT * FROM QNA WHERE NO = ?;

-- �Խñ� �˻� (����)
SELECT * FROM QNA WHERE TITLE LIKE '%?%';

-- �Խñ� �˻� (����)
SELECT * FROM QNA WHERE CONTENT LIKE '%?%';

-- �Խñ� ���� (�ۼ��� �Ǵ� ������ �� ����)
UPDATE QNA SET USER_TITLE = ? , USER_CONTENTS = ? , MODIFY_DATE = SYSDATE WHERE NO = ?;

-- �Խñ� ���� (�ۼ��� �Ǵ� ������ �� ����)
UPDATE QNA SET DEL_YN = 'Y' , MODIFY_DATE = SYSDATE WHERE NO = ?;





--------------------------------
---------- �ܷ�Ű �߰� -----------
--------------------------------
ALTER TABLE QNA
ADD CONSTRAINT FK_QNA_NO
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);