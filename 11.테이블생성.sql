-- 테이블 생성
-- DataMember
-- id varchar2(50) pk, pw varchar2(50), name varchar2(50), age number
-- id에는 제약조건 pk 걸어두기

CREATE TABLE DATAMEMBER(
    ID VARCHAR2(50) PRIMARY KEY,
    PW VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(50) NOT NULL,
    AGE NUMBER
);

SELECT * FROM DATAMEMBER;











