drop table WISH cascade constraints;
drop sequence WISH_seq;


create sequence WISH_seq
start with 1
increment by 1;


CREATE TABLE WISH(
    wID NUMBER PRIMARY KEY ,
    w_mIDx number REFERENCES MEMBER(midx) NOT NULL,
    w_pID number REFERENCES PRODUCT(pID),
     wAmount NUMBER(7) DEFAULT 0,
    wDATE DATE DEFAULT SYSDATE
);

insert into wish(wID,w_pID,w_mIDx,wAmount)
	values (wish_seq.nextval,1,1,1)
	
	
	insert into wishlist(wID,w_pID,w_mIDx)
	values (wish_seq.nextval,1,ddd)


select * from WISH;
select * from member;

desc WISHLIST;


		select wis.wID as wID,
			   wis.wAmount as wAmount,
       		   pro.pimage1 as w_pIMAGE1,
       		   pro.pname as w_pNAME,
       		   pro.pprice as w_pPRICE,
       		   pro.pdiscount as w_pdiscount
		from wish wis, member mem, product pro
		where wis.w_mIDx = mem.midx and wis.w_pID=pro.pid and mem.midx=1
		order by wis.wID asc



