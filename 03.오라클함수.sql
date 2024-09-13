   -- CHAPTER 03. 오라클 함수 --

 -- 함수 (Function) 이란?
-- 입력 값을 넣어서 특정한 기능을 통해 결과 값을 출력하는 것

-- 사용자 정의함수 : 사용자가 필요에 의해 직접 정의한 함수
-- 내장 함수 : 오라클에서 미리 만들어 놓은 함수, 필요할 때마다 호출해서 사용
-- 내장 함수는  문자형, 숫자형, 날짜형, 변환형, NULL 함수, 조건함수 가 있다.

-- 함수를 실행할 때 사용하는 입력 값 >> 매개변수, 인자값



   -- [ 문자형 함수 ]
   
-- UPPER : 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력
-- LOWER : 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력

 -- 사용 방법
-- UPPER(데이터)
-- LOWER(데이터)

SELECT  UPPER('abcde123@@')
  FROM  DUAL ;

 -- DUAL 테이블이란?
--> 오라클 최고관리자 SYS소유의 테이블
--> 임시 연산이나 함수의 결과 값 확인 용도로 사용하는 테스트용(가상의) 테이블!!


-- 문제1) 직원테이블에서 직원의 FIRST_NAME 과 EMAIL 정보 출력,
--       FIRST_NAME은 대문자로, EMAIL정보는 소문자로 출력
SELECT FIRST_NAME, UPPER(FIRST_NAME)
     , EMAIL, LOWER(EMAIL)
  FROM EMPLOYEES ;


-- 문제2) DUAL 테이블을 이용해서 'HELLO WORLD' 문자열을 소문자로 바꿔서 출력
SELECT LOWER('HELLO WORLD')
  FROM DUAL;
  


  -- LENGTH : 괄호 안 문자 데이터의 길이를 구하는 함수이다.
SELECT LENGTH('HELLO WORLD')
  FROM DUAL ;


-- 문제1) 직원테이블에서 직원의 FIRST_NAME 과 FIRST_NAME의 길이 출력
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES ;


-- 문제2) 직원의 FIRST_NAME의 길이가 5인 이상의 직원들의 직원ID, FIRST_NAME 출력
SELECT EMPLOYEE_ID, FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES 
 WHERE LENGTH(FIRST_NAME) >= 5;
 
 
 
  -- SUBSTR : 문자열을 추출하는 함수
-- 1) SUBSTR (입력 값, 시작위치, 추출길이)   
 --> 해석) 문자열 데이터의 시작위치부터 추출길이만큼 출력
-- 2) SUBSTR (입력 값, 시작위치)
 --> 해성) 추출길이 생략 시 문자열 데이터의 시작위치부터 끝까지 출력

SELECT '스마트인재개발원'
     , SUBSTR('스마트인재개발원', 1, 3) AS "스마트"
     , SUBSTR('스마트인재개발원', 4 )
  FROM DUAL;
 
 
-- 문제1) 직원테이블에서 입사날짜를 연도, 월, 일 별로 출력
--        각 컬럼에는 연도, 월, 일 별로 별칭을 사용하여 출력
SELECT * FROM EMPLOYEES;
 
SELECT HIRE_DATE
     , SUBSTR(HIRE_DATE, 1 , 2) AS "연도"
     , SUBSTR(HIRE_DATE, 4 , 2) AS "월"
     , SUBSTR(HIRE_DATE, 7) AS "일"
  FROM EMPLOYEES;



  -- REPLACE : 특정 문자를 다른 문자로 바꾸어 주는 함수
-- 1) REPLACE (문자열 데이터 및 컬럼, 바꾸고 싶은 문자, 바꿔야 할 문자)
-- 2) REPLACE (문자열 데이터 및 컬럼, 바꾸고 싶은 문자)
 --> 바꿔야 할 문자를 생략 시 바꾸고 싶은 문자는 데이터에서 삭제됨!
 
SELECT '스마트##인재개발원'
     , REPLACE ('스마트##인재개발원', '#', '-') AS "하이픈으로바꿈"
     , REPLACE ('스마트##인재개발원', '#') AS "삭제가됨"
  FROM DUAL;
 
 
