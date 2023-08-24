/* ���̺� ���� */
create table tbl_juso(
  no int primary key,
  name varchar(20) not null,
  juso varchar(500),
  phone varchar(20)
);

/*���̺� ���� Ȯ��*/
desc tbl_juso;

/*���̺� ����*/
drop table tbl_juso;

/*�������Է�*/
insert into tbl_juso(no, name, juso, phone)
values(10, 'ȫ�浿', '��õ', '010-2020-2020');
insert into tbl_juso(no, name, juso, phone)
values(11, '�̼���', '����', '010-2020-2030');
insert into tbl_juso(no, name, juso, phone)
values(12, '��û��', '�λ�', '010-2020-2040');
insert into tbl_juso(no, name, juso, phone)
values(13, '������', '����', '010-2020-2050');

/* ��������� */
select * from tbl_juso where no=12;
select * from tbl_juso order by name desc;
select * from tbl_juso where name like '%��%';

/* �����ͼ��� */
update tbl_juso 
set name='��浿', juso='��⵵' 
where no = 10;

/* �����ͻ��� */
delete from tbl_juso where no=10;

commit;


