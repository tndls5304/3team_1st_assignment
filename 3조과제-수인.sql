
-- ������ ����

DROP SEQUENCE SEQ_FAQ_NO;

-- ������ ����

CREATE SEQUENCE SEQ_FAQ_NO NOCACHE NOCYCLE;


-- ���̺� ���� 

DROP TABLE FAQ CASCADE CONSTRAINTS;


-- ���̺� ����

CREATE TABLE FAQ(
    NO              NUMBER         CONSTRAINT PK_FAQ_NO PRIMARY KEY
    , TITLE         VARCHAR2(100)   CONSTRAINT NN_FAQ_TITLE NOT NULL
    , CONTENTS       VARCHAR2(4000) CONSTRAINT NN_FAQ_CONTENTS NOT NULL
    ,CATEGORY       VARCHAR2(100)   CONSTRAINT NN_FAQ_CATEGORY NOT NULL
    , ENROLL_DATE   TIMESTAMP       DEFAULT SYSDATE
    , MODIFY_DATE   TIMESTAMP       
    , DEL_YN        CHAR(1)         DEFAULT 'N' CONSTRAINT CK_FAQ_DELYN CHECK( DEL_YN IN ('Y','N')  )
);


-- �ܷ�Ű �߰� 

--ALTER TABLE FAQ
--ADD CONSTRAINT FK_FAQ_MEMBER
--FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);


--���ֹ������� �̸� �ۼ�
INSERT INTO FAQ( NO, TITLE, CONTENTS,CATEGORY)VALUES(1,'�ǸŽ� ������ ��� �����ǳ���?', '��ũ��ġ,���͸�ȿ���� ����Ͽ� ������ �����˴ϴ�', '���ݰ�������');
INSERT INTO FAQ( NO, TITLE, CONTENTS,CATEGORY)VALUES(2,'�߰� �޴����� �Ǹ��� �Ŀ��� ��� �ɱ��?', '�Ǹŵ� �޴����� ��ü���� �����ǰ� ��Ȱ��ǰų� ���Ǹŵ� �� �ֽ��ϴ�.', '�Ǹ����� ����');
INSERT INTO FAQ( NO, TITLE, CONTENTS,CATEGORY)VALUES(3,'�߰� �޴����� �Ǹ��ϱ� ���� � �غ� �ؾ� �ϳ���?', ' �Ǹ� ���� �޴����� ������ �ʱ�ȭ�Ͽ� ���� ������ �����͸� �����ϴ� ���� �߿��մϴ�.', '�Ǹ� �� �غ���');

--�Խñ� ��ü ��ȸ(�ֽż�)
SELECT * FROM FAQ ORDER BY ENROLL_DATE DESC, MODIFY_DATE DESC;

--�������� �˻�
SELECT *FROM FAQ WHERE TITLE LIKE '%?%';
--�������� �˻�
SELECT *FROM FAQ WHERE CONTENTS LIKE '%?%';

--������-�Խñ� �ۼ�
INSERT INTO FAQ( NO,TITLE,CONTENTS,CATEGORY) VALUES( 3+SEQ_FAQ_NO.NEXTVAL , ?, ?, ?);
--������-�Խñ� ����
UPDATE FAQ SET TITLE = ? , CONTENTS = ? ,CATEGORY=?, MODIFY_DATE = SYSDATE WHERE NO = ?;
--������-�Խñ� ����
UPDATE FAQ SET DEL_YN = 'Y' , MODIFY_DATE = SYSDATE WHERE NO = ?;


COMMIT;
------------
