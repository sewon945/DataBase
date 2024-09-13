   -- CHAPTER 02. WHERE --

-- WHERE은 조건이 있을 때 사용(조건절)

 
   -- WHERE 절 기본 사용방법
   
-- 3. SELECT    조회할 컬럼 명1, ...
-- 1. FROM      조회할 테이블 명
-- 2. WHERE     조회할 행을 선별하기 위한 조건식


-- 실습1) 직원테이블에서 직원ID가 105인 직원의 FIRST_NAME 과 LAST_NAME을 출력
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105 ;
 
 
-- 실습2) 부서 테이블에서 매니저ID가 100인 부서이름과 부서ID 출력
SELECT * FROM DEPARTMENTS;
 
SELECT MANAGER_ID, DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100 ;
 
 
-- 실습3) 직원테이블에서 급여가 9000인 직원의 직원ID, FIRST_NAME, 급여 정보 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY = 9000 ;



   -- 산술연산자 ( +, -, *, / )
SELECT SALARY, SALARY + 100
  FROM EMPLOYEES;

SELECT SALARY, SALARY * 100
  FROM EMPLOYEES;



   -- 비교연산자 : 같거나 크거나 작거나 를 비교하는 것 ( >, >=, <, <= )
--  >  : 크다(초과)
--  >= : 크거나 같다(이상) - 포함
--  <  : 작다(미만)
--  <= : 작거나 같다(이하) - 포함


-- 실습1) 직원테이블에서 급여가 5000 이하인 직원의 FIRST_NAME과 SALARY 정보 출력
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY <= 5000 ;
 
 
-- 실습2) 직원테이블에서 연봉이 50000 이하인 직원들의 이름(FIRST_NAME)과 연봉 출력
--        * 연봉을 AnnSal 이라고 별칭을 지어주자!
SELECT FIRST_NAME, SALARY * 12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE SALARY * 12 <= 50000 ;

--> SELECT절은 마지막에 실행되기에 마지막 실행되는 별칭을 먼저 실행되는 WHERE절에는 적용이 될 수 없다!(SQL실행순서)
--> => SELECT절의 순서는 세 번째이고 WHERE절의 순서는 두 번째라 SELECT에 쓴 별칭을 WHERE절에 사용할 수 없다!



   -- 등가 비교 연산자 : 같다, 같지 않다
--  = : 같다
--  != , <> , ^= : 같지 않다.
--  NOT A = B  : 같지 않다.


-- 실습1) 직원테이블에서 직업ID가 'IT_PROG'가 아닌 직원의 이름(FRIST_NAME)과 직업ID 출력
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID != 'IT_PROG' ;


-- 실습2) 직원테이블에서 EMAIL 정보가 SKING인 직원의 모든 정보 출력
SELECT *
  FROM EMPLOYEES
 WHERE EMAIL = 'SKING' ;


-- 실습3) 직원테이블에서 EMAIL 정보가 SKING이 아닌 직원의 모든 정보 출력
SELECT *
  FROM EMPLOYEES
 WHERE EMAIL != 'SKING' ;

--> 문자열은 ''로 감싸줘야 한다.



   -- 논리 연산자
-- AND : 조건을 모두 만족하는 경우 TRUE 값 반환
-- OR : 하나의 조건이라도 만족하는 경우 TRUE 값 반환


-- 실습1) 직원테이블에서 부서아이디가 90 이면서(이고) 급여가 5000 이상인
--        직원ID와 FIRST_NAME 출력
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90 
   AND SALARY >= 5000 ;


-- 실습2) 직원테이블에서 부서ID가 100 이거나 입사일이 06년02월02일 이후에 
--        입사한 직원들의 FIRST_NAME과 입사일 출력
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 
    OR HIRE_DATE > '06/02/02' ;


-- 실습3) 부서ID가 100이거나 90인 직원 중에서 직원ID가 101인 직원의 정보 출력
--        (ID, FIRST_NAME, 연봉) *연봉은 "AnnSal"로 별칭 지정
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY * 12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 100
    OR DEPARTMENT_ID = 90)
   AND EMPLOYEE_ID = 101 ;

   --  => 연산자의 우선 순위에 따라 결과 값이 완전히 달라진다
