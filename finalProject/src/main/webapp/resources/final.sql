create table final_member(
	id varchar2(20) primary key,
	pwd varchar2(20) not null,
	name varchar2(20) not null,
	hp varchar2(20) not null,
	email varchar2(50) not null,
	address varchar2(50) not null,
	picture varchar2(50) not null,
	departmentCode number(20),
	gradeCode varchar2(20),
	hiredate date,
	firedate date,
	confirm varchar2(2) not null
);

insert into final_member values('admin', '123','123', '123', '123', '123', '123', 123, 'g5', sysdate, null, 'y');

create sequence final_member_seq
start with 10001
nocache;
----------------------------------
create table final_departmentCode(
num number primary key,
name varchar2(20)not null
);

create sequence final_departmentCode_seq
start with 16
nocache;

insert into final_departmentCode values(11, '�λ���');
insert into final_departmentCode values(12, '������');
insert into final_departmentCode values(13, '�ѹ���');
insert into final_departmentCode values(14, '������');
insert into final_departmentCode values(15, '�濵��');
----------------------------------
create table final_gradeCode(
num varchar2(20) primary key,
name varchar2(20)not null
);

insert into final_gradeCode values('g1', '���');
insert into final_gradeCode values('g2', '�븮');
insert into final_gradeCode values('g3', '����');
insert into final_gradeCode values('g4', '����');
insert into final_gradeCode values('g5', '����');


-------------------------------------

drop table final_approval;
drop table final_apv_set;
drop table final_documents;

drop sequence final_docs_seq;
drop sequence final_apv_set_seq;
drop sequence final_approval_seq;

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
	log varchar2(100) not null
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

commit;