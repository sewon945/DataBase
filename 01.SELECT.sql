   -- CHAPTER 01. SELECT --

-- �ּ� ��ȣ
-- �ּ� ����(2) : /**/ -> ���� ���� �� ���� �ּ�ó���� ����
-- ���� ũ�� Ű��� : ���� > ȯ�漳�� > �ڵ������� > �۲�
-- �ּ� ���� �ٲٱ� : ���� > ȯ�漳�� > �ڵ������� > PL/SQL�ּ�


SELECT FIRST_NAME
FROM EMPLOYEES ;


DESC EMPLOYEES;
descdemployees;
-- DESC (DESCRIBE) : �����ϴ�, SQL���� ���Ǵ� �����ͺ��̽� ���̺��� ������ Ȯ���ϴµ� ����



/*
1. SQL ���忡�� ��ҹ��ڸ� �������� �ʴ´�.
2. ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
3. SQL ���� ������ �� ����Ŭ��(;) �� ������ �Ѵ�!
4. SQL ���� ����Ű : CTRL + ENTER , F9
*/


SELECT EMPLOYEE_ID
FROM EMPLOYEES;



   --[ SELECT �� �⺻ ����� ]

-- 2. SELECT   ��ȸ�� �÷� ��1, ......
-- 1. FROM     ��ȸ�� ���̺� �̸�

-- ��ü ��ȸ ( * )
 --> * (�ƽ�Ÿ����ũ) : ��ü�� �ǹ��Ѵ�.



-- �������̺��� ��ü ������ ����ϱ�
SELECT * 
  FROM EMPLOYEES ;


-- �μ����̺��� ��ü ������ ����ϱ�
SELECT *
  FROM DEPARTMENTS ;


-- �ǽ�1) �������̺��� ����ID, FIRST_NAME, LAST_NAME ���� ���
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES ;


-- �ǽ�2) �μ����̺��� �μ�ID, �μ���, LOCATION_ID�� ���
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
  FROM DEPARTMENTS ;


-- �ǽ�3) �������̺��� EMAIL, FIRST_NAME, HIRE_DATE, DEPARTMENT_ID ������ ���
SELECT EMAIL, FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES ;
  
  
-- �ǽ�4) �������̺��� ������ FIRST_NAME, JOB_ID �� ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES ;
  
  
  
   -- [ ������ �ߺ� �����ϱ� ]
-- DISTINCT : ������ �ߺ� ����

-- �����
-- 2. SELECT    DISTINCT ��ȸ�� �÷�1, ...
-- 1. FROM      ���̺� �̸� ;
  
   
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES ;
  
  
-- �ǽ�1) �������̺��� �μ�ID�� �ߺ� �����Ͽ� ���
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES ;
  
  
-- �ǽ�2) �������̺��� JOB_ID�� �μ�ID�� �ߺ��� �����Ͽ� ���  
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES ;

--> ���� JOB_ID���� �ߺ�üũ�� ���� �� ������ �μ�ID���� �ߺ�üũ�� �� >> ������ ������ �ν�
--> DISTINCT �ڿ� 2�� �̻��� �÷��� ������ �� �� �÷��� �ߺ��� �־ �ٸ� �� �÷��� ���� �ٸ��� �ٸ��� ���
  
  
-- �ǽ�3) �������̺��� �Ի����� ����ϴµ� �ߺ� �����Ͽ� ���
SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES ;
  
  
SELECT '�ȳ��ϼ���'  
  FROM EMPLOYEES ;
  
  
   -- ��Ī ����ϱ�
-- ALIAS ��� �ϸ� �Ѵ��� ���� ���� �����ϴ� ��
-- AS Ű���带 ����Ͽ� ��Ī�� �����Ѵ�.
  

   -- TIP !!!
-- �÷��� ���� ������ ����!! ( + , - , * , / )
  
  
-- �ǽ�1) �������̺��� ������ �̸�(FIRST_NAME)�� �޿�, ������ ���� ���
SELECT FIRST_NAME, SALARY, SALARY * 12 AS ����
  FROM EMPLOYEES ;
  
  
  
   -- ��Ī ��� ���
