create table member(
	m_id varchar2(20 char) primary key,
	m_pw varchar2(30 char) not null,
	m_name varchar2(20 char) not null,
	m_email varchar2(20 char) not null,
	m_gender varchar2(20 char) not null,
	m_photo varchar2(200 char) not null
)

select * from member

insert into member values('yb', '1234','영백','asd@asdf','m','s')
insert into member values('hs', '1234','현수','qwer@asdf','m','010-2222-2222')
insert into member values('hjj', 'hjj', '효진', 'ad@asd', 'f', 'sdf');

SELECT *  FROM bookmark;

alter table member drop column m_photo;
ALTER TABLE member ADD(m_number varchar2(50 char));

create table bookmark(
	b_no varchar2 (30 char) primary key,
	b_id varchar2 (30 char) not null,
	b_mapx varchar2 (30 char) not null,
	b_mapy varchar2 (30 char) not null,
	b_contentid varchar2 (30 char) not null,
	b_title varchar2 (30 char) not null,
	b_image varchar2 (300 char) not null
);

create sequence bookmark_seq;


drop table bookmark;



insert into member values('hjj', 'hjj', '효진', 'ad@asd', 'f', 'sdf');





select * from aboutmember

select * from bookmark;



select * from bookmark;


UPDATE member SET m_number = '010-0000-0000' WHERE m_name='영백';
UPDATE member SET m_number = '010-1111-1111' WHERE m_name='효진';

ALTER TABLE member MODIFY (m_number NOT NULL);



select * from aboutmember

select * from member




create table tourRank(
	contentid varchar2(10 char) primary key,
	title varchar2(50 char) not null,
	image varchar2(300 char) not null,
	count number not null,
	contentTypeId varchar2(20 char) not null,
	x varchar2 (30 char) not null,
	y varchar2 (30 char) not null
)

select * from tourRank

create table searchRank(
	word varchar2(30 char) primary key,
	count number not null
)

select * from searchRank;

create sequence board_seq nocache;

create table board (
	b_no number primary key,
	b_title varchar2(100 char) not null,
	b_content varchar2(1000 char) not null,
	b_image varchar2(300 char),
	b_writer varchar2(20 char) not null,
	b_comments number not null,
	b_views number not null,
	b_date date not null
)

drop table board;
insert into board values(board_seq.nextval, '제목2', '내용', '이미지', '작성자', 0, 0, to_date(sysdate, 'yyyy-mm-dd hh24:mi:ss'));
select * from board;
delete from board
update board set b_comments = b_comments + 1 where b_no = 13

create sequence comment_seq nocache;

create table comments (
	c_seq number primary key,
	c_no number not null,
	c_writer varchar2(20 char) not null,
	c_comment varchar2(200 char) not null,
	c_date date not null,
	constraint comments_fk foreign key (c_no) references board(b_no) on delete cascade
)

drop table comments;
select * from comments;