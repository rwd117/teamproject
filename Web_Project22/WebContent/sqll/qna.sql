drop table board_info_table cascade constraints;

drop table content_table cascade constraints;

drop sequence content_seq;

create sequence content_seq
start with 0
increment by 1
minvalue 0;

create table board_info_table( /* 게시판정보테이블 */
	board_info_idx number constraint BOARD_INFO_PK primary key,
	board_info_name varchar2(500) not null
);

insert into board_info_table(board_info_idx, board_info_name) values (1, '상품문의');
insert into board_info_table(board_info_idx, board_info_name) values (2, '배송문의');
insert into board_info_table(board_info_idx, board_info_name) values (3, '반품문의');
insert into board_info_table(board_info_idx, board_info_name) values (4, '교환문의');

commit;

create table content_table(      /* 게시글테이블 */
	content_idx number constraint CONTENT_PK primary key,
	content_subject varchar2(500) not null,
	content_text long not null,
	content_file varchar2(500),
	content_writer_idx number not null
	                   constraint CONTENT_FK1 references member(midx),
	content_board_idx number not null
	                  constraint CONTENT_FK2 references board_info_table(board_info_idx),
	content_date date DEFAULT sysdate
);


select * from board_info_table;
select * from member;  
select * from content_table;

select midx, mname 
from member 
where mid='aaa' and mpw='aaa'

delete from member;

select * from board_info_table;

select board_info_idx, board_info_name 
from board_info_table;

insert into CONTENT_TABLE(content_idx, content_subject, content_text,
content_file, content_writer_idx, content_board_idx, content_date)
values(content_seq.nextval, '연습', '연습용', 'test.txt', 1, 1, sysdate);

select * from content_table;
select * from member;

select board_info_name 
from BOARD_INFO_TABLE
where board_info_idx=1;