-- 1. SELECT �÷� ��Ī
-- 2. SELECT �ø� "��Ī"
-- 3. SELECT �÷� AS ��Ī => ���� ���� ����ϴ� ���
-- 4. SELECT �÷� AS "��Ī"
  
  
-- �ǽ�1) �������̺��� ������ �̸�(FIRST_NAME)�� �޿�, �Ի��� ���
--        �� �Ի����� "�Ի糯¥"�� ��Ī�� ����ؼ� ��� (4���� ���)
SELECT FIRST_NAME, SALARY, HIRE_DATE �Ի糯¥
  FROM EMPLOYEES ;
  
SELECT FIRST_NAME, SALARY, HIRE_DATE "�Ի糯¥"
  FROM EMPLOYEES ;
  
SELECT FIRST_NAME, SALARY, HIRE_DATE AS �Ի糯¥
  FROM EMPLOYEES;
  
SELECT FIRST_NAME, SALARY, HIRE_DATE AS "�Ի糯¥"  
  FROM EMPLOYEES ;
  
  
-- �ǽ�2) �������̺��� �Ի���, �Ի��� ������ �� ���
--        �Ի����� ��Ī�� "�Ի糯¥" �Ի��� ���� ���� ��Ī�� "�Ի��� ������" ���
  
SELECT HIRE_DATE AS "�Ի糯¥" , HIRE_DATE + 1 AS "�Ի��� ������"
  FROM EMPLOYEES ;

--> "�Ի��� ������" ó�� ���Ⱑ ������ �ֵ���ǥ("")�� �־���� �Ѵ�.
  


   -- ORDER BY ��
--> Ư�� �÷��� �������� ���ĵ� ���·� ����ϰ� �� �� �� ���
--> SQL ����������� ���� �������� ����ȴ�.
--> ������ ���� ����� �������� ������ �⺻������ ��������(ASC)�� ����ȴ�.

-- ASC (Ascending)   : �������� ���� ( 1, 2, 3, 4, 5, ....)
-- DESC (Descending) : �������� ���� ( 10, 9, 8, 7, ....)


-- �ǽ�1) �������̺��� ��� ������ ������ ��� * , �� �޿� �������� ������������ ����
SELECT *
  FROM EMPLOYEES 
ORDER BY SALARY ASC ;


-- �ǽ�2) �ֱٿ� �Ի��� ��¥�� �������� ������ �̸�(FIRST_NAME)�� �Ի糯¥ ���
SELECT FIRST_NAME, HIRE_DATE 
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;  


-- �ǽ�3) �������̺��� ����ID, �μ�ID, �̸�(FIRST_NAME), �޿�(SALARY) ������ ���
--        �� �μ�ID�� ������������, �޿��� ������������ �����Ͽ� ���
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

--> ���� �μ����� �ٹ��ϰ� �ִ� ������ �߿��� �޿��� ���� ���� ���� ������� ���
--> (SALARY�� ����� ������ �ȵ� �� ������ ���� �μ������� �޿��� ������������ �� ���ĵ� ������)
--> ���� �μ�ID�� ������������ �����ϰ� �޿��� ������������ ������ ��



   -- NULL �̶�?
--> NULL �� �̶� �������� ���� ������ ����ִ� ���¸� ���Ѵ�.
--> ���� �������� �ʰų� �������� ���� ���� �ǹ��Ѵ�.
--> ���� 0�� ���ڿ�' '�� NULL ���� �ƴϴ�.
--> NULL �� �����ϸ� ��� ���� ������ NULL ���� ���´�!!
--> NULL �� ���ϸ� ������ FALSE ���� ���´�!!


-- �ǽ�1) �������̺��� ����ID, ���ʽ�, ���ʽ� 2���� ���� ���
--        �� "���ʽ� 2��"�� ������ "UP_BONUS"�� ��Ī�� �����ش�!
SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT * 2 AS "UP_BONUS"
  FROM EMPLOYEES ;






  
  