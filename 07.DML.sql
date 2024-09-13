   -- CHAPTER 07. DML(Data Manipulation Language) --

-- 실습) 테이블 이름은 테이블명_JOIN 으로 생성
--      회원가입 기능을 하기 위해서 아이디, 비밀번호, 이름, 가입날짜, 나이, 전화번호, 이메일 정보를 받을 예정이다
--      컬럼명, 자료형, 제약조건 작성
CREATE TABLE ASDFG_JOIN(
    ID VARCHAR2(20) PRIMARY KEY ,
    PW VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(10) NOT NULL,
    JOIN_DATE DATE ,
    AGE NUMBER(3),
    TEL VARCHAR2(20),
    EMAIL VARCHAR2(50) UNIQUE
);

SELECT * FROM ASDFG_JOIN ;



  -- DML이란?
--> 데이터 조작어로 테이블에 데이터를 조회, 추가, 수정, 삭제 할 때 사용하는 질의어이다.
 --> 테이블에서 원하는 데이터를 입력, 수정, 삭제한다!!


  -- [ DML의 유형 -(세인업데)
-- SELECT : 데이터 조회
-- INSERT : 데이터 추가
-- UPDATE : 데이터 수정
-- DELETE : 데이터 삭제


 -- 사용방법 1)
-- INSERT INTO 테이블명 ( 컬럼1 , 컬럼2, ...)
-- VALUES( 값1 , 값2, ...) ; 
 --> INSERT INTO 에 입력한 컬럼과 VALUES 에 입력한 값은 순서와 자료형이 맞아야한다!!

 -- 사용방법 2)
-- INSERT INTO 테이블명
-- VALUES( 입력값... );
 --> INSERT INTO 에 컬럼 리스트를 생략 시 VALUES 에 입력한 값은 테이블의 컬럼 수의 순서와 맞아야한다!!



-- 1. ASDFG_JOIN 테이블에 나의 정보 넣기
INSERT INTO ASDFG_JOIN(ID, PW, NAME, JOIN_DATE, AGE, TEL,EMAIL)
VALUES ('ASDFG1', '12345', '오세원', SYSDATE, 24, '010-2882-9690', 'energizer710@naver.com') ;

SELECT * FROM ASDFG_JOIN ;


-- 2. 친구 정보 넣기
INSERT INTO ASDFG_JOIN(ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('ASDFG2', '56789', '유나경', SYSDATE, 24, '010-8847-6135', 'rornf@naver.com');



-- 1) 테이블에 NULL값 입력하기  --> NULL을 명시적으로 입력해줬다.
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('ASDFG3', '11111', '모경선', SYSDATE, 24, NULL, '');


-- 2) 테이블에 NULL값 입력하기  --> NULL을 암시적으로 입력해줬다.
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOIN_DATE, AGE)
VALUES ('ASDFG4', '22222', '이승현', SYSDATE, 24 );



   -- 테이블 생성시 에러 리스트 

-- 1. 컬럼리스트와 입력 값의 개수가 다른 경우
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL 오류: ORA-00913: too many values 
--> 컬럼 리스트의 갯수와 입력 값 개수는 일치해야 한다!

-- 2. 식별자에 NULL을 입력한 경우
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."ASDFG_JOIN"."ID")
--> 컬럼에 대한 제약조건에 맞게 작성 해야함 (식별자는 NOT NULL + UNIQUE 중복불가)

-- 3. NOT NULL인 컬럼에 NULL을 넣은 경우
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."ASDFG_JOIN"."NAME")
--> 컬럼에 대한 제약조건에 맞게 작성 해야함 ( NOT NULL 조건 )

-- 4. 자료형에 맞지 않게 입력 값을 넣은 경우
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, '29살', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> 컬럼에 대한 자료형에 맞게 작성이 되야 한다. (AGE는 숫자형 자료형)

-- 5. 식별자 컬럼에 중복 값을 넣을 려는 경우
INSERT INTO ASDFG_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> 값이 들어간 상태에서 한번더 실행이 되면 식별자가 값이 중복이 되서 에러가 남

SELECT * FROM ASDFG_JOIN;



 -- 1) 컬럼리스트를 쓰지 않고 INSERT 하는 방법
INSERT INTO ASDFG_JOIN
VALUES ('ASDFG5','00000','정보영', SYSDATE, 46, '010-5886-7250', 'oksjis111@naver.com');
--> 실제 입력값을 적을 때는 테이블에 명시된 컬럼의 순서와 똑같이 써야한다!

 -- 2) 컬럼리스트를 쓰지 않고 INSERT 하는 방법 - 오류
INSERT INTO ASDFG_JOIN
VALUES ('ASDFG6','00000','오광성', SYSDATE, 46, '010-5886-7250');
--> 실제 입력값을 적을 때는 테이블에 명시된 컬럼의 순서와 똑같이 써야한다! 



 -- UPDATE 사용 방법
 
-- UPDATE 테이블명
--    SET 변경할 컬럼 = 변경할 데이터, .....
--  WHERE 데이터를 변경할 대상 행을 선별하기 위한 조건식 ;
 ---> *** WHERE 조건절을 생략할 경우 테이블 내 저장된 모든 컬럼의 데이터가 변경이 된다!!

SELECT * FROM ASDFG_JOIN ;

UPDATE ASDFG_JOIN
   SET AGE = 47 
 WHERE NAME = '정보영' ;


-- 조건을 걸 때에는 PK로 거는 것이 가장 올바르다!
UPDATE ASDFG_JOIN
   SET TEL = '010-4879-1406' , EMAIL = 'LEE@NAVER.COM'
 WHERE ID = 'ASDFG4' ;



  -- DELETE : 데이터를 삭제할 때 사용하는 명령어
 -- DELETE 사용방법
 
-- DELETE FROM 테이블명
-- WHERE 삭제할 대상 행을 선별하기 위한 조건식 ;
 --> *** WHERE 조건절을 생략할 경우 테이블의 모든 데이터가 삭제된다!!

DELETE FROM ASDFG_JOIN
WHERE ID = 'ASDFG4' ;


-- 30살 이하인 회원들의 정보 삭제
DELETE FROM ASDFG_JOIN
 WHERE AGE <= 30 ;

ROLLBACK;   --> 처음으로 되돌리는 명령어 

SELECT * FROM ASDFG_JOIN;

DELETE FROM ASDFG_JOIN ;





