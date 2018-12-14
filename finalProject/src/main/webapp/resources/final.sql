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

insert into final_departmentCode values(11, '인사팀');
insert into final_departmentCode values(12, '생산팀');
insert into final_departmentCode values(13, '총무팀');
insert into final_departmentCode values(14, '구매팀');
insert into final_departmentCode values(15, '경영팀');
----------------------------------
create table final_gradeCode(
num varchar2(20) primary key,
name varchar2(20)not null
);

insert into final_gradeCode values('g1', '사원');
insert into final_gradeCode values('g2', '대리');
insert into final_gradeCode values('g3', '과장');
insert into final_gradeCode values('g4', '차장');
insert into final_gradeCode values('g5', '부장');


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
1 제출
2 승인
3 반려 
4 승인
5 반려
6 반려/거부
*/

insert into final_apv_set values(final_apv_set_seq.nextval, '제출');
insert into final_apv_set values(final_apv_set_seq.nextval, '승인(중간)');
insert into final_apv_set values(final_apv_set_seq.nextval, '반려');
insert into final_apv_set values(final_apv_set_seq.nextval, '승인(최종)');
insert into final_apv_set values(final_apv_set_seq.nextval, '반려');
insert into final_apv_set values(final_apv_set_seq.nextval, '반려/거부');

commit;