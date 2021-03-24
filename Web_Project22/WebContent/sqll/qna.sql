drop table board_info_table cascade constraints;

drop table content_table cascade constraints;
drop sequence content_seq;


drop sequence content_reply_seq;
drop table content_reply cascade constraints;


SELECT content_Seq.NEXTVAL FROM DUAL;


select a.username, a.sid, a.serial#, b.xidusn, b.process, b.locked_mode, c.object_name, a.sql_id
  from v$session a, v$locked_object b, dba_objects c
   where a.sid = b.session_id
   and b.object_id = c.object_id
 order by b.xidusn desc;

alter system kill session '160,899';

create sequence content_seq
start with 0
increment by 1
minvalue 0;


SELECT * FROM USER_SEQUENCES;

create table board_info_table( /*  */
	board_info_idx number constraint BOARD_INFO_PK primary key,
	board_info_name varchar2(500) not null
);

insert into board_info_table(board_info_idx, board_info_name) values (1, '상품문의');
insert into board_info_table(board_info_idx, board_info_name) values (2, '배송문의');
insert into board_info_table(board_info_idx, board_info_name) values (3, '반품문의');
insert into board_info_table(board_info_idx, board_info_name) values (4, '교환문의');

commit;

create table content_table(      /* */
	content_idx number DEFAULT 0 constraint content_pk primary key ,
	content_subject varchar2(500) not null,
	content_text long not null,
	content_file varchar2(500),
    content_hit number(5),
     content_pwd varchar2(20),
     content_bno number DEFAULT 0,
       content_level number DEFAULT 0,
       content_step  number DEFAULT 0,
	content_writer_idx number not null
	                   constraint CONTENT_FK1 references member(midx),
	content_board_idx number not null
	                  constraint CONTENT_FK2 references board_info_table(board_info_idx),
	content_date date DEFAULT sysdate
	
);


ALTER TABLE content_table
ADD (
    content_parent NUMBER(10)
)







ALTER TABLE content_table
ADD(root NUMBER, step NUMBER DEFAULT 0, indent NUMBER DEFAULT 0);
ALTER TABLE content_table ADD (root NUMBER);

INSERT INTO CONTENT_TABLE VALUES(content_idx_seq.nextval , 'CONTENT_TABLE' , 'root', number);
INSERT INTO content_table(BOARD_NUM) VALUES(EX_SEQ.NEXTVAL); 


UPDATE content_table SET content_root = content_idx;



update board set groupOrd = groupOrd + 1 where originNo = 0 and groupOrd > 0
select * from board_info_table;
select * from member;  
select * from content_table;
content_originNo number not null
    constraint CONTENT_FK3 references content_table(content_idx),
    content_groupOrd number default 0 not null,
	content_groupLayer number default 0 not null,
INSERT into content_table(content_idx,content_subject,content_text,content_writer_idx,content_board_idx) 
   VALUES (0,'aaaaaa',2,4);


update board set groupOrd = groupOrd + 1 where originNo = 1 and groupOrd > 1
update CONTENT_TABLE a  set content_groupno =(select seq from CONTENT_TABLE where seq = a.seq);

select midx, mname 
from member 
where mid='aaa' and mpw='aaa'

delete from member;

select * from board_info_table;

select board_info_idx, board_info_name 
from board_info_table;

insert into CONTENT_TABLE(content_idx, content_subject, content_text,
content_file, content_writer_idx, content_board_idx, content_date)
values(content_seq.nextval, 'aaaaa', 'aaaaaaaaa', 'test.txt', 1, 1, sysdate);


 alter table CONTENT_TABLE add ( content_ref number(7));
 alter table CONTENT_TABLE add ( content_step number(7)); 
alter table CONTENT_TABLE add (content_level number (7));
select * from content_table;
select * from member;
select max(content_idx) from CONTENT_TABLE;

update content_table 
set content_subject =8, 
    content_text=8, 
    content_file=8
where content_idx=9;




select max(content_idx) as max from
		content_table 

update content_table 
set content_subject =#{content_subject}, 
    content_text=#{content_text}, 
    content_file=#{content_file, jdbcType=VARCHAR}
where content_idx=#{content_idx}

select * from CONTENT_TABLE;

update CONTENT_TABLE set content_step=content_step+1 where content_ref=? and content_step > ?;
select board_info_name 
from BOARD_INFO_TABLE
where board_info_idx=1;