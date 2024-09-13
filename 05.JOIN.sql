   -- CHAPTER 05. JOIN --

   -- [ JOIN : 여러 테이블에서 필요한 데이터를 한 번에 가져오는 기술
-- 필요한 데이터가 두 개 이상 테이블에 나누어져 있을 때 데이터를 합쳐서 가져오고자 할 때 사용
-- 일반적으로 사용되는 SQL문장의 대다수가 조인


   -- Non EQUL JOIN : 비등가 조인
-- 두 개의 테이블 간의 서로 정확하게 일치하지 않는 경우 활용하는 조인
--> 등가연산자(=)가 아닌 연산자들을 사용한 조인( > , >= , <= , < , BETWEEN )
 
   --  EQUL JOIN : 등가 조인
-- 두 개의 테이블 간의 서로 정확하게 일치하는 경우 활용하는 조인
--> 등가 연산자를 사용해서 조인( = )
 --> 가장 많이 사용되는 조인의 형태
 
 
 
   -- [ 등가 조인 사용 방법 ]
-- SELECT    테이블1.컬럼(명), 테이블2.컬럼,... ->  해당테이블에 있는 컬럼 조회
--   FROM    테이블1, 테이블2                  ->  테이블1과 테이블2를 JOIN 하겠다!!
--  WHERE    테이블1.컬럼 = 테이블2.컬럼 ;      ->  같은 값을 가지는 조인 조건 작성

--  WHERE절에 JOIN 조건을 기술한다.


-- 문제1) 수강생정보 테이블과 성적표 테이블에서 학생ID, 이름, 과목, 성적 순으로 출력

-- 1. 조인할 대상 테이블의 정보 확인
SELECT * FROM 수강생정보;
SELECT * FROM 성적표;
-- 2. FROM절에 조인할 테이블을 ,(콤마)를 기준으로 작성
-- 3. 조인 조건이 되는 특정 컬럼을 확인하여, WHERE조건절에 조인 조건 작성
 --> 조인 조건이 되는 특정 컬럼 : 조인할 테이블 간에 같은 값을 가지는 컬럼!!
 --> 조인 조건이 되는 특정 컬럼은 PK와 FK 관계로 대부분 이루어진다
 --> BUT, 다 그런 것은 아님!!
-- 4. SELECT절에 출력하고자 하는 컬럼을 .(경로)를 통해서 출력
SELECT 수강생정보.학생ID , 수강생정보.학생이름
     , 성적표.과목 , 성적표.성적
  FROM 수강생정보 , 성적표
 WHERE 수강생정보.학생ID = 성적표. 학생ID ;



   -- FROM절 별칭 활용

-- SELECT 별칭1.컬럼명, 별칭2.컬럼명,...
-- FROM 테이블1 별칭1, 테이블2 별칭2

 --> FROM 뒤 테이블에 별칭을 주게 되면 별칭사용 이후 
--   실행되는 절(SELECT,WHERE등)들은 모두 별칭만 사용해야 함


-- 문제1-1) 별칭사용
SELECT A.학생ID , A.학생이름
     , B.과목 , B.성적
  FROM 수강생정보 A , 성적표 B
 WHERE A.학생ID = B. 학생ID ;


-- 문제2) 직원의 직원ID, FIRST_NAME, 부서이름 순으로 조회
-- 1. 조인 대상 테이블의 정보 확인(직원테이블, 부서테이블)
-- 2. 조인할 테이블을 FROM절에 콤마(,)를 기준으로 명시(FROM)
-- 3. 조인 조건에 해당하는 특정 컬럼을 찾고, WHERE조건절에 조인 조건 기재(WHERE)
-- 4. 조회하고자 하는 컬럼명 작성(SELECT)
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT E.EMPLOYEE_ID , E.FIRST_NAME , D.DEPARTMENT_NAME , E.DEPARTMENT_ID
  FROM EMPLOYEES E , DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- 문제3) 직원ID가 100인 직원의 FIRST_NAME과 부서이름 출력
-- 직원테이블을 E, 부서테이블을 D로 별칭 작성
SELECT E.EMPLOYEE_ID , E.FIRST_NAME , D.DEPARTMENT_NAME
  FROM EMPLOYEES E , DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
   AND EMPLOYEE_ID = 100;


   -- [ ANSI 조인 문법 : 미국 표준협회에서 만든 모든 DBMS에서 사용 가능한 문법
   
 -- INNER JOIN : '내부조인' 이라고 하며 조인 조건에서 동일한 값이 있는 행만 반환

-- [ INNER JOIN의 사용방법 ]
-- SELECT     조회할 컬럼명 ,...
-- FROM       테이블1 (INNER) JOIN 테이블2
-- ON ( 테이블1.컬럼 = 테이블2컬럼 ) -> 조인 조건
-- WHERE ( 일반 조건절 ) -> 조인 조건 외 다른 조건


-- 문제1) 직원테이블과 직업테이블을 INNER JOIN을 사용하여 직원ID, 직업ID, 직업TITLE 출력
SELECT E.EMPLOYEE_ID 
     , J.JOB_ID
     , J.JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
    ON (E.JOB_ID = J.JOB_ID) ;
    
 --> *조인 조건은 대부분 PK와 FK 관계로 이루어진다.
 --> 하지만 다 그런 것은 아니다!!(직원테이블과 부서테이블의 매니저아이디)


-- 문제2) 직원테이블에서 직원아이디와 부서아이디
--       부서테이블에서 부서이름을 순서대로 출력(INNER JOIN 활용)
SELECT E.EMPLOYEE_ID
     , E.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);
