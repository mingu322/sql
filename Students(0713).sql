--�л� ���̺� ����
CREATE TABLE STUDENTS(
  SCODE CHAR(6) NOT NULL PRIMARY KEY,
  SNAME VARCHAR(20) NOT NULL,
  DEPT VARCHAR(20) NOT NULL
);
DESC STUDENTS;

--���� ���̺� ����
CREATE TABLE COURSES(
  CCODE CHAR(3) NOT NULL PRIMARY KEY,
  CNAME VARCHAR(100) NOT NULL
);

--������û ���̺� ����
CREATE TABLE ENROLS(
  SCODE CHAR(6) NOT NULL,
  CCODE CHAR(3) NOT NULL,
  GRADE INT DEFAULT 0,
  EDATE DATE DEFAULT SYSDATE,
  PRIMARY KEY(SCODE, CCODE),
  FOREIGN KEY(SCODE) REFERENCES STUDENTS(SCODE),
  FOREIGN KEY(CCODE) REFERENCES COURSES(CCODE)
);

INSERT INTO STUDENTS(SCODE, SNAME, DEPT)
VALUES ('202301', 'ȫ�浿', '����');
INSERT INTO STUDENTS(SCODE, SNAME, DEPT)
VALUES ('202302', '�谨��', '����');
INSERT INTO STUDENTS(SCODE, SNAME, DEPT)
VALUES ('202303', '��û��', '����');

SELECT * FROM STUDENTS;

INSERT INTO COURSES(CCODE, CNAME)
VALUES ('100', '�ڹ�');
INSERT INTO COURSES(CCODE, CNAME)
VALUES ('101', '�����ͺ��̽�');
INSERT INTO COURSES(CCODE, CNAME)
VALUES ('102', 'HTML');

SELECT * FROM COURSES;

INSERT INTO ENROLS(SCODE, CCODE)
VALUES ('202301', '100');
INSERT INTO ENROLS(SCODE, CCODE)
VALUES ('202301', '102');
INSERT INTO ENROLS(SCODE, CCODE)
VALUES ('202302', '101');
INSERT INTO ENROLS(SCODE, CCODE)
VALUES ('202302', '102');
INSERT INTO ENROLS(SCODE, CCODE)
VALUES ('202303', '102');

SELECT * FROM ENROLS;

CREATE VIEW VIEW_ENROLS AS
SELECT E.*, S.SNAME, C.CNAME
FROM ENROLS E, STUDENTS S, COURSES C
WHERE E.SCODE=S.SCODE AND C.CCODE=E.CCODE;

SELECT * FROM VIEW_ENROLS ORDER BY SCODE;

COMMIT;

SELECT MAX(SCODE)+1 NCODE FROM STUDENTS;
INSERT INTO STUDENTS(SCODE, SNAME, DEPT)
VALUES (SELECT MAX(SCODE)+1 NCODE FROM STUDENTS, '��浿', '����';

select * from view_enrols where scode = '202303';
select * from view_enrols where scode = '202301' and ccode = 102;