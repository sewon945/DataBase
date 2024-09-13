   -- CHAPTER 02. WHERE --

-- WHERE�� ������ ���� �� ���(������)

 
   -- WHERE �� �⺻ �����
   
-- 3. SELECT    ��ȸ�� �÷� ��1, ...
-- 1. FROM      ��ȸ�� ���̺� ��
-- 2. WHERE     ��ȸ�� ���� �����ϱ� ���� ���ǽ�


-- �ǽ�1) �������̺��� ����ID�� 105�� ������ FIRST_NAME �� LAST_NAME�� ���
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105 ;
 
 
-- �ǽ�2) �μ� ���̺��� �Ŵ���ID�� 100�� �μ��̸��� �μ�ID ���
SELECT * FROM DEPARTMENTS;
 
SELECT MANAGER_ID, DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100 ;
 
 
-- �ǽ�3) �������̺��� �޿��� 9000�� ������ ����ID, FIRST_NAME, �޿� ���� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY = 9000 ;



   -- ��������� ( +, -, *, / )
SELECT SALARY, SALARY + 100
  FROM EMPLOYEES;

SELECT SALARY, SALARY * 100
  FROM EMPLOYEES;



   -- �񱳿����� : ���ų� ũ�ų� �۰ų� �� ���ϴ� �� ( >, >=, <, <= )
--  >  : ũ��(�ʰ�)
--  >= : ũ�ų� ����(�̻�) - ����
--  <  : �۴�(�̸�)
--  <= : �۰ų� ����(����) - ����


-- �ǽ�1) �������̺��� �޿��� 5000 ������ ������ FIRST_NAME�� SALARY ���� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY <= 5000 ;
 
 
-- �ǽ�2) �������̺��� ������ 50000 ������ �������� �̸�(FIRST_NAME)�� ���� ���
--        * ������ AnnSal �̶�� ��Ī�� ��������!
SELECT FIRST_NAME, SALARY * 12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE SALARY * 12 <= 50000 ;

--> SELECT���� �������� ����Ǳ⿡ ������ ����Ǵ� ��Ī�� ���� ����Ǵ� WHERE������ ������ �� �� ����!(SQL�������)
--> => SELECT���� ������ �� ��°�̰� WHERE���� ������ �� ��°�� SELECT�� �� ��Ī�� WHERE���� ����� �� ����!



   -- � �� ������ : ����, ���� �ʴ�
--  = : ����
--  != , <> , ^= : ���� �ʴ�.
--  NOT A = B  : ���� �ʴ�.


-- �ǽ�1) �������̺��� ����ID�� 'IT_PROG'�� �ƴ� ������ �̸�(FRIST_NAME)�� ����ID ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID != 'IT_PROG' ;


-- �ǽ�2) �������̺��� EMAIL ������ SKING�� ������ ��� ���� ���
SELECT *
  FROM EMPLOYEES
 WHERE EMAIL = 'SKING' ;


-- �ǽ�3) �������̺��� EMAIL ������ SKING�� �ƴ� ������ ��� ���� ���
SELECT *
  FROM EMPLOYEES
 WHERE EMAIL != 'SKING' ;

--> ���ڿ��� ''�� ������� �Ѵ�.



   -- �� ������
-- AND : ������ ��� �����ϴ� ��� TRUE �� ��ȯ
-- OR : �ϳ��� �����̶� �����ϴ� ��� TRUE �� ��ȯ


-- �ǽ�1) �������̺��� �μ����̵� 90 �̸鼭(�̰�) �޿��� 5000 �̻���
--        ����ID�� FIRST_NAME ���
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90 
   AND SALARY >= 5000 ;


-- �ǽ�2) �������̺��� �μ�ID�� 100 �̰ų� �Ի����� 06��02��02�� ���Ŀ� 
--        �Ի��� �������� FIRST_NAME�� �Ի��� ���
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 
    OR HIRE_DATE > '06/02/02' ;


-- �ǽ�3) �μ�ID�� 100�̰ų� 90�� ���� �߿��� ����ID�� 101�� ������ ���� ���
--        (ID, FIRST_NAME, ����) *������ "AnnSal"�� ��Ī ����
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY * 12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 100
    OR DEPARTMENT_ID = 90)
   AND EMPLOYEE_ID = 101 ;

   --  => �������� �켱 ������ ���� ��� ���� ������ �޶�����
