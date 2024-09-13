   -- CHAPTER 06. DDL --

 -- DDL이란?
--> 데이터 정의어로 테이블 같은 저장소 객체를 만들거나 수정한다.
 
 
   --[ DDL의 명령어 종류 ]
-- CREATE   : 테이블 같은 객체를 생성하는 명령어
-- ALTER    : 테이블 같은 객체를 변경하는 명령어
-- RENAME   : 테이블의 이름을 변경하는 명령어
-- TRUNCATE : 테이블의 데이터를 삭제하는 명령어
-- DROP     : 테이블같은 객체를 삭제하는 명령어



   -- [ 테이블 생성 시 자주 사용하는 자료형 ]

-- VARCHAR2 (N) : 가변형 문자형, N크기 만큼 입력받는다.

-- NUMBER(P,S) : 숫자형 값을 P자리 만큼 입력받고 S자리 만큼 소수를 입력받는다
 --> NUMBER(3,2) => 9.99 , NUMBER(5,3) => 99.999 , 잘못된 예) AGE NUMBER(3,1) => 99.9
  --> 오라클 데이터베이스에서는 실수와 정수 모두 표현이 가능하다.
  --> 소괄호를 생략하게 되면 최대값인 38크기가 들어간다.

-- DATE : 현재 날짜 값을 입력받는다.



   -- 테이블 생성 규칙
-- 대소문자 구분X
-- 중복되는 테이블명X
-- 테이블 내에서 컬럼명 중복X
-- 문자로 시작O , 예약어 사용 불가능 ( 특수문자는 _ ,$ , # 사용가능 )



  -- 테이블 생성
-- CREATE TABLE  테이블 명(
--        컬럼명1 자료형(크기)
--        컬럼명1 자료형(크기)
--        ...
--        컬럼명N 자료형(크기)
--        ) ;
    

  -- [ 테이블 생성하기 ]
  
-- 수강생정보 테이블을 참고해서 TEST_수강생정보 테이블 생성
 --> 수강생정보만 드레그 한 뒤에 SHIFT + F4 -> 테이블 정보
CREATE TABLE TEST_수강생정보(
    학생ID VARCHAR2(9) PRIMARY KEY ,
    학생이름 VARCHAR2(50) NOT NULL ,
    소속반 VARCHAR2(5)
) ;

SELECT * FROM TEST_수강생정보 ;


-- 성적표 테이블을 가지고 TEST_성적표 테이블 생성
CREATE TABLE TEST_성적표(
    학생ID VARCHAR2(9),
    과목 VARCHAR2(30),
    성적 NUMBER
);

SELECT * FROM TEST_성적표;



-- 실습) 테이블 이름은 테이블명_LOGIN 으로 생성
      --> 로그인 기능을 하기 위해 아이디, 비밀번호, 이메일, 이름 정보를 받을 예정
CREATE TABLE ASDFG_LOGIN(
    ID VARCHAR2(20),
    PW VARCHAR2(20),
    EMAIL VARCHAR2(20),
    NAME VARCHAR2(20)
);

SELECT * FROM ASDFG_LOGIN;



  -- 제약 조건이란?
 --> 테이블에 입력 가능한 데이터를 조건으로 제약하는 것
--> 데이터의 정확성을 유지하기 위한 목적으로 사용됨
--> 제약 조건 지정 방식에 따라 데이터ㅢ 수정이나 삭제 여부에 영향을 받음


   -- [ 제약 조건의 종류 ]

-- PRIMARY KEY (PK) : 기본키, NOT  NULL + UNIQUE -> NULL 불가 + 중복 불가
                 --   하나의 테이블에 무조건 하나의 PRIMARY KEY는 있어야 한다.
                 --   기본키는 단일 컬럼, 또는 여러 개의 컬럼으로 구성 가능
                 --   식별자 규칙을 물리적 모델링 한 것으로 NULL값 입력불가, 중복불가의 특징을 가진다
                  --> 식별자 : 테이블에서 행을 식별할 수 있는 컬럼
-- UNIQUE KEY (UK)  : 고유키 , NULL 값 입력 가능하지만 중복은 불가능 
-- NOT NULL         : NULL값 불가능, 꼭 입력되어야 하는 데이터이다 할 때 설정 
-- CHECK            : T OR F 로 평가할 수 있는 논리식 지정, 지정한 데이터만 입력 가능 
                 --   데이터의 형태와 범위를 정한다.
                 --   특정 컬럼에 데이터를 입력할 때 지정한 데이터만 입력 가능
-- FOREIGN KEY (FK) : 외래키, 테이블을 연결하는 키


  -- 데이터 무결성이란?
-- 데이터에 결함이 없는 상태. 즉, 데이터가 정확하고 유효하게 유지된 상태


   -- 무결성 제약 조건의 종류