-- AND > OR 우선순위가 OR보다 AND가 높다!
--> OR 와 AND 중에서 AND 연산자가 우선순위가 더 높다 ( AND > OR )
--> 위 문제는 OR 을 먼저 연산해줘야하기에 괄호를 쳐줘야한다.



   -- NULL 관련 연산자
-- IS NULL        : 데이터 값이 NULL인 값을 조회 
-- IS NOT NULL    : 데이터 값이 NULL이 아닌 값을 조회
--> IS NOT NULL은 !=로 바꿔서는 값을 구할 수가 없다


-- 문제1) 직원테이블에서 보너스가 있는 직원만 출력 ( 직원의 이름과 보너스 정보만 출력 )
SELECT * FROM EMPLOYEES ;
SELECT FIRST_NAME, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL ;



   -- SQL 연산자
--> SQL에서 사용할 수 있는 연산자 (JAVA에서 사용X)
-- => IN, NOT IN, BETWEEN, LIKE

   -- IN
--> 특정 컬럼에 포함된 데이터를 여러 개 조회할 때 사용
-- = + OR 와 같은 값 출력
-- NULL 값은 무시하는 특성을 가지고 있다!
 
 
-- 문제1) 직원테이블에서 부서아이디가 30이거나 50이거나 90인 직원의 모든 정보 출력
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90 ;

-- 문제1-1) IN 연산자 활용
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90);


-- 문제2) 직원테이블에서 부서아이디가 30이거나 50이거나 90인 NULL 직원의 모든 정보 출력
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
--> IN 뒤에 조건에 해당하지 않는 데이터 출력
-- != + AND 와 같은 값 출력
-- != + AND 연산의 특징 때문에 NULL값을 넣으면 아예 값이 출력이 안된다!! (AND는 FALSE로 출력되기에)

-- 문제1) 직원테이블에서 매니저아이디가 100, 120, 121 이 아닌 직원들의 이름과 매니저아이디 출력
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID != 100
   AND MANAGER_ID != 120
   AND MANAGER_ID != 121 
   AND MANAGER_ID != NULL ; 
   
-- 문제1-1) NOT IN 활용
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN(100, 120, 121) ;



   -- BETWEEN
-- BETWEEN A AND B
--> 일정 범위 내의 데이터를 조회할 때 사용

-- BETWEEN 최소값 AND 최대값
--> 특정 열 값의 최소, 최고 범위를 지정하여 해당 범위 내의 데이터만 조회하는 것


-- 문제1) 직원테이블에서 급여가 10000 이상이고 20000 이하인 직원의 FIRST_NAME과 급여 출력
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= 10000
   AND SALARY <= 20000 ;

-- 문제1-1) BETWEEN 최소값 AND 최대값 활용
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000 ;


-- 문제2) 직원테이블에서 05년에 입사한 직원의 이름과 입사일 출력 (BETWEEN 연산자 활용)
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31' ;



   -- LIKE 연산자
-- 일부 문자열이 포함된 데이터를 조회할 때 사용
-- _나 % 같은 와일드 카드를 이용해 매칭 연산 진행
-- 와일드카드란?
 -- 문자열 데이터의 패턴을 표기하는 특수 문자

-- 와일드카드 종류
--> % : 길이와 상관없이 모든 문자 데이터 의미
--> _ : 어떤 값이든 상관없이 한 개의 문자 데이터 의미


-- 문제1) 직원테이블에서 650으로 시작하는 핸드폰 번호 찾기
SELECT * FROM EMPLOYEES ;

SELECT PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '650%' ;


-- 문제2) 직원테이블에서 이름이 S로 시작하고 n으로 끝나는 데이터 찾기
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';
 
 
-- 문제3) 직원테이블에서 FIRST_NAME이 it으로 끝나고 총 4글자인 직원 찾기
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '__it';


-- 문제4) 직원테이블에서 FIRST_NAME이 두 번째 글자가 e인 직원 찾기
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_e%';


-- 문제5) 직원테이블에서 01월에 입사한 직원 찾기
SELECT HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '___01%';






