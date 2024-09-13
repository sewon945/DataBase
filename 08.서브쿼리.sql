   -- CHAPTER 08. �������� --

  -- ����������?
--> SQL���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���ؼ�
--> SQL ���ο��� ����ϴ� SELECT ���� �ǹ��Ѵ�.
--> ���������� �������� �ȿ� ���Ե� �������� �����̴�.


-- �������� : ���� ������ ������� ����Ͽ� ����� �����ϴ� ����
-- �������� : ���� ������ ���ǽĿ� ���� ���� �ǹ�


-- SELECT ��ȸ�� ��
--   FROM ��ȸ�� ���̺�
--  WHERE ���ǽ� (SELECT
--                 FROM
--                WHERE);


-- ����1) �������̺��� Jack�� �޿����� ���� ������ �̸��� �޿� ���

-- 1. ������ ������ �Ǵ� Jack�� �޿��� ���� Ȯ��
-- 2. 1��°�� ������� ������ �������� ���ؼ� ����� ���

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Jack';  -- ���� �޿� : 8400

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < 8400 ;

-- ���� 1-1) �������� �̿�
SELECT FIRST_NAME
     , SALARY
  FROM EMPLOYEES 
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES
                  WHERE FIRST_NAME = 'Jack') ;
--> ���������� ���� ������ ���������� ������ ������ ���ƾ��Ѵ�


-- ����2) �������̺��� James�� �޿����� ���� ������ �̸��� �޿� ���� ��ȸ
SELECT * FROM EMPLOYEES ;

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES
                  WHERE FIRST_NAME = 'James');

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'James';  -- 2400, 2500

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (2400, 2500) ;



  -- ���������� Ư¡
-- 1. ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����ʿ� ������ () �� ��� ����Ѵ�.
-- 2. ���������� SELECT ���� ����� �÷��� ���������� �� ���� ���� �ڷ����� ������ �����ؾ��Ѵ�.
-- 3. ���������� �ִ� SELECT ���� ��� �� ���� �Բ� ����ϴ� ���������� "������ ����"�� ȣȯ �����ؾ��Ѵ�.
-- ��, �� �ϳ��� �����ͷθ� ���� ������ �����ڸ� ���� ������ ��� �� ���� �ϳ����߸� �Ѵ�.
-- �����ڿ� �԰� ��ȣ �ۿ��ϴ� ��Ŀ� ���� ������ ���������� ������ ���������� ������.



  -- ������ ����������?
--> ���� ����� �� �ϳ��� ������ ������ ���������� ���Ѵ�.
 --> =(����) , > , >= , <= , < (ũ�ų� �۰ų�), != , <> , ^=(�����ʴ�)



  -- ������ ��������
--> ���� ��� ���� ���� ���� ������ ���������� ���Ѵ�.
 --> ������ �����ڴ� ����� �� ���� ������ �����ڸ� ����ؾ� �Ѵ�



-- ����1) �������̺��� Nancy���� ���� �Ի��� ������ �̸�(FIRST_NAME)�� �Խ���(HIRE_DATE) ��ȸ

-- (1) ������ �Ի� ��¥ ���� (���������� ��)
SELECT HIRE_DATE
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Nancy';  -- 2002/08/27

-- (2) ������ ���������� �̿��� ���
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE < (SELECT HIRE_DATE
                      FROM EMPLOYEES
                     WHERE FIRST_NAME = 'Nancy');


-- ����2) �������̺��� ������ ��ձ޿� ���� ���� �޿��� �޴� ������ FIRST_NAME�� SALARY ���� ��ȸ

-- (1) ������ ��ձ޿� ���� (���������� ��)
SELECT AVG(SALARY)
  FROM EMPLOYEES;  --6462

-- (2) ������ ���������� �̿��� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > (SELECT AVG(SALARY)
                   FROM EMPLOYEES );


 -- ������ ��������
--> ���� ��� ���� ���� ���� ������ ��������
--> ������ �����ڷδ� ����� �� ����. ������ �����ڸ� ����ؾ� �Ѵ�!!


-- ����3) �� �μ��� �ְ�޿��� ������ �޿��� �޴� ������ ���� ���
-- (�μ�ID, FIRST_NAME, �޿�)

-- (1) �μ���(GROUP_BY) �ְ�޿� (���������� ��)
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;

-- (2) 1���� ������� ������ ������ ���������� �̿��� ��� - ����
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY = (SELECT MAX(SALARY)
                   FROM EMPLOYEES 
                 GROUP BY DEPARTMENT_ID);



   -- [ ������ �������� ���� ]
-- IN : ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�� �����Ͱ� ������ TRUE�� ��ȯ
 --> IN (��������)
 
-- ANY , SOME : ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� TRUE�� ��ȯ
 --> �񱳿����� ANY (��������)
 
-- ALL : ���������� ���ǽ��� ���������� ����� ��� �����ؾ߸� TRUE�� ��ȯ
 --> �񱳿����� ALL (��������)
 
-- EXISTS : �������� ������� �����ϴ��� ���� Ȯ�� ( ��, ���� �ϳ� �̻��̸� TRUE)
 --> EXISTS (��������)



 --IN ������ Ȱ��
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY IN (SELECT MAX(SALARY)
                   FROM EMPLOYEES 
                 GROUP BY DEPARTMENT_ID);



 -- ANY ������ Ȱ��
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY = ANY (SELECT MAX(SALARY)
                       FROM EMPLOYEES 
                   GROUP BY DEPARTMENT_ID);
