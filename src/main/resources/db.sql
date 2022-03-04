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


<<<<<<< HEAD
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
=======
UPDATE member SET m_number = '010-0000-0000' WHERE m_name='영백';
UPDATE member SET m_number = '010-1111-1111' WHERE m_name='효진';

ALTER TABLE member MODIFY (m_number NOT NULL);
>>>>>>> 17c75fa095d344a4053bb7f9ef4ac5a7b5a08f25