-- AND > OR �켱������ OR���� AND�� ����!
--> OR �� AND �߿��� AND �����ڰ� �켱������ �� ���� ( AND > OR )
--> �� ������ OR �� ���� ����������ϱ⿡ ��ȣ�� ������Ѵ�.



   -- NULL ���� ������
-- IS NULL        : ������ ���� NULL�� ���� ��ȸ 
-- IS NOT NULL    : ������ ���� NULL�� �ƴ� ���� ��ȸ
--> IS NOT NULL�� !=�� �ٲ㼭�� ���� ���� ���� ����


-- ����1) �������̺��� ���ʽ��� �ִ� ������ ��� ( ������ �̸��� ���ʽ� ������ ��� )
SELECT * FROM EMPLOYEES ;
SELECT FIRST_NAME, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL ;



   -- SQL ������
--> SQL���� ����� �� �ִ� ������ (JAVA���� ���X)
-- => IN, NOT IN, BETWEEN, LIKE

   -- IN
--> Ư�� �÷��� ���Ե� �����͸� ���� �� ��ȸ�� �� ���
-- = + OR �� ���� �� ���
-- NULL ���� �����ϴ� Ư���� ������ �ִ�!
 
 
-- ����1) �������̺��� �μ����̵� 30�̰ų� 50�̰ų� 90�� ������ ��� ���� ���
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90 ;

-- ����1-1) IN ������ Ȱ��
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90);


-- ����2) �������̺��� �μ����̵� 30�̰ų� 50�̰ų� 90�� NULL ������ ��� ���� ���
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90,NULL);

-- => SELECT *
--      FROM EMPLOYEES
--     WHERE DEPARTMENT_ID = 30
--        OR DEPARTMENT_ID = 50
--        OR DEPARTMENT_ID = 90
--        OR DEPARTMENT_ID = NULL ;



   -- NOT IN
--> IN �ڿ� ���ǿ� �ش����� �ʴ� ������ ���
-- != + AND �� ���� �� ���
-- != + AND ������ Ư¡ ������ NULL���� ������ �ƿ� ���� ����� �ȵȴ�!! (AND�� FALSE�� ��µǱ⿡)

-- ����1) �������̺��� �Ŵ������̵� 100, 120, 121 �� �ƴ� �������� �̸��� �Ŵ������̵� ���
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID != 100
   AND MANAGER_ID != 120
   AND MANAGER_ID != 121 
   AND MANAGER_ID != NULL ; 
   
-- ����1-1) NOT IN Ȱ��
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN(100, 120, 121) ;



   -- BETWEEN
-- BETWEEN A AND B
--> ���� ���� ���� �����͸� ��ȸ�� �� ���

-- BETWEEN �ּҰ� AND �ִ밪
--> Ư�� �� ���� �ּ�, �ְ� ������ �����Ͽ� �ش� ���� ���� �����͸� ��ȸ�ϴ� ��


-- ����1) �������̺��� �޿��� 10000 �̻��̰� 20000 ������ ������ FIRST_NAME�� �޿� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= 10000
   AND SALARY <= 20000 ;

-- ����1-1) BETWEEN �ּҰ� AND �ִ밪 Ȱ��
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000 ;


-- ����2) �������̺��� 05�⿡ �Ի��� ������ �̸��� �Ի��� ��� (BETWEEN ������ Ȱ��)
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31' ;



   -- LIKE ������
-- �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ�� �� ���
-- _�� % ���� ���ϵ� ī�带 �̿��� ��Ī ���� ����
-- ���ϵ�ī���?
 -- ���ڿ� �������� ������ ǥ���ϴ� Ư�� ����

-- ���ϵ�ī�� ����
--> % : ���̿� ������� ��� ���� ������ �ǹ�
--> _ : � ���̵� ������� �� ���� ���� ������ �ǹ�


-- ����1) �������̺��� 650���� �����ϴ� �ڵ��� ��ȣ ã��
SELECT * FROM EMPLOYEES ;

SELECT PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '650%' ;


-- ����2) �������̺��� �̸��� S�� �����ϰ� n���� ������ ������ ã��
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';
 
 
-- ����3) �������̺��� FIRST_NAME�� it���� ������ �� 4������ ���� ã��
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '__it';


-- ����4) �������̺��� FIRST_NAME�� �� ��° ���ڰ� e�� ���� ã��
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_e%';


-- ����5) �������̺��� 01���� �Ի��� ���� ã��
SELECT HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '___01%';






