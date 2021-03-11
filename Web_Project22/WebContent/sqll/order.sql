
drop table ORDERS cascade constraints;
drop table ORDERS_product cascade constraints;
drop sequence ORDERS_SEQ;
drop sequence ORDERS_product_seq;

CREATE TABLE ORDERS(
    o_ID NUMBER(7) PRIMARY KEY,
    o_DATE DATE DEFAULT SYSDATE,
    o_title varchar2(200) not null,
    o_mIDx number REFERENCES MEMBER(midx) NOT NULL,
    o_NAME VARCHAR2(50) NOT NULL,
    o_PHONE VARCHAR2(50) NOT NULL,
    o_post VARCHAR2(50) NOT NULL,
    o_ADDRESS VARCHAR2(350) NOT NULL,
    o_ADDRESS2 VARCHAR2(350) NOT NULL,
    o_PAYMENT VARCHAR2(50) NOT NULL,
    o_INVOICE NUMBER default 0,
    o_money number not null
);

CREATE SEQUENCE ORDERS_SEQ start with 1
increment by 1 NOCYCLE NOCACHE;

CREATE TABLE ORDERS_product(
    op_IDx NUMBER(7) PRIMARY KEY,
    op_pID number(10) REFERENCES PRODUCT(pID) NOT NULL,
    op_amount number not null,
    op_oid NUMBER(7)REFERENCES ORDERS(o_ID) NOT NULL
);

CREATE SEQUENCE ORDERS_product_seq
start with 1
increment by 1
NOCYCLE NOCACHE;