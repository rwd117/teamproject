drop table member cascade constraints;
drop sequence member_seq;


create sequence MEMBER_seq
start with 0
increment by 1
minvalue 0;

create table MEMBER(
	midx number constraint MEMBER_PK primary key,
	mname varchar2(100) not null,
	mid varchar2(100) not null unique,
	mpw varchar2(100) not null,
	memail varchar2(100) not null ,
	maddress varchar2(100) not null,
    maddress2 varchar2(100) not null,
	mbirth varchar2(100) not null,
	mdate date default sysdate,
	mphone varchar2(100) not null,
	mpost varchar2(100),
    mlevel number default 0,
    mamount number(10) default 0
);

ALTER TABLE MEMBER ADD mdrop NUMBER(2) DEFAULT 1 NOT NULL;

insert into member values(MEMBER_seq.nextval,'admin','admin','admin','111@gmail.com','서울','신천동','2021-02-22',sysdate,'111-1111-1111','06035',2,0);
insert into member values(MEMBER_seq.nextval,'ddd','ddd','ddd','111@gmail.com','대구','신천동','2021-02-22',sysdate,'111-1111-1111','06035',0,0);
insert into member values(MEMBER_seq.nextval,'aaa','aaa','aaa','111@gmail.com','대구','신천동','2021-02-22',sysdate,'111-1111-1111','06035',1,0);


select * from member;

update MEMBER
	set mlevel=1
	where midx=2


