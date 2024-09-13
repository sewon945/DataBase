   -- CHAPTER 08. 서브쿼리 --

  -- 서브쿼리란?
--> SQL문을 실행하는데 필요한 데이터를 추가로 조회하기 위해서
--> SQL 내부에서 사용하는 SELECT 문을 의미한다.
--> 서브쿼리는 메인쿼리 안에 포함된 종속적인 관계이다.


-- 메인쿼리 : 서브 쿼리의 결과값을 사용하여 기능을 수행하는 영역
-- 서브쿼리 : 메인 쿼리의 조건식에 들어가는 값을 의미


-- SELECT 조회할 열
--   FROM 조회할 테이블
--  WHERE 조건식 (SELECT
--                 FROM
--                WHERE);


-- 문제1) 직원테이블에서 Jack의 급여보다 낮은 직원의 이름과 급여 출력

-- 1. 조건의 기준이 되는 Jack의 급여의 정보 확인
-- 2. 1번째의 결과값을 가지고 조건절을 통해서 결과값 출력

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Jack';  -- 잭의 급여 : 8400

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < 8400 ;

-- 문제 1-1) 서브쿼리 이용
SELECT FIRST_NAME
     , SALARY
  FROM EMPLOYEES 
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES
                  WHERE FIRST_NAME = 'Jack') ;
--> 메인쿼리의 조건 개수와 서브쿼리의 조건의 개수는 같아야한다


-- 문제2) 직원테이블에서 James의 급여보다 낮은 직원의 이름과 급여 정보 조회
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



  -- 서브쿼리의 특징
-- 1. 서브쿼리는 연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓으며 () 로 묶어서 사용한다.
-- 2. 서브쿼리의 SELECT 절에 명시한 컬럼은 메인쿼리의 비교 대상과 같은 자료형과 개수를 지정해야한다.
-- 3. 서브쿼리에 있는 SELECT 문의 결과 행 수는 함께 사용하는 메인쿼리의 "연산자 종류"와 호환 가능해야한다.
-- 즉, 단 하나의 데이터로만 연산 가능한 연산자면 서브 쿼리의 결과 행 수도 하나여야만 한다.
-- 연산자와 함계 상호 작용하는 방식에 따라서 단일행 서브쿼리와 다중행 서브쿼리로 나뉜다.



  -- 단일행 서브쿼리란?
--> 실행 결과가 단 하나의 행으로 나오는 서브쿼리를 말한다.
 --> =(같다) , > , >= , <= , < (크거나 작거나), != , <> , ^=(같지않다)



  -- 다중행 서브쿼리
--> 실행 결과 행이 여러 개로 나오는 서브쿼리를 말한다.
 --> 단일행 연산자는 사용할 수 없고 다중행 연산자를 사용해야 한다



-- 문제1) 직원테이블에서 Nancy보다 빨리 입사한 직원의 이름(FIRST_NAME)과 입시일(HIRE_DATE) 조회

-- (1) 낸시의 입사 날짜 정보 (서브쿼리의 값)
SELECT HIRE_DATE
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Nancy';  -- 2002/08/27

-- (2) 단일행 서브쿼리를 이용해 출력
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE < (SELECT HIRE_DATE
                      FROM EMPLOYEES
                     WHERE FIRST_NAME = 'Nancy');


-- 문제2) 직원테이블에서 직원의 평균급여 보다 높은 급여를 받는 직원의 FIRST_NAME과 SALARY 정보 조회

-- (1) 직원의 평균급여 정보 (서브쿼리의 값)
SELECT AVG(SALARY)
  FROM EMPLOYEES;  --6462

-- (2) 단일행 서브쿼리를 이용해 출력
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > (SELECT AVG(SALARY)
                   FROM EMPLOYEES );


 -- 다중행 서브쿼리
--> 실행 결과 행이 여러 개로 나오는 서브쿼리
--> 단일행 연산자로는 사용할 수 없다. 다중행 연산자를 사용해야 한다!!


-- 문제3) 각 부서별 최고급여와 동일한 급여를 받는 직원의 정보 출력
-- (부서ID, FIRST_NAME, 급여)

-- (1) 부서별(GROUP_BY) 최고급여 (서브쿼리의 값)
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;

-- (2) 1번의 결과값을 가지고 단일행 서브쿼리를 이용해 출력 - 오류
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY = (SELECT MAX(SALARY)
                   FROM EMPLOYEES 
                 GROUP BY DEPARTMENT_ID);



   -- [ 다중행 연산자의 종류 ]
-- IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있으면 TRUE값 반환
 --> IN (서브쿼리)
 
-- ANY , SOME : 메인쿼리의 조건식을 만족하는 서브퀄이의 결과가 하나 이상이며 TRUE값 반환
 --> 비교연산자 ANY (서브쿼리)
 
-- ALL : 메인쿼리의 조건식을 서브쿼리의 결과가 모두 만적해야만 TRUE값 반환
 --> 비교연산자 ALL (서브쿼리)
 
