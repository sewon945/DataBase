   -- CHAPTER 04. GROUP BY / HVING --

-- ���� �Լ��� ����
-- ���� �� �Լ� : �Էµ� �ϳ��� �� �� ����� �ϳ� �� ������ �Լ�
-- ���� �� �Լ� : ���� ���� �Է¹޾� �ϳ��� ��� ������ ����� �Ǵ� �Լ�
 --> ���� �� �Լ��� �����Լ���� �θ���.
 
 
 
   -- [ ���� �� �Լ�(�����Լ�)�� Ư¡ ]
-- 1. �����Լ��� NULL���� �����ϴ� Ư���� ������ �ִ�.
-- 2. �����Լ��� �׷�ȭ(GROUP BY)�� �Ǿ� �ִ� ���¿����� ����� �����ϴ�.

  -- �����Լ��� ����
-- COUNT : ������ �������� ������ ��ȯ 
-- SUM   : ������ �������� �� ��ȯ
-- MAX   : ������ ������ �� �ִ밪 ��ȯ
-- MIN   : ������ ������ �� �ּҰ� ��ȯ
-- AVG   : ������ �������� ��հ� ��ȯ


  -- COUNT (������ �� �÷�)
  
  
-- ����1) �������̺��� ����ID�� ���� ������ ��ȸ(�� ������)
SELECT * FROM EMPLOYEES ;

--SELECT EMPLOYEE_ID, COUNT(EMPLOYEE_ID)
--  FROM EMPLOYEES ;
 --> ����ϰ��� �ϴ� ���� ������ ���� �ʾƼ� ������ ����!
 
SELECT COUNT(EMPLOYEE_ID)
  FROM EMPLOYEES 
GROUP BY() ;  -- �Ұ�ȣ() �ȿ� �����Ͱ� ���� '�׷����'��� Ű���尡 ������ �ִ� ��
 --> �������̺��� �ϳ��� �׷����� ���ڴ�!!


-- ����2) �μ����̵��� ���� ���� ��ȸ
SELECT COUNT(DEPARTMENT_ID)
  FROM EMPLOYEES
GROUP BY() ;

-- ����2-1) �μ����̵� NULL�� ������ FIRST_NAME��?
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL;



/*
3. SELECT ��ȸ�� �÷� ��1, ....
1.   FROM ��ȸ�� ���̺� ��
2.  WHERE ���� ���ϴ� ���� �����ϱ� ���� ���ǽ� ;

��� ������ : +, -, *, /
�� ������ : >, >=, <, <=
� �� ������ : = (����) , !=, <>, ^=, NOT A=B (�����ʴ�)
�� ������ : AND(�� ���� ������ ��), OR(�� �߿� �ϳ��� ��)

SQL ������ (IN, NOT IN, BETWEEN, LIKE)
IN : WHERE �÷� IN (������ LIST...)
--> =(����) + OR(��������)
--> NULL���� �����Ѵ�.

NOT IN : WHERE �÷� NOT IN (������ LIST...)
--> !=(�����ʴ�) + AND(��������)
--> NULL�� �����ϸ� �ƿ� ������ ���� �� ���´�!

BETWEEN(���� ������) : BETWEEN �ּҰ� AND �ִ밪 ;
WHERE �÷� BETWEEN �ּҰ� AND �ִ밪

LIKE : WHERE �÷� LIKE '����(���ϵ�ī��)'
% : ���̿� ������� ��� ���ڸ� �ǹ�
_ : �ϳ��� ���ڸ� �ǹ�
*/



SELECT COUNT (DEPARTMENT_ID)
  FROM EMPLOYEES ;
  
-- COUNT �Լ��� * (�ƽ�Ÿ����ũ)�� ����� �� �ִ�.
-- �ٸ� ���� �Լ��� * (�ƽ�Ÿ����ũ)�� ����� �� ����.

SELECT COUNT(*)
  FROM EMPLOYEES ;
--> ���̺��� ��� ���� ������ �ľ��ϰ��� �� �� ���� SQL��!


-- ����1) �������̺��� �޿��� �� �հ踦 ���غ���(SUM �Լ�)
SELECT SUM(SALARY)
  FROM EMPLOYEES ;
