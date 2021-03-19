
drop table cart cascade constraints;
drop sequence cart_seq;


create sequence cart_seq
start with 1
increment by 1;


CREATE TABLE CART(
    cID NUMBER(7) PRIMARY KEY,
    c_m_IDx number REFERENCES MEMBER(midx) NOT NULL,
    c_p_ID number(10) REFERENCES PRODUCT(pID),
    cAmount NUMBER(7) DEFAULT 0,
    cDATE DATE DEFAULT SYSDATE
);

select * from cart;

desc cart;
