create table member(
	m_id varchar2(20 char) primary key,
	m_pw varchar2(30 char) not null,
	m_name varchar2(20 char) not null,
	m_email varchar2(20 char) not null,
	m_gender varchar2(20 char) not null,
	m_photo varchar2(200 char) not null
)

insert into member values('yb', '1234','영백','asd@asdf','m','s')
insert into member values('hs', '1234','현수','qwer@asdf','m','010-2222-2222')

SELECT *  FROM bookmark;

alter table member drop column m_photo;
ALTER TABLE member ADD(m_number varchar2(50 char));

<<<<<<< HEAD
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
=======

UPDATE member SET m_number = '010-0000-0000' WHERE m_name='영백';
UPDATE member SET m_number = '010-1111-1111' WHERE m_name='효진';

ALTER TABLE member MODIFY (m_number NOT NULL);
>>>>>>> 17c75fa095d344a4053bb7f9ef4ac5a7b5a08f25