-- 문제1) 직원테이블에서 입사날짜를 출력하되
-- /(슬러시) 문자열을 -(하이픈)으로 바꿔서 출력
-- /(슬러시)를 삭제하고 출력
 SELECT HIRE_DATE
     , REPLACE (HIRE_DATE, '/', '-')
     , REPLACE (HIRE_DATE, '/')
  FROM EMPLOYEES ;



-- CONCAT : 두 문자열 데이터를 합치는 함수
-- CONCAT (문자열1, 문자열2)
-- || : 합성 연산자 -> 이 합성 연산자를 이용하면 무한대로 문자열 연결이 가능하다!

SELECT CONCAT('스마트', ' 인재개발원') || ' 최고예요' || ' 맞나요?'
  FROM DUAL ;
  
  

  -- TRIM : 입력 받은 문자형 데이터의 양 끝의 공백을 제거해주는 함수

SELECT TRIM('          여러분은 최고예요          ')
     , REPLACE(TRIM('          여    러   분    은 최   고 예   요          '), ' ')
     , REPLACE('          여    러   분    은 최   고 예   요          ', ' ')
  FROM DUAL ;



   -- [ 숫자형 함수 ] --

  -- ROUND : 특정 위치에서 반올림 하는 함수
-- 1) ROUND(반올림 할 숫자, 반올림 위치)
-- 2) ROUND(반올림 할 숫자)
--> 반올림 위치 생략 시 소수점 첫 번째 자리에서 강제로 반올림이 된다.

SELECT ROUND(1234.56789, 1)
     , ROUND(1234.56789, 2)
     , ROUND(1234.56789)
  FROM DUAL ;
  
  
  -- TRUNC : 특정 위치에서 버리는 함수
-- 1) TRUNC(버림 할 숫자, 버림 위치) 
-- 2) TRUNC(버림 할 숫자)
 --> 버림 위치 생략 시 소수점 첫 번째 자리에서 강제로 버림이 된다.

SELECT TRUNC(1234.56789,1)
     , TRUNC(1234.56789)
  FROM DUAL ;


  -- MOD: 숫자를 나눈 나머지 값을 구하는 함수
-- MOD(나눗셈 될 숫자, 나눌 숫자)
 --> 홀수, 짝수를 구분할 때 사용

SELECT MOD(10,2)
     , MOD(10,3)
     , MOD(15,6)
  FROM DUAL ;



   -- [ 날짜형 함수 ]

  -- SYSDATE : 현재 날짜와 시간을 출력해주는 함수
 --> 입력 시 바로 출력이 되며, 현재 시간을 초 단위까지 출력 가능
--> 날짜형 데이터는 연산 가능
--> BUT, 날짜 데이터끼리는 연산 불가능

SELECT SYSDATE
  FROM DUAL;

-- 날짜형식 셋팅하는 방법
--> 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식 > YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE AS NOW
     , SYSDATE - 1 AS YESTERDAY
     , SYSDATE + 1 AS TOMORROW
--     , SYSDATE + SYSDATE -> 날짜 데이터끼리는 연산 불가!!
  FROM DUAL ;


  -- 날짜데이터 활용
SELECT SYSDATE AS 현재
     , SYSDATE +1 AS 하루더한것
     , SYSDATE +1 /24 AS 한시간더한것
     , SYSDATE +1 /24 /60 AS 일분더한것
     , SYSDATE +1 /24 /60/ 60 AS 일초더한것
  FROM DUAL;


  -- ADD_MONTHS : 몇 개월 이후 날짜를 구하는 함수
-- ADD_MONTHS(날짜데이터, 더하거나 뺄 개월 수)
 --> +는 생략 가능하고, -는 생략 불가능

SELECT SYSDATE AS 현재
     , ADD_MONTHS(SYSDATE, 1) AS "1개월 후"
     , ADD_MONTHS(SYSDATE, -3) AS "3개월 전"
  FROM DUAL ;



   -- [ 변환형 함수 ]

