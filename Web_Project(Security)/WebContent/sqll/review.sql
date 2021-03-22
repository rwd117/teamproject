drop table REVIEW cascade constraints;
drop sequence REVIEW_SEQ;

CREATE TABLE REVIEW(
    r_ID NUMBER(7) PRIMARY KEY,
    r_oID NUMBER(7) REFERENCES ORDERS(o_ID) NOT NULL,
    r_pID number(10) references product(pid) not null,
    r_mIDx number REFERENCES MEMBER(mIDx) NOT NULL,
    r_TITLE VARCHAR2(250) NOT NULL,
    r_CONTENT VARCHAR2(4000) NOT NULL,
    r_FILE1 VARCHAR2(250),
    r_FILE2 VARCHAR2(250),
    r_DATE DATE DEFAULT SYSDATE,
    r_secret number default 0 
);

CREATE SEQUENCE REVIEW_SEQ start with 1
increment by 1
NOCYCLE NOCACHE;