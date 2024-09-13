   -- CHAPTER 01. SELECT --

-- 주석 기호
-- 주석 형태(2) : /**/ -> 여러 줄을 한 번에 주석처리가 가능
-- 글자 크기 키우기 : 도구 > 환경설정 > 코드편집기 > 글꼴
-- 주석 색깔 바꾸기 : 도구 > 환경설정 > 코드편집기 > PL/SQL주석


SELECT FIRST_NAME
FROM EMPLOYEES ;


DESC EMPLOYEES;
descdemployees;
-- DESC (DESCRIBE) : 묘사하다, SQL에서 사용되는 데이터베이스 테이블의 구조를 확인하는데 쓰임



/*
1. SQL 문장에는 대소문자를 구분하지 않는다.
2. 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3. SQL 문장 끝에는 꼭 세미클론(;) 을 찍어줘야 한다!
4. SQL 실행 단축키 : CTRL + ENTER , F9
*/


SELECT EMPLOYEE_ID
FROM EMPLOYEES;



   --[ SELECT 절 기본 사용방법 ]

-- 2. SELECT   조회할 컬럼 명1, ......
-- 1. FROM     조회할 테이블 이름

-- 전체 조회 ( * )
 --> * (아스타리스크) : 전체를 의미한다.



-- 직원테이블에서 전체 정보를 출력하기
SELECT * 
  FROM EMPLOYEES ;


-- 부서테이블의 전체 정보를 출력하기
SELECT *
  FROM DEPARTMENTS ;


-- 실습1) 직원테이블에서 직원ID, FIRST_NAME, LAST_NAME 정보 출력
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES ;


-- 실습2) 부서테이블에서 부서ID, 부서명, LOCATION_ID를 출력
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
  FROM DEPARTMENTS ;


-- 실습3) 직원테이블에서 EMAIL, FIRST_NAME, HIRE_DATE, DEPARTMENT_ID 순으로 출력
SELECT EMAIL, FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES ;
  
  
-- 실습4) 직원테이블에서 직원의 FIRST_NAME, JOB_ID 를 출력
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES ;
  
  
  
   -- [ 데이터 중복 제거하기 ]
-- DISTINCT : 데이터 중복 제거

-- 사용방법
-- 2. SELECT    DISTINCT 조회할 컬럼1, ...
-- 1. FROM      테이블 이름 ;
  
   
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES ;
  
  
-- 실습1) 직원테이블의 부서ID를 중복 제거하여 출력
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES ;
  
  
-- 실습2) 직원테이블에서 JOB_ID와 부서ID의 중복을 제거하여 출력  
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES ;

--> 먼저 JOB_ID에서 중복체크가 들어가고 그 다음에 부서ID에서 중복체크가 들어감 >> 각자의 값으로 인식
--> DISTINCT 뒤에 2개 이상의 컬럼을 적으면 한 쪽 컬럼에 중복이 있어도 다른 쪽 컬럼의 값이 다르면 다르게 취급
  
  
-- 실습3) 직원테이블에서 입사일을 출력하는데 중복 제거하여 출력
SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES ;
  
  
SELECT '안녕하세요'  
  FROM EMPLOYEES ;
  
  
   -- 별칭 사용하기
-- ALIAS 라고 하며 한눈에 보기 좋게 설정하는 것
-- AS 키워드를 사용하여 별칭을 지정한다.
  

   -- TIP !!!
-- 컬럼에 숫자 연산이 가능!! ( + , - , * , / )
  
  
-- 실습1) 직원테이블에서 직원의 이름(FIRST_NAME)과 급여, 연봉의 정보 출력
SELECT FIRST_NAME, SALARY, SALARY * 12 AS 연봉
  FROM EMPLOYEES ;
  
  
  
   -- 별칭 사용 방법
-- 1. SELECT 컬럼 별칭
-- 2. SELECT 컬림 "별칭"
-- 3. SELECT 컬럼 AS 별칭 => 가장 많이 사용하는 방법
-- 4. SELECT 컬럼 AS "별칭"
  
  
-- 실습1) 직원테이블에서 직원의 이름(FIRST_NAME)과 급여, 입사일 출력
--        단 입사일을 "입사날짜"의 별칭을 사용해서 출력 (4가지 방법)
SELECT FIRST_NAME, SALARY, HIRE_DATE 입사날짜
  FROM EMPLOYEES ;
  
SELECT FIRST_NAME, SALARY, HIRE_DATE "입사날짜"
  FROM EMPLOYEES ;
  
SELECT FIRST_NAME, SALARY, HIRE_DATE AS 입사날짜
  FROM EMPLOYEES;
  
SELECT FIRST_NAME, SALARY, HIRE_DATE AS "입사날짜"  
  FROM EMPLOYEES ;
  
  
-- 실습2) 직원테이블에서 입사일, 입사일 다음날 을 출력
--        입사일은 별칭을 "입사날짜" 입사일 다음 날의 별칭은 "입사일 다음날" 출력
  
SELECT HIRE_DATE AS "입사날짜" , HIRE_DATE + 1 AS "입사일 다음날"
  FROM EMPLOYEES ;

--> "입사일 다음날" 처럼 띄어쓰기가 있으면 쌍따음표("")를 넣어줘야 한다.
  


   -- ORDER BY 절
--> 특정 컬럼을 기준으로 정렬된 상태로 출력하고 자 할 때 사용
--> SQL 실행순서에서 가장 마지막에 실행된다.
--> 별도로 정렬 방식을 지정하지 않으면 기본적으로 오름차순(ASC)가 적용된다.

-- ASC (Ascending)   : 오름차순 정렬 ( 1, 2, 3, 4, 5, ....)
-- DESC (Descending) : 내림차순 정렬 ( 10, 9, 8, 7, ....)


-- 실습1) 직원테이블에서 모든 직원의 정보를 출력 * , 단 급여 기준으로 오름차순으로 정렬
SELECT *
  FROM EMPLOYEES 
ORDER BY SALARY ASC ;


-- 실습2) 최근에 입사한 날짜를 기준으로 직원의 이름(FIRST_NAME)과 입사날짜 출력
SELECT FIRST_NAME, HIRE_DATE 
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;  


-- 실습3) 직원테이블에서 직원ID, 부서ID, 이름(FIRST_NAME), 급여(SALARY) 순으로 출력
--        단 부서ID는 오름차순으로, 급여는 내림차순으로 정렬하여 출력
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

--> 같은 부서에서 근무하고 있는 직원들 중에서 급여가 가장 높은 직원 순서대로 출력
--> (SALARY가 제대로 정렬이 안된 것 같지만 같은 부서에서의 급여가 내림차순으로 잘 정렬된 상태임)
--> 먼저 부서ID를 오름차순으로 정렬하고 급여를 내림차순으로 정렬한 것



   -- NULL 이란?
--> NULL 값 이란 데이터의 값이 완전히 비어있는 상태를 말한다.
--> 값이 존재하지 않거나 정해지지 않은 것을 의미한다.
--> 숫자 0과 문자열' '은 NULL 값이 아니다.
--> NULL 과 연산하면 결과 값은 무조건 NULL 값이 나온다!!
--> NULL 은 비교하면 무조건 FALSE 값이 나온다!!


-- 실습1) 직원테이블에서 직원ID, 보너스, 보너스 2배의 정보 출력
--        단 "보너스 2배"의 정보는 "UP_BONUS"로 별칭을 지어준다!
SELECT * FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT * 2 AS "UP_BONUS"
  FROM EMPLOYEES ;






  
  