-- 개체 무결성(PK) : 기본키 제약이라고 하며, 하나의 테이블에 중복된 행이 존재하지 않도록 규정
-- 참조 무결성(FK) : 행을 입력, 수정, 삭제 할 때 연관되는 다른 테이블과 데이터가 정확하게 유지되도록 규정
              --   참조 관계에 있는 두 테이블의 데이터가 항상 일관된 값을 가져야 함



  -- [ 이미 생성된 테이블에 제약조건 지정하기 ]
   
SELECT * FROM ASDFG_LOGIN;

-- 실습) 테이블에 PK 제약조건 지정하기
-- ALTER TABLE  테이블명  ADD CONSTRAINT  제약조건이름  제약조건(컬럼) ;
ALTER TABLE ASDFG_LOGIN ADD CONSTRAINT ASDFG_ID_PK PRIMARY KEY(ID) ;


-- 실습) 테이블에 UK 제약조건 지정하기
-- ALTER TABLE  테이블명  ADD CONSTRAINT  제약조건이름  제약조건(컬럼) ;
ALTER TABLE ASDFG_LOGIN ADD CONSTRAINT ASDFG_EMAIL_UK UNIQUE(EMAIL);


-- 실습) CHECK 제약조건 지정하기
ALTER TABLE ASDFG_LOGIN ADD CONSTRAINT ASDFG_PW_CHECK CHECK(LENGTH(PW) > 3);



  -- [ 이미 생성된 테이블에 FK 제약조건 지정 ]
   
-- ALTER TABLE  테이블명  ADD CONSTRAINT  제약조건이름  제약조건(컬럼)
-- REFERENCES  참조테이블(참조컬럼명);
ALTER TABLE TEST_성적표 ADD CONSTRAINT 학생ID_FK FOREIGN KEY(학생ID)
REFERENCES 수강생정보(학생ID) ;



  -- [ 제약조건 변경하기 ]
   
-- ALTER TALBLE  테이블이름  MODIFY  컬럼명  바꿀 제약조건 ;
ALTER TABLE ASDFG_LOGIN MODIFY NAME NOT NULL ;



  -- [ 제약조건 삭제하기 ]
   
-- ALTER TABLE  테이블명  DROP CONSTRAINT  제약조건이름 ;
ALTER TABLE ASDFG_LOGIN DROP CONSTRAINT ASDFG_PW_CHECK;



  -- [ 테이블 생성하기 ]
   
-- 테이블 생성 방법 1)
CREATE TABLE TB_TEST1(
    PK테스트 NUMBER PRIMARY KEY,
    UK테스트 NUMBER UNIQUE,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER CHECK(LENGTH(CK체스트) > 5)
);

-- 테이블 생성 방법 2)
CREATE TABLE TB_TEST1(
    PK테스트 NUMBER,
    UK테스트 NUMBER,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER,
    FK테스트 NUMBER,
    -- 제약조건 추가
    -- CONSTRAINT  제약조건명  제약조건(컬럼)
    CONSTRAINT PK테스트_PK PRIMARY KEY (PK테스트),
    CONSTRAINT UK테스트_UK UNIQUE (UK테스트),
    CONSTRAINT CK테스트_CK CHECK(CK테스트 > 0),
    CONSTRAINT FK테스트_FK FOREIGN KEY(FK테스트) REFERENCES TB_TEST1(PK테스트)
);



  -- [ 테이블에 컬럼 추가하기 ]
   
--ALTER TABLE  테이블명  ADD  컬럼명  자료형(크기);
ALTER TABLE ASDFG_LOGIN ADD ADDRESS VARCHAR2(10) ;

SELECT * FROM ASDFG_LOGIN ;



  -- [ 컬럼의 자료형 변경하기 ]
   
-- ALTER TABLE  테이블명  MODIFY  컬럼명  바꿀 제약조건(길이) ; 
ALTER TABLE ASDFG_LOGIN MODIFY ADDRESS VARCHAR2(20) ;



  -- [ 컬럼 이름 변경하기 ]
   
ALTER TABLE ASDFG_LOGIN RENAME COLUMN ADDRESS TO ADDR ;



  -- [ 특정 컬럼 삭제하기 ]
ALTER TABLE ASDFG_LOGIN DROP COLUMN ADDR ;



  -- [ 테이블 이름 변경하기 ]
RENAME ASDFG_LOGIN TO ASDF_LOGIN ;

SELECT * FROM ASDF_LOGIN ;



  -- [ 테이블 삭제하기 ]
   
-- DROP TABLE 테이블명 ;
DROP TABLE TEST_수강생정보 ;

DROP TABLE TEST_성적표 ;



  -- [ 테이블 복사하기 ]
   
CREATE TABLE DROP_성적표 AS SELECT * FROM 성적표 ;
 --> 성적표 테이블과 동일한 데이터를 가지는 테이블을 복사하는 쿼리문
 --> 제약조건은 복사가 되지 않는다 (NOT NULL은 제외)

SELECT * FROM DROP_성적표;



  -- [ 테이블의 데이터 영구 삭제 ]
   
-- TRUNCATE TABLE  테이블  이름 ;
TRUNCATE TABLE DROP_성적표 ;






