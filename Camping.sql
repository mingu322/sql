--ķ���� ���̺�
CREATE TABLE CAMP(
  CNO CHAR(3) NOT NULL PRIMARY KEY,
  CNAME VARCHAR(100) NOT NULL,
  JUSO VARCHAR(500),
  TEL VARCHAR(20)
);

INSERT INTO CAMP(CNO, CNAME, JUSO, TEL)
VALUES ('100', '���丮ķ����', '������', '010-1010-1010');
INSERT INTO CAMP(CNO, CNAME, JUSO, TEL)
VALUES ('101', '�ֹ�ķ����', '��⵵', '010-1010-1020');
INSERT INTO CAMP(CNO, CNAME, JUSO, TEL)
VALUES ('102', '�ϴ�ķ����', '��õ', '010-1010-1030');
SELECT * FROM CAMP;

--�ü��� ���̺�
CREATE TABLE FACIL(
  FNO INT NOT NULL PRIMARY KEY,
  FNAME VARCHAR(100) NOT NULL
);

INSERT INTO FACIL VALUES (0,'����');
INSERT INTO FACIL VALUES (1,'����');
INSERT INTO FACIL VALUES (2,'��������');
INSERT INTO FACIL VALUES (3,'ȭ���');
INSERT INTO FACIL VALUES (4,'������');
SELECT * FROM FACIL;

--Ÿ�� ���̺�
CREATE TABLE TYPE(
  TNO INT NOT NULL PRIMARY KEY,
  TNAME VARCHAR(100) NOT NULL
);

INSERT INTO TYPE VALUES(0, 'ī���');
INSERT INTO TYPE VALUES(1, '�۷���');
INSERT INTO TYPE VALUES(2, '����ķ��');
INSERT INTO TYPE VALUES(3, '���');
SELECT * FROM TYPE;

--ķ���� �� �ü���
CREATE TABLE CAMP_FACIL(
  CNO CHAR(3) NOT NULL,
  FNO INT NOT NULL,
  PRIMARY KEY(CNO, FNO),
  FOREIGN KEY(CNO) REFERENCES CAMP(CNO),
  FOREIGN KEY(FNO) REFERENCES FACIL(FNO)
);

--ķ���� �� Ÿ��
CREATE TABLE CAMP_TYPE(
 CNO CHAR(3) NOT NULL,
 TNO INT NOT NULL,
 PRIMARY KEY(CNO, TNO),
 FOREIGN KEY(CNO) REFERENCES CAMP (CNO),
 FOREIGN KEY(TNO) REFERENCES TYPE (TNO)
);

--100�� ķ���忡 �ü��� 0,1,2
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('100', 0);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('100', 1);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('100', 2);
--101�� ķ���忡 �ü��� 0,1
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('101', 0);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('101', 1);
--102�� ķ���忡 �ü��� 0,3
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('102', 0);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('102', 3);
SELECT * FROM CAMP_FACIL;

--100�� ķ���忡 1,2
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES ('100', 1);
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES ('100', 2);
--101�� ķ���忡 �ü��� 1
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES ('101', 1);
--102�� ķ���忡 �ü��� 2
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES ('102', 2);
SELECT * FROM CAMP_TYPE;

COMMIT; 

--ķ���庰 �ü�����ȣ, �ü����̸�]
CREATE VIEW VIEW_FACIL AS
SELECT C.*, F.FNAME
FROM CAMP_FACIL C, FACIL F
WHERE C.FNO=F.FNO;

SELECT * FROM VIEW_FACIL WHERE CNO='100';

--ķ���庰 ������ȣ, �����̸� 
SELECT C.*, T.TNAME
FROM CAMP_TYPE C, TYPE T
WHERE C.TNO=T.TNO;

select * from facil;