
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP SEQUENCE PRODUCT_SEQ;

create table product(
    pID number(10)PRIMARY KEY,
    p_top_idx number(10),
    p_sub_idx number(10),
    pNAME varchar2(100) not null,
    pPRICE number(10) not null,
    pdiscount number(5) default 0,
    pSTOCK number(10) not null,
    pIMAGE1 varchar2(250) not null,
    pCONTENT varchar2(4000),
    pDATE DATE DEFAULT SYSDATE,
    phit number(20) default 0,
    foreign key(p_top_idx) references Topmenu (top_idx),
    foreign key(p_sub_idx) references submenu (sub_idx)
);
alter table product
add(pIMAGE2 varchar2(250));




create sequence product_seq
start with 1
increment by 1;

select * from product;



select pNAME,
       pPRICE,
       pIMAGE1,
       pCONTENT,
       pDATE,
       phit
from product
where p_top_idx=(select top_idx from topmenu where top_idx=4 ) 
      and p_sub_idx=(select sub_idx from submenu where sub_idx=1 );
