--캠핑장 테이블
CREATE TABLE CAMP(
  CNO CHAR(3) NOT NULL PRIMARY KEY,
  CNAME VARCHAR(100) NOT NULL,
  JUSO VARCHAR(500),
  TEL VARCHAR(20)
);

INSERT INTO CAMP(CNO, CNAME, JUSO, TEL)
VALUES ('100', '도토리캠핑장', '강원도', '010-1010-1010');
INSERT INTO CAMP(CNO, CNAME, JUSO, TEL)
VALUES ('101', '솔밭캠핑장', '경기도', '010-1010-1020');
INSERT INTO CAMP(CNO, CNAME, JUSO, TEL)
VALUES ('102', '하늘캠핑장', '인천', '010-1010-1030');
SELECT * FROM CAMP;

--시설물 테이블
CREATE TABLE FACIL(
  FNO INT NOT NULL PRIMARY KEY,
  FNAME VARCHAR(100) NOT NULL
);

INSERT INTO FACIL VALUES (0,'전기');
INSERT INTO FACIL VALUES (1,'수도');
INSERT INTO FACIL VALUES (2,'와이파이');
INSERT INTO FACIL VALUES (3,'화장실');
INSERT INTO FACIL VALUES (4,'수영장');
SELECT * FROM FACIL;

--타입 테이블
CREATE TABLE TYPE(
  TNO INT NOT NULL PRIMARY KEY,
  TNAME VARCHAR(100) NOT NULL
);

INSERT INTO TYPE VALUES(0, '카라반');
INSERT INTO TYPE VALUES(1, '글램핑');
INSERT INTO TYPE VALUES(2, '오토캠핑');
INSERT INTO TYPE VALUES(3, '펜션');
SELECT * FROM TYPE;

--캠핑장 별 시설물
CREATE TABLE CAMP_FACIL(
  CNO CHAR(3) NOT NULL,
  FNO INT NOT NULL,
  PRIMARY KEY(CNO, FNO),
  FOREIGN KEY(CNO) REFERENCES CAMP(CNO),
  FOREIGN KEY(FNO) REFERENCES FACIL(FNO)
);

--캠핑장 별 타입
CREATE TABLE CAMP_TYPE(
 CNO CHAR(3) NOT NULL,
 TNO INT NOT NULL,
 PRIMARY KEY(CNO, TNO),
 FOREIGN KEY(CNO) REFERENCES CAMP (CNO),
 FOREIGN KEY(TNO) REFERENCES TYPE (TNO)
);

--100번 캠핑장에 시설물 0,1,2
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('100', 0);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('100', 1);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('100', 2);
--101번 캠핑장에 시설물 0,1
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('101', 0);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('101', 1);
--102번 캠핑장에 시설물 0,3
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('102', 0);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES ('102', 3);
SELECT * FROM CAMP_FACIL;

--100번 캠핑장에 1,2
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES ('100', 1);
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES ('100', 2);
--101번 캠핑장에 시설물 1
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES ('101', 1);
--102번 캠핑장에 시설물 2
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES ('102', 2);
SELECT * FROM CAMP_TYPE;

COMMIT; 

--캠핑장별 시설물번호, 시설물이름]
CREATE VIEW VIEW_FACIL AS
SELECT C.*, F.FNAME
FROM CAMP_FACIL C, FACIL F
WHERE C.FNO=F.FNO;

SELECT * FROM VIEW_FACIL WHERE CNO='100';

--캠핑장별 유형번호, 유형이름 
SELECT C.*, T.TNAME
FROM CAMP_TYPE C, TYPE T
WHERE C.TNO=T.TNO;

select * from facil;