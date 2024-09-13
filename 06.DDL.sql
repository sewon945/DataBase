   -- CHAPTER 06. DDL --

 -- DDL�̶�?
--> ������ ���Ǿ�� ���̺� ���� ����� ��ü�� ����ų� �����Ѵ�.
 
 
   --[ DDL�� ��ɾ� ���� ]
-- CREATE   : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- ALTER    : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- RENAME   : ���̺��� �̸��� �����ϴ� ��ɾ�
-- TRUNCATE : ���̺��� �����͸� �����ϴ� ��ɾ�
-- DROP     : ���̺��� ��ü�� �����ϴ� ��ɾ�



   -- [ ���̺� ���� �� ���� ����ϴ� �ڷ��� ]

-- VARCHAR2 (N) : ������ ������, Nũ�� ��ŭ �Է¹޴´�.

-- NUMBER(P,S) : ������ ���� P�ڸ� ��ŭ �Է¹ް� S�ڸ� ��ŭ �Ҽ��� �Է¹޴´�
 --> NUMBER(3,2) => 9.99 , NUMBER(5,3) => 99.999 , �߸��� ��) AGE NUMBER(3,1) => 99.9
  --> ����Ŭ �����ͺ��̽������� �Ǽ��� ���� ��� ǥ���� �����ϴ�.
  --> �Ұ�ȣ�� �����ϰ� �Ǹ� �ִ밪�� 38ũ�Ⱑ ����.

-- DATE : ���� ��¥ ���� �Է¹޴´�.



   -- ���̺� ���� ��Ģ
-- ��ҹ��� ����X
-- �ߺ��Ǵ� ���̺��X
-- ���̺� ������ �÷��� �ߺ�X
-- ���ڷ� ����O , ����� ��� �Ұ��� ( Ư�����ڴ� _ ,$ , # ��밡�� )



  -- ���̺� ����
-- CREATE TABLE  ���̺� ��(
--        �÷���1 �ڷ���(ũ��)
--        �÷���1 �ڷ���(ũ��)
--        ...
--        �÷���N �ڷ���(ũ��)
--        ) ;
    

  -- [ ���̺� �����ϱ� ]
  
-- ���������� ���̺��� �����ؼ� TEST_���������� ���̺� ����
 --> ������������ �巹�� �� �ڿ� SHIFT + F4 -> ���̺� ����
CREATE TABLE TEST_����������(
    �л�ID VARCHAR2(9) PRIMARY KEY ,
    �л��̸� VARCHAR2(50) NOT NULL ,
    �Ҽӹ� VARCHAR2(5)
) ;

SELECT * FROM TEST_���������� ;


-- ����ǥ ���̺��� ������ TEST_����ǥ ���̺� ����
CREATE TABLE TEST_����ǥ(
    �л�ID VARCHAR2(9),
    ���� VARCHAR2(30),
    ���� NUMBER
);

SELECT * FROM TEST_����ǥ;



-- �ǽ�) ���̺� �̸��� ���̺��_LOGIN ���� ����
      --> �α��� ����� �ϱ� ���� ���̵�, ��й�ȣ, �̸���, �̸� ������ ���� ����
CREATE TABLE ASDFG_LOGIN(
    ID VARCHAR2(20),
    PW VARCHAR2(20),
    EMAIL VARCHAR2(20),
    NAME VARCHAR2(20)
);

SELECT * FROM ASDFG_LOGIN;



  -- ���� �����̶�?
 --> ���̺� �Է� ������ �����͸� �������� �����ϴ� ��
--> �������� ��Ȯ���� �����ϱ� ���� �������� ����
--> ���� ���� ���� ��Ŀ� ���� �����ͤ� �����̳� ���� ���ο� ������ ����


   -- [ ���� ������ ���� ]

-- PRIMARY KEY (PK) : �⺻Ű, NOT  NULL + UNIQUE -> NULL �Ұ� + �ߺ� �Ұ�
                 --   �ϳ��� ���̺� ������ �ϳ��� PRIMARY KEY�� �־�� �Ѵ�.
                 --   �⺻Ű�� ���� �÷�, �Ǵ� ���� ���� �÷����� ���� ����
                 --   �ĺ��� ��Ģ�� ������ �𵨸� �� ������ NULL�� �ԷºҰ�, �ߺ��Ұ��� Ư¡�� ������
                  --> �ĺ��� : ���̺��� ���� �ĺ��� �� �ִ� �÷�
-- UNIQUE KEY (UK)  : ����Ű , NULL �� �Է� ���������� �ߺ��� �Ұ��� 
-- NOT NULL         : NULL�� �Ұ���, �� �ԷµǾ�� �ϴ� �������̴� �� �� ���� 
-- CHECK            : T OR F �� ���� �� �ִ� ���� ����, ������ �����͸� �Է� ���� 
                 --   �������� ���¿� ������ ���Ѵ�.
                 --   Ư�� �÷��� �����͸� �Է��� �� ������ �����͸� �Է� ����
-- FOREIGN KEY (FK) : �ܷ�Ű, ���̺��� �����ϴ� Ű


  -- ������ ���Ἲ�̶�?
-- �����Ϳ� ������ ���� ����. ��, �����Ͱ� ��Ȯ�ϰ� ��ȿ�ϰ� ������ ����


   -- ���Ἲ ���� ������ ����
