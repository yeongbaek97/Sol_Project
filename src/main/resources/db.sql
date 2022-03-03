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

SELECT *  FROM member;

alter table member drop column m_photo;
ALTER TABLE member ADD(m_number varchar2(50 char));


UPDATE member SET m_number = '010-0000-0000' WHERE m_name='영백';
UPDATE member SET m_number = '010-1111-1111' WHERE m_name='효진';

ALTER TABLE member MODIFY (m_number NOT NULL);