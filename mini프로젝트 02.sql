--PHONE 시퀀스 삭제
DROP SEQUENCE SEQ_PHONE_NO;

--PHONE 시퀀스 생성
CREATE SEQUENCE SEQ_PHONE_NO;

--PHONE 테이블 삭제
DROP TABLE PHONE CASCADE CONSTRAINTS;

--PHONE 테이블 생성
CREATE TABLE PHONE (
   NO               NUMBER          CONSTRAINT PK_PH_NO             PRIMARY KEY
    , MODEL_NAME    VARCHAR2(100)   CONSTRAINT NN_PH_MODEL_NAME     NOT NULL
    , GRADE         VARCHAR2(100)   CONSTRAINT NN_PH_GRADE          NOT NULL
    , GRADE_PRICE   NUMBER          CONSTRAINT NN_PH_GRADE_PRICE    NOT NULL
);
---------------------------------------------------------------

--PURCHASE_LIST 시퀀스 삭제
DROP SEQUENCE SEQ_PURCHASE_LIST_NO;

--PURCHASE_LIST 시퀀스 생성
CREATE SEQUENCE SEQ_PURCHASE_LIST_NO;

--PURCHASE_LIST 테이블 삭제
DROP TABLE PURCHASE_LIST CASCADE CONSTRAINTS;

--PURCHASE_LIST 테이블 생성
CREATE TABLE PURCHASE_LIST
 (
    NO               NUMBER                             CONSTRAINT  PK_PL_NO     PRIMARY KEY
    , PHONE_NUMBER   VARCHAR2(100)                      CONSTRAINT  NN_PL_PN     NOT NULL
    , MEMBER_ID      VARCHAR2(100)                      CONSTRAINT  NN_PL_MI     NOT NULL
    , SCRATCH_NUM    NUMBER                             CONSTRAINT  NN_PL_SN     NOT NULL
    , BATTERY_NUM    NUMBER                             CONSTRAINT  NN_PL_BN     NOT NULL
    , TOTAL_SCORE    NUMBER                             CONSTRAINT  NN_PL_TS     NOT NULL
    , ENROLL_DATE    TIMESTAMP      DEFAULT SYSDATE     CONSTRAINT  NN_PL_ED     NOT NULL
 );
---------------------------------------------------------

--MODEL_CLASS 시퀀스 삭제
DROP SEQUENCE SEQ_MODEL_CLASST_NO;

--MODEL_CLASS 시퀀스 생성
CREATE SEQUENCE SEQ_MODEL_CLASST_NO;

--MODEL_CLASS 테이블 삭제
DROP TABLE MODEL_CLASS CASCADE CONSTRAINTS;

--MODEL_CLASS 테이블 생성
CREATE TABLE MODEL_CLASS (
    NO                  NUMBER                                      CONSTRAINT  PK_MC_NO     PRIMARY KEY
   , GRADE              CHAR(1)                                     CONSTRAINT  NN_MC_GD     NOT NULL
   , TOTAL_SCORE        VARCHAR(100)                                CONSTRAINT  NN_MC_TC     NOT NULL
   , ENROLL_DATE        TIMESTAMP       DEFAULT TO_CHAR(SYSDATE)    CONSTRAINT  NN_MC_ED     NOT NULL
);
------------------------------------------------------------------

--PRICE_SET 시퀀스 삭제
DROP SEQUENCE SEQ_PRICE_SET_NO;

--PRICE_SET 시퀀스 생성
CREATE SEQUENCE SEQ_PRICE_SET_NO;

--PRICE_SET 테이블 삭제
DROP TABLE PRICE_SET CASCADE CONSTRAINTS;

--PRICE_SET 테이블 생성
CREATE TABLE PRICE_SET (
    NO                 NUMBER                             CONSTRAINT  PK_PS_NO     PRIMARY KEY
    , MODEL_NAME       VARCHAR2(100)                      CONSTRAINT  NN_PS_MN     NOT NULL
    , GRADE            CHAR(1)                            CONSTRAINT  NN_PS_GD     NOT NULL
    , FIRST_PRICE      NUMBER                             CONSTRAINT  NN_PS_FP     NOT NULL
    , GRADE_PRICE      NUMBER                             CONSTRAINT  NN_PS_GP     NOT NULL
    , PERCENTAGE       NUMBER                             CONSTRAINT  NN_PS_PT     NOT NULL
    , ENROLL_DATE      TIMESTAMP      DEFAULT SYSDATE     CONSTRAINT  NN_PS_ED     NOT NULL
);
-------------------------------------------------------------------------------------
--SCRATCH 시퀀스 삭제
DROP SEQUENCE SEQ_SCRATCH_NO;