GROUP BY(); -- ������ �Ǿ��ִ� ��


-- ����2) �������̺��� �������� �ִ� �޿��� �ּ� �޿� ��� (MAX / MIN)
SELECT MAX(SALARY), MIN(SALARY)
  FROM EMPLOYEES ;


-- ����3) �������̺��� �μ����̵� 100�� ������ ��� �޿� ��� (AVG)
--       * ������� �Ҽ��� 1�� �ڸ����� �ݿø�
SELECT ROUND (AVG(SALARY), 1 )
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 100 ;



SELECT * FROM ����ǥ;
SELECT * FROM ����������;

   -- [ GROUP BY : Ư�� �÷��� �������� �׷�ȭ(����)   
   
-- ����1) ���������� ���̺��� �Ҽӹ� �� �л��� �ο��� ��ȸ
SELECT �Ҽӹ� , COUNT(�л��̸�)
  FROM ���������� 
GROUP BY �Ҽӹ� ;


-- ����2) ����ǥ���̺��� �л� �� �׷�ȭ
SELECT �л�ID 
  FROM ����ǥ
GROUP BY �л�ID ;


-- ����3) ����ǥ ���̺��� ����(GROUP BY)�� �ְ� ������ �������� ���
SELECT ����, MAX(����) , MIN(����)
  FROM ����ǥ
GROUP BY ���� ;


-- ����4) ����ǥ ���̺��� �л���(GROUP BY) ��� ���� ���
-- ��, �Ҽ��� �ڸ� 1�ڸ������� ���
SELECT �л�ID , ROUND (AVG(����),1)
  FROM ����ǥ
GROUP BY �л�ID ;



   -- < SQL�� �ۼ� ���� >
-- SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY


   -- < ***SQL ���� ����*** >
-- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY


-- ����1) ����ǥ ���̺��� �л����� JAVA�� DATABASE ���� ���� ������ �� ���ϱ�
SELECT * FROM ����ǥ;

SELECT �л�ID , SUM(����)
  FROM ����ǥ
 WHERE ���� IN ('JAVA' , 'DATABASE')  --> ���� != 'PYTHON' �̶�� �� �� ����
GROUP BY �л�ID ;

-- GROUP BY �� ���¿��� �������� �� ������ HAVING���� ¦���̱⿡ WHERE�� �ƴ� HAVING�� �´�.



   -- [ HAVIG�� : GROUP BY���� ������ ���� ��� ����
 --> ���谡 �Ϸ�� ��� ������ ���� ���͸� �ϴ� �����̴�.
 
-- ������ ���� ����� ��µȴٴ� �������� WHERE���� ���������,
-- HAVING���� �׷�ȭ �� ��󿡼� ����� �ȴٴ� ������ �ٸ���.


-- ����1) ����ǥ���̺��� �л��� ��� ������ ���ϰ�, ��� ������ 75 ������ �л��鸸 ���
SELECT �л�ID, ROUND(AVG(����),1)
  FROM ����ǥ
GROUP BY �л�ID 
HAVING AVG(����) <= 75 ;

--> WHERE���� ���� ���ϴ� ������ GROUP BY�� �ϱ� ���� WHERE���� ���� �ͼ� ��������� ���� �ʾƼ� ������ ����.


-- ����2) ������ �������� �ݺ��� �ο����� 3�� �̻��� �ݸ� ���
SELECT * FROM ����������;

SELECT �Ҽӹ�, COUNT(�Ҽӹ�)
  FROM ����������
GROUP BY �Ҽӹ� 
HAVING COUNT(�Ҽӹ�) >= 3;


-- ����3) �������̺��� �μ��� �ְ� ������ 100000 �̻��� �μ��� ���
SELECT DEPARTMENT_ID, MAX(SALARY*12) AS "����"
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY*12) >= 100000 ;


-- ����4) ����ǥ���̺��� �л��� ��ռ����� ����ϵ�, NULL���� �ƴ� ���� ���
--        ��, ������  �Ҽ��� 1�� �ڸ������� ǥ��
SELECT �л�ID, ROUND(AVG(����),1)
  FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) IS NOT NULL ;