-- EXISTS : 서브쿼리 결과값이 존재하는지 여부 확인 ( 즉, 행이 하나 이상이면 TRUE)
 --> EXISTS (서브쿼리)



 --IN 연산자 활용
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY IN (SELECT MAX(SALARY)
                   FROM EMPLOYEES 
                 GROUP BY DEPARTMENT_ID);



 -- ANY 연산자 활용
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY = ANY (SELECT MAX(SALARY)
                       FROM EMPLOYEES 
                   GROUP BY DEPARTMENT_ID);
--> IN연산자와 같은 결과값 출력



 -- 부서별 최고 급여와 같은 급여를 가지는 모든 직원들이 출력 된 것이다
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY IN (SELECT MAX(SALARY)
                   FROM EMPLOYEES 
                  GROUP BY DEPARTMENT_ID);



 -- ANY와 ALL 연산자에 대소비교 연산자를 사용하게 되면 생각을 해봐야한다
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY  >= ANY (SELECT MAX(SALARY)
                         FROM EMPLOYEES 
                      GROUP BY DEPARTMENT_ID);
-- 부서별 최소 급여와 최고 급여를 가지는 값 중에서 높은 값은 다 출력이 된다!
 
-- 부서별 최고 급여가 하나라도 참이면 참이 반환되는 것이 ANY 연산자!
-- 값들 중 어떤 하나의 값보다 메인쿼리의 값이 큰 값을 가지면 모든 값이 출력이 된다!
--> 부서별 최소 급여보다 높은 값은 다 출력이 된 것이다!



 -- ALL 연산자 활용
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY  >= ALL (SELECT MAX(SALARY)
                         FROM EMPLOYEES 
                      GROUP BY DEPARTMENT_ID);
-- ALL : 서브 쿼리의 결과에 존재하는 모든 값들에 대한 조건을 만족해야한다
--> 메인쿼리는 서브쿼리의 모든 결과 값을 만족해야한다.
--> 서브쿼리의 결과 값 중에 가장 큰 값이 24000 과 비교해서 크거나 같은 값을 가진 데이터만 출력
--> 결과적으로 최대값보다 큰건만 출력이 된다



 -- EXSIST 연산자는 존재 여부만 확인한다
SELECT DEPARTMENT_ID , FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 110
                
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EXISTS (SELECT DEPARTMENT_ID , FIRST_NAME
                 FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 110 ) ;
--> 서브쿼리의 결과값이 존재를 하냐 안하냐만 나타낸다
--> 서브쿼리의 결과값이 존재하면 결과값 출력O , 결과값이 존재하지 않으면 결과값 출력X
 
 
 
 -- 다중 컬럼 서브쿼리
--> 서브 쿼리의 결과롤 여러 컬럼이 반환되어 메인쿼리의 조건과 동시에 비교 되는 것을 의미
--> 주로 IN 연산자와 함께 사용


-- 문제1) 각 부서별 최고 급여와 동일한 급여를 받는 직원의 정보 출력
-- (부서ID, FIRST_NAME, 급여 정보 )
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY)
                                     FROM EMPLOYEES 
                                  GROUP BY DEPARTMENT_ID);
 --> 2개의 컬럼을 비교해서 해당 부서별로 최고 급여를 받는 직원만 출력 (제한이 되는 것을 확인 가능)



   -- [ 인라인 뷰 ( Inline View )]
-- FROM 절에서 가상 테이블처럼 사용하는 서브쿼리
-- 인라인 뷰를 사용하면 서브쿼리의 결과를 마치 테이블처럼 사용할 수 있다.
-- 인라인 뷰는 쿼리 냉서 즉시 처리된다.


-- 문제1) 부서별로 최고 급여를 받는 직원의 FIRST_NAME, 부서ID, 부서별 최고급여 출력
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;



 -- 인라인 뷰 활용
SELECT A.FIRST_NAME, A.DEPARTMENT_ID, B."MAX_SALARY"
  FROM EMPLOYEES A , (SELECT DEPARTMENT_ID, MAX(SALARY) AS "MAX_SALARY"
                      FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID ) B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND A.SALARY = "MAX_SALARY" ;
--> 인라인 뷰는 별칭을 주지 않으면 내부 컬럼을 지정할 수가 없다.
--> 별칭을 줘야만 원하는 컬럼을 지정해서 쓸 수가 있다.
 


 -- [ 스칼라 서브쿼리 ( Scalar Subquery )]
-- SELECT에서 사용되는 서브쿼리
-- 하ㅏ나의 컬럼에 대한 하나의 행만 반환하는 특징을 가지고 있다.
-- JOIN 없이 JOIN처럼 기능하고자 할 때 사용


-- 문제1) 직원이름(FIRST_NAME), 급여(SALARY), 부서아이디(DEPARTMENAT_ID), 부서이름(DEPARTMENT_NAME) 출력
SELECT E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID,D.DEPARTMENT_NAME , D.LOCATION_ID
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

SELECT * FROM DEPARTMENTS;

 -- 스칼라 서브쿼리 이용
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID, (SELECT DEPARTMENT_NAME
                                             FROM DEPARTMENTS
                                            WHERE DEPARTMENT_ID = E.DEPARTMENT_ID ) AS 부서이름
  FROM EMPLOYEES E ;
















 
 

