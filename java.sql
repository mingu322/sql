/* 테이블 생성 */
create table tbl_juso(
  no int primary key,
  name varchar(20) not null,
  juso varchar(500),
  phone varchar(20)
);

/*테이블 구조 확인*/
desc tbl_juso;

/*테이블 삭제*/
drop table tbl_juso;

/*데이터입력*/
insert into tbl_juso(no, name, juso, phone)
values(10, '홍길동', '인천', '010-2020-2020');
insert into tbl_juso(no, name, juso, phone)
values(11, '이순신', '서울', '010-2020-2030');
insert into tbl_juso(no, name, juso, phone)
values(12, '심청이', '부산', '010-2020-2040');
insert into tbl_juso(no, name, juso, phone)
values(13, '강감찬', '파주', '010-2020-2050');

/* 데이터출력 */
select * from tbl_juso where no=12;
select * from tbl_juso order by name desc;
select * from tbl_juso where name like '%이%';

/* 데이터수정 */
update tbl_juso 
set name='김길동', juso='경기도' 
where no = 10;

/* 데이터삭제 */
delete from tbl_juso where no=10;

commit;