-- 형 변환 형태 종류
-- 암시적 형변환 : 데이터 베이스가 자동으로 형변환을 해주는 것
-- 명시적 형변환 : 데이터 변환 형 함수를 사용해서 사용자가 직접 자료형을 지정 해주는 것

  -- TO_CHAR : 날짜, 숫자 데이터를 문자 데이터로 변환해주는 함수
-- TO_CHAR(변환 할 데이터, 출력 형태)

SELECT SALARY
    , TO_CHAR(SALARY , 'L999,999')
  FROM EMPLOYEES ;

 -- 숫자 표현 형식
-- 9 : 숫자의 한 자리를 의미함
-- 0 : 빈 자리를 0으로 채움을 의미
-- $ : 달러 표시를 붙여서 출력
-- L : 지역 화폐 단위 기호를 붙여서 출력
-- . : 소수점을 표시
-- , : 천 단위의 구분 기호 표시

 -- 날자 표현 형식
-- YYYY,RRRR : 연 (4자리 숫자)
-- YY, RR    : 연(2자리 숫자)
-- MM        : 월(2자리 숫자)
-- MON       : 월(월 이름 약자)
-- MONTH     : 월(월 이름 전체)
-- DD        : 일(2자리 숫자)
-- DAY       : 요일(요일 이름 전체)


-- 문제1) DUAL 테이블을 이용해서 현재 날짜 형태를 'YY/MM/DD/DAY'형태로 변환해주세요!
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD/DAY')
  FROM DUAL ;


  -- TO_NUMBER : 문자 데이터를 숫자 데이터로 변환하는 함수
-- TO_NUMBER(문자열 데이터, 인식될 숫자 형태)
 --> 인식될 숫자 형태에서 문자형은 ''로 감싸줘야하고, 숫자형은 감싸주지 않아도 된다
 --> ex) '999,999' , 999999
SELECT TO_NUMBER('1,000' , '999999') + 500
  FROM DUAL;

  
  -- TO_DATE : 문자 데이터를 날짜 데이터로 변환하는 함수
-- TO_DATE(문자열 데이터, 인식될 날짜 형태)
SELECT TO_DATE('20240329' , 'YYYY/MM/DD')
  FROM DUAL ;

   -- [ NULL 처리 함수 ]
-- NVL / NVL2 함수 : NULL 값을 대체 할 수 있는 함수
 -- 1) NVL 사용방법
-- NVL(NULL인지 여부를 검사할 데이터 , 앞의 데이터가 NULL일 경우 반환할 데이터)
 -- 2) NVL2 사용방법
-- NVL2 (NULL인지 여부를 검사할 데이터 , 앞의 데이터가 NULL이 아닐 경우 반환할 데이터 , 앞의 데이터가 NULL일 경우 반환할 데이터)


-- 문제1) 직원테이블에서 보너스(COMMISSION_PCT)가 NULL인 경우 숫자 0으로 대체해서 출력
SELECT FIRST_NAME, COMMISSION_PCT
     , NVL(COMMISSION_PCT , 0)
  FROM EMPLOYEES;


-- 문제2) 직원테이블에서 직원ID, FIRST_NAME, MANAGER_ID 를 출력
--       매니저가 있는 직원은 '직원'으로 출력
--       매니저가 없는 직원은 '대표'로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , NVL2(MANAGER_ID , '직원' , '대표')
  FROM EMPLOYEES ;



   -- [ 조건 함수 ]

  -- DECODE : 상황에 따라 다른 데이터를 반환하는 함수
--> 검사대상과 비교해서 지정한 값을 반환

-- DECODE (검사대상이 될 컬럼 또는 데이터 <1> , 비교 값 <2> , 일치 시 반환할 값 <3> , 일치하지 않을 시 반환 값 <마지막> )


-- 문제1) 직원테이블에서 직원ID, FIRST_NAME, MANAGER_ID 를 출력
--       매니저가 있는 직원은 '직원'으로 출력
--       매니저가 없는 직원은 '대표'로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE (MANAGER_ID , NULL , '대표' , '직원')
  FROM EMPLOYEES ;
  
-- 문제1-1) 102면 이사, 103이면 감사, 그게 아니면 직원  
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE (MANAGER_ID , NULL , '대표' , 102 , '이사' , 103 , '감사' , '직원')
  FROM EMPLOYEES ;










