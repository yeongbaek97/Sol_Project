create table member(
	m_id varchar2(20 char) primary key,
	m_pw varchar2(30 char) not null,
	m_name varchar2(20 char) not null,
	m_email varchar2(20 char) not null,
	m_gender varchar2(20 char) not null,
	m_photo varchar2(200 char) not null
)

insert into member values('yb', '1234','영백','asd@asdf','m','s')

SELECT *  FROM member;

create table aboutmember(
	m_id varchar2 (30 char) primary key,
	m_pw varchar2 (30 char) not null,
	m_name varchar2 (30 char) not null,
	m_number varchar2 (30 char) not null,
	m_email varchar2 (30 char) not null,
	m_gender varchar2 (20 char) not null,
	m_photo varchar2 (500 char) not null
);

insert into member values('hjj', 'hjj', '효진', 'ad@asd', 'f', 'sdf');

select * from aboutmember