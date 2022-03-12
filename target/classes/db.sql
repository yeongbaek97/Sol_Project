create table member(
	m_id varchar2(20 char) primary key,
	m_pw varchar2(30 char) not null,
	m_name varchar2(20 char) not null,
	m_email varchar2(20 char) not null,
	m_gender varchar2(20 char) not null,
	m_number varchar2(50 char) not null
)

insert into member values('yb', '1234','영백','asd@asdf','m','s')
insert into member values('hs', '1234','현수','qwer@asdf','m','010-2222-2222')
insert into member values('hj', 'hj', '이효진', 'asd@asdf.asd','female', '01033333333');

select m_id from member;
select * from member;

SELECT *  FROM bookmark;

alter table member drop column m_photo;
ALTER TABLE member ADD(m_number varchar2(50 char));


create table bookmark(
	b_no varchar2 (30 char) primary key,
	b_id varchar2 (30 char) not null,
	b_mapx varchar2 (30 char) not null,
	b_mapy varchar2 (30 char) not null,
	b_contentid varchar2 (30 char) not null,
	b_title varchar2 (30 char) not null
);
create sequence bookmark_seq;



insert into member values('hjj', 'hjj', '효진', 'ad@asd', 'f', 'sdf');




select * from aboutmember


UPDATE member SET m_number = '010-0000-0000' WHERE m_name='영백';
UPDATE member SET m_number = '010-1111-1111' WHERE m_name='효진';

ALTER TABLE member MODIFY (m_number NOT NULL);

select * from aboutmember

create table tourRank(
	contentid varchar2(10 char) primary key,
	title varchar2(50 char) not null,
	image varchar2(300 char) not null,
	count number not null
)

drop table tourRank
select * from tourRank
delete from tourRank
select * from tourRank where contentid = 2622715
update tourRank set count = count + 1 where contentid = 2622715

create table searchRank(
	word varchar2(30 char) primary key,
	count number not null
)

select * from searchRank

