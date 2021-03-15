drop table q_table;
create table q_table(      /* 게시글 테이블 */
	q_idx number constraint q_table_PK primary key,
	q_title varchar2(500) not null,
	q_content long not null,
	q_file varchar2(500),
	q_pwd varchar(50) not null,
    q_hit number(5) default 0,
	q_name varchar2(20),
	q_date date DEFAULT sysdate
);
update q_table
	set q_title=8 ,q_name=8,
	q_content=8,q_file=8.txt where q_idx=9; 

create sequence q_table_seq
start with 0
increment by 1
minvalue 0;

insert into q_table(q_idx, q_title, q_content,q_pwd,
q_file, q_name, q_date)
values(q_table_seq.nextval, '연습', '연습입니다','admin', 'test.txt', '관리자', sysdate);

select * from member;
select * from q_table;

 alter table q_table add ( q_pwd varchar(50));
 
 
 

 