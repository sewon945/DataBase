DROP TABLE �л��������� ;
DROP TABLE ���������� ; 
DROP TABLE ����ǥ ; 

CREATE TABLE ���������� (
�л�ID   VARCHAR2(9) PRIMARY KEY , 
�л��̸�  VARCHAR2(50) NOT NULL , 
�Ҽӹ�    VARCHAR2(5) 
); 

CREATE TABLE ����ǥ ( 
    �л�ID VARCHAR2(9) , 
    ����   VARCHAR2(30) , 
    ����   NUMBER  , 
    CONSTRAINT PK_����ǥ PRIMARY KEY(�л�ID , ����) , 
    CONSTRAINT FK_����ǥ FOREIGN KEY(�л�ID) REFERENCES ����������(�л�ID) 
)  ; 

INSERT INTO ���������� VALUES ('SMHRD1' , '���ؿ�' , 'A') ; 
INSERT INTO ���������� VALUES ('SMHRD2' , '�ڼ���' , 'A') ; 
INSERT INTO ���������� VALUES ('SMHRD3' , '�ں���' , 'B') ; 
INSERT INTO ���������� VALUES ('SMHRD4' , '�̸���' , 'B') ; 
INSERT INTO ���������� VALUES ('SMHRD5' , '����ȣ' , 'B') ; 
INSERT INTO ���������� VALUES ('SMHRD6' , '����ǥ' , 'C') ; 
INSERT INTO ���������� VALUES ('SMHRD7' , '�ֿ�ȭ' , 'C') ; 
INSERT INTO ���������� VALUES ('SMHRD8' , '����ȣ' , 'C') ; 
INSERT INTO ���������� VALUES ('SMHRD9' , '�ӽ�ȯ' , 'C') ; 

INSERT INTO ����ǥ VALUES('SMHRD1'  ,'JAVA' , 90); 
INSERT INTO ����ǥ VALUES('SMHRD1'  ,'DATABASE' , 85); 
INSERT INTO ����ǥ VALUES('SMHRD1'  ,'PYTHON' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD2'  ,'JAVA' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD2'  ,'DATABASE' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD2'  ,'PYTHON' , 20); 
INSERT INTO ����ǥ VALUES('SMHRD3'  ,'JAVA' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD3'  ,'DATABASE' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD3'  ,'PYTHON' , 20); 
INSERT INTO ����ǥ VALUES('SMHRD4'  ,'JAVA' , 85); 
INSERT INTO ����ǥ VALUES('SMHRD4'  ,'DATABASE' , 40); 
INSERT INTO ����ǥ VALUES('SMHRD4'  ,'PYTHON' , 60); 
INSERT INTO ����ǥ VALUES('SMHRD5'  ,'JAVA' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD5'  ,'DATABASE' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD5'  ,'PYTHON' , 100); 
INSERT INTO ����ǥ VALUES ( 'SMHRD6' , 'JAVA' , NULL ) ; 
INSERT INTO ����ǥ VALUES ( 'SMHRD6' , 'DATABASE' , NULL ) ; 
INSERT INTO ����ǥ VALUES ( 'SMHRD6' , 'PYTHON' , NULL ) ; 

COMMIT;

SELECT * 
  FROM ���������� ;
  
SELECT * 
  FROM ����ǥ ;

