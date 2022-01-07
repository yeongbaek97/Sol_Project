create table member(
	m_id varchar2(20 char) primary key,
	m_pw varchar2(30 char) not null,
	m_name varchar2(20 char) not null,
	m_email varchar2(20 char) not null,
	m_gender varchar2(20 char) not null,
	m_photo varchar2(200 char) not null
);

drop table member;

insert into member values('yb', '1234','영백','asd@asdf','m','s');
insert into member values('mj', '1234','민재','asd@asdf','m','s');

SELECT *  FROM member;