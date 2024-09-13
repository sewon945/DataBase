   -- CHAPTER 05. JOIN --

   -- [ JOIN : ���� ���̺��� �ʿ��� �����͸� �� ���� �������� ���
-- �ʿ��� �����Ͱ� �� �� �̻� ���̺� �������� ���� �� �����͸� ���ļ� ���������� �� �� ���
-- �Ϲ������� ���Ǵ� SQL������ ��ټ��� ����


   -- Non EQUL JOIN : �� ����
-- �� ���� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ���� �ʴ� ��� Ȱ���ϴ� ����
--> �������(=)�� �ƴ� �����ڵ��� ����� ����( > , >= , <= , < , BETWEEN )
 
   --  EQUL JOIN : � ����
-- �� ���� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ�ϴ� ��� Ȱ���ϴ� ����
--> � �����ڸ� ����ؼ� ����( = )
 --> ���� ���� ���Ǵ� ������ ����
 
 
 
   -- [ � ���� ��� ��� ]
-- SELECT    ���̺�1.�÷�(��), ���̺�2.�÷�,... ->  �ش����̺� �ִ� �÷� ��ȸ
--   FROM    ���̺�1, ���̺�2                  ->  ���̺�1�� ���̺�2�� JOIN �ϰڴ�!!
--  WHERE    ���̺�1.�÷� = ���̺�2.�÷� ;      ->  ���� ���� ������ ���� ���� �ۼ�

--  WHERE���� JOIN ������ ����Ѵ�.


-- ����1) ���������� ���̺�� ����ǥ ���̺��� �л�ID, �̸�, ����, ���� ������ ���

-- 1. ������ ��� ���̺��� ���� Ȯ��
SELECT * FROM ����������;
SELECT * FROM ����ǥ;
-- 2. FROM���� ������ ���̺��� ,(�޸�)�� �������� �ۼ�
-- 3. ���� ������ �Ǵ� Ư�� �÷��� Ȯ���Ͽ�, WHERE�������� ���� ���� �ۼ�
 --> ���� ������ �Ǵ� Ư�� �÷� : ������ ���̺� ���� ���� ���� ������ �÷�!!
 --> ���� ������ �Ǵ� Ư�� �÷��� PK�� FK ����� ��κ� �̷������
 --> BUT, �� �׷� ���� �ƴ�!!
-- 4. SELECT���� ����ϰ��� �ϴ� �÷��� .(���)�� ���ؼ� ���
SELECT ����������.�л�ID , ����������.�л��̸�
     , ����ǥ.���� , ����ǥ.����
  FROM ���������� , ����ǥ
 WHERE ����������.�л�ID = ����ǥ. �л�ID ;



   -- FROM�� ��Ī Ȱ��

-- SELECT ��Ī1.�÷���, ��Ī2.�÷���,...
-- FROM ���̺�1 ��Ī1, ���̺�2 ��Ī2

 --> FROM �� ���̺� ��Ī�� �ְ� �Ǹ� ��Ī��� ���� 
--   ����Ǵ� ��(SELECT,WHERE��)���� ��� ��Ī�� ����ؾ� ��


-- ����1-1) ��Ī���
SELECT A.�л�ID , A.�л��̸�
     , B.���� , B.����
  FROM ���������� A , ����ǥ B
 WHERE A.�л�ID = B. �л�ID ;


-- ����2) ������ ����ID, FIRST_NAME, �μ��̸� ������ ��ȸ
-- 1. ���� ��� ���̺��� ���� Ȯ��(�������̺�, �μ����̺�)
-- 2. ������ ���̺��� FROM���� �޸�(,)�� �������� ���(FROM)
-- 3. ���� ���ǿ� �ش��ϴ� Ư�� �÷��� ã��, WHERE�������� ���� ���� ����(WHERE)
-- 4. ��ȸ�ϰ��� �ϴ� �÷��� �ۼ�(SELECT)
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT E.EMPLOYEE_ID , E.FIRST_NAME , D.DEPARTMENT_NAME , E.DEPARTMENT_ID
  FROM EMPLOYEES E , DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- ����3) ����ID�� 100�� ������ FIRST_NAME�� �μ��̸� ���
