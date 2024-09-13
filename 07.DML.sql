   -- CHAPTER 07. DML(Data Manipulation Language) --

-- �ǽ�) ���̺� �̸��� ���̺��_JOIN ���� ����
--      ȸ������ ����� �ϱ� ���ؼ� ���̵�, ��й�ȣ, �̸�, ���Գ�¥, ����, ��ȭ��ȣ, �̸��� ������ ���� �����̴�
--      �÷���, �ڷ���, �������� �ۼ�
CREATE TABLE ASDFG_JOIN(
    ID VARCHAR2(20) PRIMARY KEY ,
    PW VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(10) NOT NULL,
    JOIN_DATE DATE ,
    AGE NUMBER(3),
    TEL VARCHAR2(20),
    EMAIL VARCHAR2(50) UNIQUE
);

SELECT * FROM ASDFG_JOIN ;



  -- DML�̶�?
--> ������ ���۾�� ���̺� �����͸� ��ȸ, �߰�, ����, ���� �� �� ����ϴ� ���Ǿ��̴�.
 --> ���̺��� ���ϴ� �����͸� �Է�, ����, �����Ѵ�!!


  -- [ DML�� ���� -(���ξ���)
-- SELECT : ������ ��ȸ
-- INSERT : ������ �߰�
-- UPDATE : ������ ����
-- DELETE : ������ ����


 -- ����� 1)
-- INSERT INTO ���̺�� ( �÷�1 , �÷�2, ...)
-- VALUES( ��1 , ��2, ...) ; 
 --> INSERT INTO �� �Է��� �÷��� VALUES �� �Է��� ���� ������ �ڷ����� �¾ƾ��Ѵ�!!

 -- ����� 2)
-- INSERT INTO ���̺��
-- VALUES( �Է°�... );
 --> INSERT INTO �� �÷� ����Ʈ�� ���� �� VALUES �� �Է��� ���� ���̺��� �÷� ���� ������ �¾ƾ��Ѵ�!!



-- 1. ASDFG_JOIN ���̺� ���� ���� �ֱ�
INSERT INTO ASDFG_JOIN(ID, PW, NAME, JOIN_DATE, AGE, TEL,EMAIL)
VALUES ('ASDFG1', '12345', '������', SYSDATE, 24, '010-2882-9690', 'energizer710@naver.com') ;

SELECT * FROM ASDFG_JOIN ;


-- 2. ģ�� ���� �ֱ�
INSERT INTO ASDFG_JOIN(ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('ASDFG2', '56789', '������', SYSDATE, 24, '010-8847-6135', 'rornf@naver.com');



-- 1) ���̺� NULL�� �Է��ϱ�  --> NULL�� ��������� �Է������.
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('ASDFG3', '11111', '��漱', SYSDATE, 24, NULL, '');


-- 2) ���̺� NULL�� �Է��ϱ�  --> NULL�� �Ͻ������� �Է������.
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOIN_DATE, AGE)
VALUES ('ASDFG4', '22222', '�̽���', SYSDATE, 24 );



   -- ���̺� ������ ���� ����Ʈ 

-- 1. �÷�����Ʈ�� �Է� ���� ������ �ٸ� ���
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL ����: ORA-00913: too many values 
--> �÷� ����Ʈ�� ������ �Է� �� ������ ��ġ�ؾ� �Ѵ�!

-- 2. �ĺ��ڿ� NULL�� �Է��� ���
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."ASDFG_JOIN"."ID")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� (�ĺ��ڴ� NOT NULL + UNIQUE �ߺ��Ұ�)

-- 3. NOT NULL�� �÷��� NULL�� ���� ���
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."ASDFG_JOIN"."NAME")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� ( NOT NULL ���� )

-- 4. �ڷ����� ���� �ʰ� �Է� ���� ���� ���
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, '29��', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> �÷��� ���� �ڷ����� �°� �ۼ��� �Ǿ� �Ѵ�. (AGE�� ������ �ڷ���)

-- 5. �ĺ��� �÷��� �ߺ� ���� ���� ���� ���
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> ���� �� ���¿��� �ѹ��� ������ �Ǹ� �ĺ��ڰ� ���� �ߺ��� �Ǽ� ������ ��

SELECT * FROM ASDFG_JOIN;



 -- 1) �÷�����Ʈ�� ���� �ʰ� INSERT �ϴ� ���
INSERT INTO ASDFG_JOIN
VALUES ('ASDFG5','00000','������', SYSDATE, 46, '010-5886-7250', 'oksjis111@naver.com');
--> ���� �Է°��� ���� ���� ���̺� ��õ� �÷��� ������ �Ȱ��� ����Ѵ�!

 -- 2) �÷�����Ʈ�� ���� �ʰ� INSERT �ϴ� ��� - ����
INSERT INTO ASDFG_JOIN
VALUES ('ASDFG6','00000','������', SYSDATE, 46, '010-5886-7250');
--> ���� �Է°��� ���� ���� ���̺� ��õ� �÷��� ������ �Ȱ��� ����Ѵ�! 



 -- UPDATE ��� ���
 
-- UPDATE ���̺��
--    SET ������ �÷� = ������ ������, .....
--  WHERE �����͸� ������ ��� ���� �����ϱ� ���� ���ǽ� ;
 ---> *** WHERE �������� ������ ��� ���̺� �� ����� ��� �÷��� �����Ͱ� ������ �ȴ�!!

SELECT * FROM ASDFG_JOIN ;

UPDATE ASDFG_JOIN
   SET AGE = 47 
 WHERE NAME = '������' ;


-- ������ �� ������ PK�� �Ŵ� ���� ���� �ùٸ���!
UPDATE ASDFG_JOIN
   SET TEL = '010-4879-1406' , EMAIL = 'LEE@NAVER.COM'
 WHERE ID = 'ASDFG4' ;



  -- DELETE : �����͸� ������ �� ����ϴ� ��ɾ�
 -- DELETE �����
 
-- DELETE FROM ���̺��
-- WHERE ������ ��� ���� �����ϱ� ���� ���ǽ� ;
 --> *** WHERE �������� ������ ��� ���̺��� ��� �����Ͱ� �����ȴ�!!

DELETE FROM ASDFG_JOIN
WHERE ID = 'ASDFG4' ;


-- 30�� ������ ȸ������ ���� ����
DELETE FROM ASDFG_JOIN
 WHERE AGE <= 30 ;

ROLLBACK;   --> ó������ �ǵ����� ��ɾ� 

SELECT * FROM ASDFG_JOIN;

DELETE FROM ASDFG_JOIN ;





