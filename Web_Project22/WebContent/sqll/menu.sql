drop table topmenu cascade constraints;
drop sequence topmenu_seq ;
drop table submenu cascade constraints;
drop sequence submenu_seq;

create table Topmenu(
    top_idx number(10),
    top_name varchar2(100),
    PRIMARY KEY(top_idx)
);

create sequence Topmenu_seq
start with 1
increment by 1;

SET DEFINE OFF;/*특수 문자 입력 가능 명령어*/
/*상단 메뉴*/
insert into Topmenu(top_idx,top_name)
values(Topmenu_seq.nextval,'NEW 10%');
insert into Topmenu(top_idx,top_name)
values(Topmenu_seq.nextval,'BEST ITEM');
insert into Topmenu(top_idx,top_name)
values(Topmenu_seq.nextval,'ONEDAY');
insert into Topmenu(top_idx,top_name)
values(Topmenu_seq.nextval,'TOP');
insert into Topmenu(top_idx,top_name)
values(Topmenu_seq.nextval,'BOTTOM');
insert into Topmenu(top_idx,top_name)
values(Topmenu_seq.nextval,'OUTER');
insert into Topmenu(top_idx,top_name)
values(Topmenu_seq.nextval,'SHOES&BAG');
insert into Topmenu(top_idx,top_name)
values(Topmenu_seq.nextval,'ACC');
insert into Topmenu(top_idx,top_name)
values(Topmenu_seq.nextval,'SET');
insert into Topmenu(top_idx,top_name)
values(Topmenu_seq.nextval,'HOME/EASY');

select * from topmenu;

/*서브메뉴 생성*/
create table submenu(
    sub_idx number(10),
    sub_top_idx number(10),
    sub_name varchar2(100),
    PRIMARY KEY(sub_idx),
    foreign key(sub_top_idx) references Topmenu (top_idx)
);

create sequence submenu_seq
start with 1
increment by 1;

insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,4,'BL');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,4,'TEE');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,4,'SHIRT');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,4,'KNIT');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,5,'PANTS');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,5,'SKIRT');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,5,'DRESS');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,6,'JACKET');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,6,'COAT');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,6,'CARDIGAN');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,6,'JP');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,6,'PADDING');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,7,'SHOES');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,7,'BAG');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,8,'JEWELRY');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,8,'HAT');
insert into submenu(sub_idx,sub_top_idx,sub_name)
values(submenu_seq.nextval,8,'ETC');



select * from submenu;

COMMIT;
