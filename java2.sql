/* ���̺���� */
create table students(
  sno char(6) not null primary key, /*�й�*/
  sname varchar(20) not null, /*�̸�*/
  dept varchar(20) not null, /*�а�*/
  birthday date, /*�������*/
  year int default 1 /*�г�*/
);

desc students;
drop table students;

insert into students(sno, sname, dept, birthday)
values('202301', 'ȫ�浿', '����', '2000-03-22');
insert into students(sno, sname, dept, birthday)
values('202302', '��û��', '����', '2000-10-04');
insert into students(sno, sname, dept, birthday)
values('202303', '�̼���', '����', '2000-12-25');
--insert into �� values�� ��Ʈ �� ����ؾ���

select * from students;
delete from students where sno='202301';  
select * from students where sname like '%��%';
select * from students where sname like '%��%'
order by sname, birthday asc;

select max(sno)+1 newno from students;

update students 
set birthday = '2000-01-01' 
where sno = '202301';

delete from students
where sno = '202301';

commit;

select * from students;