--> IN�����ڿ� ���� ����� ���



 -- �μ��� �ְ� �޿��� ���� �޿��� ������ ��� �������� ��� �� ���̴�
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY IN (SELECT MAX(SALARY)
                   FROM EMPLOYEES 
                  GROUP BY DEPARTMENT_ID);



 -- ANY�� ALL �����ڿ� ��Һ� �����ڸ� ����ϰ� �Ǹ� ������ �غ����Ѵ�
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY  >= ANY (SELECT MAX(SALARY)
                         FROM EMPLOYEES 
                      GROUP BY DEPARTMENT_ID);
-- �μ��� �ּ� �޿��� �ְ� �޿��� ������ �� �߿��� ���� ���� �� ����� �ȴ�!
 
-- �μ��� �ְ� �޿��� �ϳ��� ���̸� ���� ��ȯ�Ǵ� ���� ANY ������!
-- ���� �� � �ϳ��� ������ ���������� ���� ū ���� ������ ��� ���� ����� �ȴ�!
--> �μ��� �ּ� �޿����� ���� ���� �� ����� �� ���̴�!



 -- ALL ������ Ȱ��
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY  >= ALL (SELECT MAX(SALARY)
                         FROM EMPLOYEES 
                      GROUP BY DEPARTMENT_ID);
-- ALL : ���� ������ ����� �����ϴ� ��� ���鿡 ���� ������ �����ؾ��Ѵ�
--> ���������� ���������� ��� ��� ���� �����ؾ��Ѵ�.
--> ���������� ��� �� �߿� ���� ū ���� 24000 �� ���ؼ� ũ�ų� ���� ���� ���� �����͸� ���
--> ��������� �ִ밪���� ū�Ǹ� ����� �ȴ�



 -- EXSIST �����ڴ� ���� ���θ� Ȯ���Ѵ�
SELECT DEPARTMENT_ID , FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 110
                
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EXISTS (SELECT DEPARTMENT_ID , FIRST_NAME
                 FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 110 ) ;
--> ���������� ������� ���縦 �ϳ� ���ϳĸ� ��Ÿ����
--> ���������� ������� �����ϸ� ����� ���O , ������� �������� ������ ����� ���X
 
 
 
 -- ���� �÷� ��������
--> ���� ������ ����� ���� �÷��� ��ȯ�Ǿ� ���������� ���ǰ� ���ÿ� �� �Ǵ� ���� �ǹ�
--> �ַ� IN �����ڿ� �Բ� ���


-- ����1) �� �μ��� �ְ� �޿��� ������ �޿��� �޴� ������ ���� ���
-- (�μ�ID, FIRST_NAME, �޿� ���� )
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY)
                                     FROM EMPLOYEES 
                                  GROUP BY DEPARTMENT_ID);
 --> 2���� �÷��� ���ؼ� �ش� �μ����� �ְ� �޿��� �޴� ������ ��� (������ �Ǵ� ���� Ȯ�� ����)



   -- [ �ζ��� �� ( Inline View )]
-- FROM ������ ���� ���̺�ó�� ����ϴ� ��������
-- �ζ��� �並 ����ϸ� ���������� ����� ��ġ ���̺�ó�� ����� �� �ִ�.
-- �ζ��� ��� ���� �ü� ��� ó���ȴ�.


-- ����1) �μ����� �ְ� �޿��� �޴� ������ FIRST_NAME, �μ�ID, �μ��� �ְ�޿� ���
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;



 -- �ζ��� �� Ȱ��
SELECT A.FIRST_NAME, A.DEPARTMENT_ID, B."MAX_SALARY"
  FROM EMPLOYEES A , (SELECT DEPARTMENT_ID, MAX(SALARY) AS "MAX_SALARY"
                      FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID ) B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND A.SALARY = "MAX_SALARY" ;
--> �ζ��� ��� ��Ī�� ���� ������ ���� �÷��� ������ ���� ����.
--> ��Ī�� ��߸� ���ϴ� �÷��� �����ؼ� �� ���� �ִ�.
 


 -- [ ��Į�� �������� ( Scalar Subquery )]
-- SELECT���� ���Ǵ� ��������
-- �Ϥ����� �÷��� ���� �ϳ��� �ุ ��ȯ�ϴ� Ư¡�� ������ �ִ�.
-- JOIN ���� JOINó�� ����ϰ��� �� �� ���


-- ����1) �����̸�(FIRST_NAME), �޿�(SALARY), �μ����̵�(DEPARTMENAT_ID), �μ��̸�(DEPARTMENT_NAME) ���
SELECT E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID,D.DEPARTMENT_NAME , D.LOCATION_ID
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

SELECT * FROM DEPARTMENTS;

 -- ��Į�� �������� �̿�
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID, (SELECT DEPARTMENT_NAME
                                             FROM DEPARTMENTS
                                            WHERE DEPARTMENT_ID = E.DEPARTMENT_ID ) AS �μ��̸�
  FROM EMPLOYEES E ;
















 
 