--SCRATCH 시퀀스 생성
CREATE SEQUENCE SEQ_SCRATCH_NO;

--SCRATCH 테이블 삭제
DROP TABLE SCRATCH CASCADE CONSTRAINTS;

--SCRATCH 테이블 생성
CREATE TABLE SCRATCH (
    NO              NUMBER                              CONSTRAINT  PK_SC_NO     PRIMARY KEY
    , NUM           VARCHAR2(100)                       CONSTRAINT  NN_SC_NM     NOT NULL
    , SCORE         NUMBER                              CONSTRAINT  NN_SC_SC     NOT NULL
    , ENROLL_DATE   TIMESTAMP     DEFAULT SYSDATE       CONSTRAINT  NN_SC_ED     NOT NULL
);

-----------------------------------------------------------------------------------

--BATTERY 시퀀스 삭제
DROP SEQUENCE SEQ_BATTERY_NO;

--BATTERY 시퀀스 생성
CREATE SEQUENCE SEQ_BATTERY_NO;

--BATTERY 테이블 삭제
DROP TABLE BATTERY CASCADE CONSTRAINTS;

--BATTERY 테이블 생성
CREATE TABLE BATTERY (
    PERCENTAGE      VARCHAR2(100)                       CONSTRAINT  PK_BT_NM     PRIMARY KEY
    , SCORE         NUMBER                              CONSTRAINT  NN_BT_SC     NOT NULL
    , ENROLL_DATE   TIMESTAMP     DEFAULT SYSDATE       CONSTRAINT  NN_BT_ED     NOT NULL
);

--외래키 추가
ALTER TABLE PURCHASE_LIST
ADD CONSTRAINT FK_PURCHASE_LIST_MEMBER
FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID);

COMMIT;

---------------------------------------------------------------------
--MEMBER 시퀀스 삭제
DROP SEQUENCE SEQ_MEMBER_NO;
--MEMBER 시퀀스 생성
CREATE SEQUENCE SEQ_MEMBER_NO;
--MEMBER 테이블 삭제
DROP TABLE MEMBER CASCADE CONSTRAINTS;
--MEMBER 테이블 생성
CREATE TABLE MEMBER  (
    NO                          NUMBER                                      CONSTRAINT  PK_MM_BAN   PRIMARY KEY
    , MEMBER_ID                 VARCHAR2(100)                               CONSTRAINT  NN_MM_MI    NOT NULL            CONSTRAINT  UQ_MM_MI    UNIQUE
    , PWD                       VARCHAR2(100)                               CONSTRAINT  NN_MM_PD    NOT NULL    
    , BANK_ACCOUNT_NUMBER       VARCHAR2(100)                               CONSTRAINT  NN_MM_BAN   NOT NULL            CONSTRAINT  UQ_MM_BAN   UNIQUE
    , QUIT_YN                   CHAR(1)             DEFAULT 'N'             CONSTRAINT  NN_MM_QUIT  NOT NULL
    , MODIFY_DATE               TIMESTAMP                   
    , ENROLL_DATE               TIMESTAMP           DEFAULT SYSDATE         CONSTRAINT  NN_MM_ED    NOT NULL
);

-------MEMO-----------------------------------------

SELECT L.NO
, L.PHONE_NUMBER
, L.MEMBER_ID
, L.SCRATCH_NUM
, L.BATTERY_NUM
, L.TOTAL_SCORE
, TO_CHAR(L.ENROLL_DATE, 'YYYY.MM.DD HH:SS') ENROLL_DATE
, P.MODEL_NAME
, P.GRADE
, P.GRADE_PRICE
FROM PURCHASE_LIST L
JOIN PHONE P ON P.NO = L.PHONE_NUMBER
;

SELECT 
NO
, MODEL_NAME
, GRADE
, FIRST_PRICE
, GRADE_PRICE
, PERCENTAGE
, TO_CHAR(ENROLL_DATE, 'YYYY.MM.DD HH24:MI')ENROLL_DATE
FROM PRICE_SET;

SELECT NO, GRADE, TOTAL_SCORE, TO_CHAR(ENROLL_DATE, 'YYYY.MM.DD') FROM MODEL_CLASS;

