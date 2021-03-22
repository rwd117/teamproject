drop table review_reply cascade constraints;
drop sequence REVIEW_reply_SEQ;

create table review_reply(
    re_ID NUMBER(7) PRIMARY KEY,
    re_rid NUMBER(7) REFERENCES review(r_ID) NOT NULL,
    re_mIDx number REFERENCES MEMBER(mIDx) NOT NULL,
    re_content VARCHAR2(250) NOT NULL,
    re_date Date default sysdate
);


CREATE SEQUENCE REVIEW_reply_SEQ start with 1
increment by 1
NOCYCLE NOCACHE;