--> JOIN은 ON이라는 키워드로 조인조건해줘야한다!
-- 단독적으로 존재하는 컬럼은 .(경로)를 적어주지 않아도 상관없다.



   -- [ CROSS JOIN : 조인 조건절을 적지 않고 테이블의 모든 데이터를 가지고 오는 방법
--> 조인 조건이 없는 경우 생길 수 있는 모든 데이터의 조합을 조회
 --> '카티션 곱'이라고 부른다 -> 모든 경우의 수가 출력
 --> 카티션 곱 결과 발생
 
 
 
    -- [ CROSS JOIN의 사용방법 ]
-- SELECT     조회할 테이블 명, ...
-- FROM       테이블1 CROSS JOIN 테이블2 ;


-- 문제2) 직원테이블에서 직원아이디와 부서아이디
--       부서테이블에서 부서이름을 순서대로 출력(CROSS JOIN 활용)
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D ;

 --> 직원테이블 107 행 * 부서테이블 27 행 = 2889개의 행  
 -- => 카티션 곱 


-- 문제3) 각 부서의 매니저 직원들의 부서이름, 매니저아이디, FIRST_NAME 출력 (INNER JOIN)
SELECT * FROM DEPARTMENTS;

SELECT D.DEPARTMENT_NAME
     , D.MANAGER_ID
     , E.FIRST_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;
--> 부서테이블의 매니저아이디는 직원테이블의 직원아이디와 같은 값이어서
--  MANAGER_ID와 EMPLOYEE_ID의 같은 값을 가지는 것을 조인해야 한다.
 --> 무조건 같은 값을 조인 조건에 기술하는 것이 아니라 구하려는 값에 맞는 조인 조건을 걸어줘야 된다!



   -- [ OUTER JOIN : 외부 조인이라고 하며, 두 개의 테이블 간의 교집합을 조회하고
                  -- 한 쪽 테이블에만 있는 데이터도 포함시켜서 조회하고 싶을 때 사용하는 조인 문법
             --> 한 쪽 데이터의 NULL값도 출력하고 싶을 때 사용


  -- LEFT OUTER JOIN : 왼쪽 테이블을 기준으로 NULL값도 포함하여 출력
--> 오라클 문법 조인 시 : 조인 조건절에 반대인 오른쪽 컬럼에 (+) 기호 작성

  -- RIGHT OUTER JOIN : 오른쪽 테이블을 기준으로 NULL값도 포함하여 출력
--> 오라클 문법 조인 시 : 조인 조건절에 반대인 왼쪽 컬럼에 (+) 기호 작성

  -- FULL OUTER JOIN : 양쪽의 NULL값도 포함하여 출력
--> 오라클 문법에서는 지원 안함 , UNION 연산자로 같은 값을 출력하는 방법이 있다.


 --> ANSI 표준문법

-- SELECT     조회할 컬럼명 ,...
--   FROM     테이블1 LEFT (OUTER) JOIN 테이블2
--     ON     테이블1.컬럼 = 테이블2.컬럼 

 --> 오라클 문법
 
-- SELECT     조회할 컬럼명 ,...
--   FROM     테이블1 , 테이블2
--  WHERE     테이블1.컬럼 = 테이블.2컬럼 (+)



-- 문제1) 각 부서의 매니저 직원들의 부서이름, 매니저아이디, FIRST_NAME 출력 (INNER JOIN)
 --> 부서테이블의 각 매니저 이름의 정보가 출력이 됐다 (부서 장)
SELECT * FROM DEPARTMENTS;

SELECT D.DEPARTMENT_NAME , D.MANAGER_ID , E.FIRST_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;

-- 문제1-1) LEFT OUTER JOIN 활용
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID , E.FIRST_NAME
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID ;
    
-- 문제1-2) 오라클 문법 활용
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID , E.FIRST_NAME
  FROM DEPARTMENTS D , EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID (+) ;

-- 문제1-3) RIGHT OUTER JOIN
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID , E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID ;

-- 문제1-4) 오라클 문법
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID (+) = E.EMPLOYEE_ID ;

-- 문제1-5) FULL OUTER JOIN
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID ;
--> 양 쪽의 NULL값인 16개의 행(LEFT JOIN)과 107개의 행(RIGHT JOIN) = 123개의 행이 나온다



   -- 3개 이상 테이블 조인 사용방법
   
 --> ANSI 표준문법
 
-- SELECT     조회할 컬럼명 ,...
--   FROM     테이블1 JOIN 테이블2
--     ON     (조인조건식) JOIN 테이블3
--     ON     (조인조건식)

 --> 오라클 문법
 
-- SELECT     조회할 컬럼명 ,...
--   FROM     테이블1 , 테이블2 , 테이블3
--  WHERE     테이블1.컬럼 = 테이블.2컬럼
--    AND     테이블2.컬럼명 = 테이블3.컬럼명 ;


-- 문제1) 부서테이블, 위치테이블, 나라테이블을 INNER JOIN 해서 부서이름, 도시, 나라이름 출력
SELECT D.DEPARTMENT_NAME , L.CITY , C.COUNTRY_NAME
  FROM DEPARTMENTS D INNER JOIN LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID)
       JOIN COUNTRIES C ON (L.COUNTRY_ID = C.COUNTRY_ID);

-- 문제1-1) 오라클 문법
SELECT D.DEPARTMENT_NAME , L.CITY , C.COUNTRY_NAME
  FROM DEPARTMENTS D , LOCATIONS L , COUNTRIES C
 WHERE D.LOCATION_ID = L.LOCATION_ID
   AND L.COUNTRY_ID = C.COUNTRY_ID ;