-- �������̺��� E, �μ����̺��� D�� ��Ī �ۼ�
SELECT E.EMPLOYEE_ID , E.FIRST_NAME , D.DEPARTMENT_NAME
  FROM EMPLOYEES E , DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
   AND EMPLOYEE_ID = 100;


   -- [ ANSI ���� ���� : �̱� ǥ����ȸ���� ���� ��� DBMS���� ��� ������ ����
   
 -- INNER JOIN : '��������' �̶�� �ϸ� ���� ���ǿ��� ������ ���� �ִ� �ุ ��ȯ

-- [ INNER JOIN�� ����� ]
-- SELECT     ��ȸ�� �÷��� ,...
-- FROM       ���̺�1 (INNER) JOIN ���̺�2
-- ON ( ���̺�1.�÷� = ���̺�2�÷� ) -> ���� ����
-- WHERE ( �Ϲ� ������ ) -> ���� ���� �� �ٸ� ����


-- ����1) �������̺�� �������̺��� INNER JOIN�� ����Ͽ� ����ID, ����ID, ����TITLE ���
SELECT E.EMPLOYEE_ID 
     , J.JOB_ID
     , J.JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
    ON (E.JOB_ID = J.JOB_ID) ;
    
 --> *���� ������ ��κ� PK�� FK ����� �̷������.
 --> ������ �� �׷� ���� �ƴϴ�!!(�������̺�� �μ����̺��� �Ŵ������̵�)


-- ����2) �������̺��� �������̵�� �μ����̵�
--       �μ����̺��� �μ��̸��� ������� ���(INNER JOIN Ȱ��)
SELECT E.EMPLOYEE_ID
     , E.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);
--> JOIN�� ON�̶�� Ű����� ��������������Ѵ�!
-- �ܵ������� �����ϴ� �÷��� .(���)�� �������� �ʾƵ� �������.



   -- [ CROSS JOIN : ���� �������� ���� �ʰ� ���̺��� ��� �����͸� ������ ���� ���
--> ���� ������ ���� ��� ���� �� �ִ� ��� �������� ������ ��ȸ
 --> 'īƼ�� ��'�̶�� �θ��� -> ��� ����� ���� ���
 --> īƼ�� �� ��� �߻�
 
 
 
    -- [ CROSS JOIN�� ����� ]
-- SELECT     ��ȸ�� ���̺� ��, ...
-- FROM       ���̺�1 CROSS JOIN ���̺�2 ;


-- ����2) �������̺��� �������̵�� �μ����̵�
--       �μ����̺��� �μ��̸��� ������� ���(CROSS JOIN Ȱ��)
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D ;

 --> �������̺� 107 �� * �μ����̺� 27 �� = 2889���� ��  
 -- => īƼ�� �� 


-- ����3) �� �μ��� �Ŵ��� �������� �μ��̸�, �Ŵ������̵�, FIRST_NAME ��� (INNER JOIN)
SELECT * FROM DEPARTMENTS;

SELECT D.DEPARTMENT_NAME
     , D.MANAGER_ID
     , E.FIRST_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;