-- ��ü ���Ἲ(PK) : �⺻Ű �����̶�� �ϸ�, �ϳ��� ���̺� �ߺ��� ���� �������� �ʵ��� ����
-- ���� ���Ἲ(FK) : ���� �Է�, ����, ���� �� �� �����Ǵ� �ٸ� ���̺�� �����Ͱ� ��Ȯ�ϰ� �����ǵ��� ����
              --   ���� ���迡 �ִ� �� ���̺��� �����Ͱ� �׻� �ϰ��� ���� ������ ��



  -- [ �̹� ������ ���̺� �������� �����ϱ� ]
   
SELECT * FROM ASDFG_LOGIN;

-- �ǽ�) ���̺� PK �������� �����ϱ�
-- ALTER TABLE  ���̺��  ADD CONSTRAINT  ���������̸�  ��������(�÷�) ;
ALTER TABLE ASDFG_LOGIN ADD CONSTRAINT ASDFG_ID_PK PRIMARY KEY(ID) ;


-- �ǽ�) ���̺� UK �������� �����ϱ�
-- ALTER TABLE  ���̺��  ADD CONSTRAINT  ���������̸�  ��������(�÷�) ;
ALTER TABLE ASDFG_LOGIN ADD CONSTRAINT ASDFG_EMAIL_UK UNIQUE(EMAIL);


-- �ǽ�) CHECK �������� �����ϱ�
ALTER TABLE ASDFG_LOGIN ADD CONSTRAINT ASDFG_PW_CHECK CHECK(LENGTH(PW) > 3);



  -- [ �̹� ������ ���̺� FK �������� ���� ]
   
-- ALTER TABLE  ���̺��  ADD CONSTRAINT  ���������̸�  ��������(�÷�)
-- REFERENCES  �������̺�(�����÷���);
ALTER TABLE TEST_����ǥ ADD CONSTRAINT �л�ID_FK FOREIGN KEY(�л�ID)
REFERENCES ����������(�л�ID) ;



  -- [ �������� �����ϱ� ]
   
-- ALTER TALBLE  ���̺��̸�  MODIFY  �÷���  �ٲ� �������� ;
ALTER TABLE ASDFG_LOGIN MODIFY NAME NOT NULL ;



  -- [ �������� �����ϱ� ]
   
-- ALTER TABLE  ���̺��  DROP CONSTRAINT  ���������̸� ;
ALTER TABLE ASDFG_LOGIN DROP CONSTRAINT ASDFG_PW_CHECK;



  -- [ ���̺� �����ϱ� ]
   
-- ���̺� ���� ��� 1)
CREATE TABLE TB_TEST1(
    PK�׽�Ʈ NUMBER PRIMARY KEY,
    UK�׽�Ʈ NUMBER UNIQUE,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER CHECK(LENGTH(CKü��Ʈ) > 5)
);

-- ���̺� ���� ��� 2)
CREATE TABLE TB_TEST1(
    PK�׽�Ʈ NUMBER,
    UK�׽�Ʈ NUMBER,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER,
    FK�׽�Ʈ NUMBER,
    -- �������� �߰�
    -- CONSTRAINT  �������Ǹ�  ��������(�÷�)
    CONSTRAINT PK�׽�Ʈ_PK PRIMARY KEY (PK�׽�Ʈ),
    CONSTRAINT UK�׽�Ʈ_UK UNIQUE (UK�׽�Ʈ),
    CONSTRAINT CK�׽�Ʈ_CK CHECK(CK�׽�Ʈ > 0),
    CONSTRAINT FK�׽�Ʈ_FK FOREIGN KEY(FK�׽�Ʈ) REFERENCES TB_TEST1(PK�׽�Ʈ)
);



  -- [ ���̺� �÷� �߰��ϱ� ]
   
--ALTER TABLE  ���̺��  ADD  �÷���  �ڷ���(ũ��);
ALTER TABLE ASDFG_LOGIN ADD ADDRESS VARCHAR2(10) ;

SELECT * FROM ASDFG_LOGIN ;



  -- [ �÷��� �ڷ��� �����ϱ� ]
   
-- ALTER TABLE  ���̺��  MODIFY  �÷���  �ٲ� ��������(����) ; 
ALTER TABLE ASDFG_LOGIN MODIFY ADDRESS VARCHAR2(20) ;



  -- [ �÷� �̸� �����ϱ� ]
   
ALTER TABLE ASDFG_LOGIN RENAME COLUMN ADDRESS TO ADDR ;



  -- [ Ư�� �÷� �����ϱ� ]
ALTER TABLE ASDFG_LOGIN DROP COLUMN ADDR ;



  -- [ ���̺� �̸� �����ϱ� ]
RENAME ASDFG_LOGIN TO ASDF_LOGIN ;

SELECT * FROM ASDF_LOGIN ;



  -- [ ���̺� �����ϱ� ]
   
-- DROP TABLE ���̺�� ;
DROP TABLE TEST_���������� ;

DROP TABLE TEST_����ǥ ;



  -- [ ���̺� �����ϱ� ]
   
CREATE TABLE DROP_����ǥ AS SELECT * FROM ����ǥ ;
 --> ����ǥ ���̺�� ������ �����͸� ������ ���̺��� �����ϴ� ������
 --> ���������� ���簡 ���� �ʴ´� (NOT NULL�� ����)

SELECT * FROM DROP_����ǥ;



  -- [ ���̺��� ������ ���� ���� ]
   
-- TRUNCATE TABLE  ���̺�  �̸� ;
TRUNCATE TABLE DROP_����ǥ ;






