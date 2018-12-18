/*
����

1. com.project.erp.member
memberController ����    private String defaultPath = ���� member ����� ��� �ٿ��ִ´� 

2.com.project.erp.approval
ApvController ����   ���� approvals ����� ��� �ٿ��ִ´� 

3.com.project.erp.docs
DocController ����   ���� documents ����� ��� �ٿ��ִ´�

4.�������� �Ҷ��� ���������� ������ �ҷ��´�.
���� ��������

*/

drop table final_approval;
drop table final_apv_set;
drop table final_documents;
drop sequence final_docs_seq;
drop sequence final_apv_set_seq;
drop sequence final_approval_seq;

drop table final_community_article;
drop table final_community;
drop sequence final_community_article_seq;
drop sequence final_community_seq;

drop table final_notice_rep;
drop table final_notice;
drop sequence final_notice_rep_seq;
drop sequence final_notice_seq;

drop table final_multiplechoice;
drop table final_question;
drop table final_survey;
drop sequence final_survey_seq;

drop table final_chat;
drop sequence final_chat_seq;
drop table final_gradeCode;
drop table final_departmentcode;
drop sequence final_departmentcode_seq;
drop table final_member;
drop sequence final_member_seq;
commit;

---ȸ��/���� part
----------------------------------------------------------------------------------------------------------------
create table final_departmentCode(
	num number primary key,
	name varchar2(20) not null
);

create sequence final_departmentcode_seq start with 13 nocache;

--- admin���� �����ϸ� �� ��������
insert into final_departmentCode values(11, '�λ���');
insert into final_departmentCode values(12, '������');

create table final_gradecode(
	num varchar2(20) primary key,
	name varchar2(20)not null
);
--- admin���� �����ϸ� �� ��������
insert into final_gradeCode values('g1', '���');
insert into final_gradeCode values('g2', '�븮');
insert into final_gradeCode values('g3', '����');
insert into final_gradeCode values('g4', '����');
insert into final_gradeCode values('g5', '����');

create table final_member(
	id varchar2(20) primary key,
	pwd varchar2(20) not null,
	name varchar2(20) not null,
	hp varchar2(20) not null,
	email varchar2(50) unique not null,
	address varchar2(50) not null,
	picture varchar2(50) not null,
	departmentcode number(20) references final_departmentcode(num),
	gradecode varchar2(20) references final_gradecode(num),
	hiredate date,
	firedate date,
	confirm varchar2(2) not null
);
insert into final_member values('admin', '123','admin', '123', '123', '123', '123', 11, 'g5', sysdate, null, 'y');
create sequence final_member_seq start with 10001 nocache;

create table final_chat(
	num number(20) primary key,
	sendEmail varchar2(50) not null references final_member(email),
	title varchar2(2000) not null,
	getEmail varchar2(50) not null references final_member(email),
	content varchar2(2000) not null,
	read varchar2(50) not null
);
create sequence final_chat_seq nocache;

---���� part
----------------------------------------------------------------------------------------------------------------
create table final_documents (
	num number primary key,
	title varchar2(50) not null,
	path varchar2(100) not null
);

create table final_apv_set (
	num number primary key,
	status varchar2(20) not null
);

create table final_approval (
	num number primary key,
	id varchar2(30) references final_member(id),
	mid_id varchar2(30),
	fnl_id varchar2(30),
	apv_set_num number references final_apv_set(num),
	title varchar2(50) not null,
	apv_date date not null,
	path varchar2(100) not null,
	rejection varchar2(100),
	log varchar2(500) not null
);

create sequence final_docs_seq nocache;
create sequence final_apv_set_seq nocache;
create sequence final_approval_seq nocache;

/*
1 ����
2 ����
3 �ݷ� 
4 ����
5 �ݷ�
6 �ݷ�/�ź�
*/

insert into final_apv_set values(final_apv_set_seq.nextval, '����');
insert into final_apv_set values(final_apv_set_seq.nextval, '����(�߰�)');
insert into final_apv_set values(final_apv_set_seq.nextval, '�ݷ�');
insert into final_apv_set values(final_apv_set_seq.nextval, '����(����)');
insert into final_apv_set values(final_apv_set_seq.nextval, '�ݷ�');
insert into final_apv_set values(final_apv_set_seq.nextval, '�ݷ�/�ź�');



---Ŀ�´�Ƽ part
---------------------------------------------------------------------------------------------------------------
---[���� ���̺� DDL]
create table final_community (
	num number primary key,
	title varchar2(50) not null,
	content clob not null,
	writer varchar2(20) references final_member(id),
	w_date date not null,
	location varchar2(50) not null,
	nop number default 5 not null,
	clickcnt number default 0,
	attandant clob default null
);
---[���� ���̺� ������ DDL]
create sequence final_community_seq nocache;

---[���� ��� ���̺� DDL]

create table final_community_article (
	num number primary key,
	writer varchar2(20) references final_member(id),
	content varchar2(100) not null,
	w_date date,
	comm_num number references final_community(num) on delete cascade
);

---[���� ��� ���̺� DDL]
create sequence final_community_article_seq nocache;

---���� part
----------------------------------------------------------------------------------------------------------------
create table final_notice(
num number primary key,
w_date DATE not null,
title varchar2(500) not null,
content varchar2(1000) not null,
writer varchar2(20) references final_member(id),
view_count number
);

create sequence final_notice_seq nocache;


create table final_notice_rep(
num number primary key,
w_date DATE not null,
writer varchar2(20) references final_member(id),
content varchar2(100) not null,
n_num number references final_notice(num) on delete cascade
);

create sequence final_notice_rep_seq nocache;


----���� part
----------------------------------------------------------------------------------------------------------------
---survey ����
create table final_survey(
snum number primary key,
title varchar2(200),
registdate date,
modifydate date,
startdate date,
enddate date
);

---������ ������
create sequence final_survey_seq;

---question ����
create table final_question(
parent number references final_survey(snum),
qnum number primary key,
question varchar2(200),
atype varchar2(50)
);

---multiplechoice ������
create table final_multiplechoice(
snum_multiple number references final_survey(snum),
qnum_multiple number references final_question(qnum),
mnum number primary key,
mtext varchar2(100)
);

commit;