--> �μ����̺��� �Ŵ������̵�� �������̺��� �������̵�� ���� ���̾
--  MANAGER_ID�� EMPLOYEE_ID�� ���� ���� ������ ���� �����ؾ� �Ѵ�.
 --> ������ ���� ���� ���� ���ǿ� ����ϴ� ���� �ƴ϶� ���Ϸ��� ���� �´� ���� ������ �ɾ���� �ȴ�!



   -- [ OUTER JOIN : �ܺ� �����̶�� �ϸ�, �� ���� ���̺� ���� �������� ��ȸ�ϰ�
                  -- �� �� ���̺��� �ִ� �����͵� ���Խ��Ѽ� ��ȸ�ϰ� ���� �� ����ϴ� ���� ����
             --> �� �� �������� NULL���� ����ϰ� ���� �� ���


  -- LEFT OUTER JOIN : ���� ���̺��� �������� NULL���� �����Ͽ� ���
--> ����Ŭ ���� ���� �� : ���� �������� �ݴ��� ������ �÷��� (+) ��ȣ �ۼ�

  -- RIGHT OUTER JOIN : ������ ���̺��� �������� NULL���� �����Ͽ� ���
--> ����Ŭ ���� ���� �� : ���� �������� �ݴ��� ���� �÷��� (+) ��ȣ �ۼ�

  -- FULL OUTER JOIN : ������ NULL���� �����Ͽ� ���
--> ����Ŭ ���������� ���� ���� , UNION �����ڷ� ���� ���� ����ϴ� ����� �ִ�.


 --> ANSI ǥ�ع���

-- SELECT     ��ȸ�� �÷��� ,...
--   FROM     ���̺�1 LEFT (OUTER) JOIN ���̺�2
--     ON     ���̺�1.�÷� = ���̺�2.�÷� 

 --> ����Ŭ ����
 
-- SELECT     ��ȸ�� �÷��� ,...
--   FROM     ���̺�1 , ���̺�2
--  WHERE     ���̺�1.�÷� = ���̺�.2�÷� (+)



-- ����1) �� �μ��� �Ŵ��� �������� �μ��̸�, �Ŵ������̵�, FIRST_NAME ��� (INNER JOIN)
 --> �μ����̺��� �� �Ŵ��� �̸��� ������ ����� �ƴ� (�μ� ��)
SELECT * FROM DEPARTMENTS;

SELECT D.DEPARTMENT_NAME , D.MANAGER_ID , E.FIRST_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;

-- ����1-1) LEFT OUTER JOIN Ȱ��
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID , E.FIRST_NAME
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID ;
    
-- ����1-2) ����Ŭ ���� Ȱ��
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID , E.FIRST_NAME
  FROM DEPARTMENTS D , EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID (+) ;

-- ����1-3) RIGHT OUTER JOIN
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID , E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID ;

-- ����1-4) ����Ŭ ����
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID (+) = E.EMPLOYEE_ID ;

-- ����1-5) FULL OUTER JOIN
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID ;
--> �� ���� NULL���� 16���� ��(LEFT JOIN)�� 107���� ��(RIGHT JOIN) = 123���� ���� ���´�



   -- 3�� �̻� ���̺� ���� �����
   
 --> ANSI ǥ�ع���
 
-- SELECT     ��ȸ�� �÷��� ,...
--   FROM     ���̺�1 JOIN ���̺�2
--     ON     (�������ǽ�) JOIN ���̺�3
--     ON     (�������ǽ�)

 --> ����Ŭ ����
 
-- SELECT     ��ȸ�� �÷��� ,...
--   FROM     ���̺�1 , ���̺�2 , ���̺�3
--  WHERE     ���̺�1.�÷� = ���̺�.2�÷�
--    AND     ���̺�2.�÷��� = ���̺�3.�÷��� ;


-- ����1) �μ����̺�, ��ġ���̺�, �������̺��� INNER JOIN �ؼ� �μ��̸�, ����, �����̸� ���
SELECT D.DEPARTMENT_NAME , L.CITY , C.COUNTRY_NAME
  FROM DEPARTMENTS D INNER JOIN LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID)
       JOIN COUNTRIES C ON (L.COUNTRY_ID = C.COUNTRY_ID);

-- ����1-1) ����Ŭ ����
SELECT D.DEPARTMENT_NAME , L.CITY , C.COUNTRY_NAME
  FROM DEPARTMENTS D , LOCATIONS L , COUNTRIES C
 WHERE D.LOCATION_ID = L.LOCATION_ID
   AND L.COUNTRY_ID = C.COUNTRY_ID ;



