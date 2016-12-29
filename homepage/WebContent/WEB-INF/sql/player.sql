1) 테이블 구조 
DROP TABLE player PURGE; 
 
-- version 3.0  
CREATE TABLE player ( 
    num		NUMBER(3)	NOT NULL, -- 등번호, 중복 안됨, 레코드를 구분하는 컬럼  
    name	VARCHAR(30)	NOT NULL, -- 성명, 영어 30자 저장 가능 
    country	VARCHAR(15)	NOT NULL, -- 국적, 한글로 적음 
    tall	number(3)	not null, -- 키
    bdate	VARCHAR(15)	NOT NULL, -- 생일     
    fname	VARCHAR(50) DEFAULT 'default.jpg', -- 사진
    dyear	number(4)	not null, -- 데뷔연도
    content	VARCHAR(4000) NOT NULL,  -- 내용
    PRIMARY KEY (num)               -- 한번 등록된 num는 중복 안됨 
); 
 
select * from player

INSERT INTO player(num, name, country, tall, bdate, fname, dyear, content)
values('99','test1','대한민국','180','1999-11-11','man.jpg','2016','이선수는 가상의 테스트 선수입니다.');

INSERT INTO player(num, name, country, tall, bdate, fname, dyear, content)
values('010','test','대한민국','180','1999-11-11','man.jpg','2016','이선수는 가상의 테스트 선수입니다.');

SELECT num, name, country, fname, tall, bdate, dyear, content
FROM player 
ORDER BY num ASC;
 
※ 제약 조건 
- NOT NULL: INSERT SQL에서 필수 입력. 
- UNIQUE  : 컬럼에 중복된 값이 올 수 없음. 
- PRIMARY KEY (id): 기본적으로 UNIQUE의 성질을 포함하면서 레코드를 
  구분하는 기준 컬럼의 값. 
 
 
 
2) 기초 데이터 추가 
       
DELETE FROM player; 
       
INSERT INTO player(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user1', '1234', '개발자1', '123-1234', 'email1@mail.com',  
'123-123','인천시', '남동구' ,'A01', sysdate, 'man.jpg', 'H'); 
 
INSERT INTO player(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user2', '1234', '개발자2', '123-1234', 'email2@mail.com',  
'123-123','광명시','남동구' ,'A01', sysdate, 'man.jpg', 'H'); 

INSERT INTO player(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('admin', '1234', '관리자', '010-1207-1246', 'admin@mail.com',  
'123-123','서울','시청' ,'A10', sysdate, 'suwon.jpg', 'A'); 
 
INSERT INTO player(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user3', '1234', '개발자3', '123-1234', 'email3@mail.com',  
'123-123','용인시','남동구' ,'A01', sysdate, 'myface.jpg', 'H'); 
 
 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname, grade 
FROM player 
ORDER BY id ASC; 
 
 ID    PASSWD MNAME TEL      EMAIL           ZIPCODE ADDRESS1 ADDRESS2 JOB MDATE                 FNAME      GRADE
 ----- ------ ----- -------- --------------- ------- -------- -------- --- --------------------- ---------- -----
 user1 1234   개발자1  123-1234 email1@mail.com 123-123 인천시      남동구      A01 2014-08-28 11:38:31.0 man.jpg    H
 user2 1234   개발자2  123-1234 email2@mail.com 123-123 광명시      남동구      A01 2014-08-28 11:39:19.0 man.jpg    H
 user3 1234   개발자3  123-1234 email3@mail.com 123-123 용인시      남동구      A01 2014-08-28 11:39:24.0 myface.jpg H
 
  
3) 중복 아이디 검사 관련 SQL 
    -- 0: 중복 아님, 1: 중복  
    
SELECT COUNT(id) cnt FROM player WHERE id='user1'
 
SELECT COUNT(id) FROM player WHERE id='user1'; 
 
 COUNT(ID)
 ---------
         1
 
         
SELECT COUNT(id) as cnt  
FROM player  
WHERE id='user1'; 
 
 CNT
 ---
   1
   
   
   
4) 이메일 중복 확인
   SELECT COUNT(email) as cnt  
   FROM player  
   WHERE email='user1'; 
 
 
   
5) 우편 번호 검색

   CREATE TABLE zipcode (
   
   zipcode    varchar(7)    not null,  
   sido       varchar(20)   not null, 
   gugun      varchar(30)   not null,
   dongli       varchar(50)   not null,
   etc        varchar(100)  null
   
   )

 
   SELECT zipcode, sido, gugun, dongli, etc 
   FROM zipcode 
   WHERE (dongli LIKE '%간석4동%') 
   ORDER BY sido, gugun, dongli; 
 
 
 
6) 회원 전체 목록 
- LIKE    : 정확하게 일치하지 않아도 출력 
- =(equal): 정확하게 일치해야 출력 
 
- 검색을 하지 않는 경우, 전체 목록 출력 


SELECT id, mname, tel, email, zipcode, address1, address2, fname, r 
from(
	SELECT id, mname, tel, email, zipcode, address1, address2, fname, rownum r 
	from(
		SELECT id, mname, tel, email, zipcode, address1, address2, fname 
		FROM player 
		WHERE id LIKE '%%'
		ORDER BY id ASC   
	)
)where r>=2 and r<=3 
 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, 
    job, mdate, fname, grade 
FROM player 
WHERE id LIKE '%%' -- 검색어가 없음으로 전체 레코드 출력 
ORDER BY id ASC;   -- id 컬럼값으로 오름차순 정렬, DESC: 내림 차순 
 
 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname
FROM player  
ORDER BY mdate DESC; 
 
 ID    PASSWD MNAME TEL      EMAIL           ZIPCODE ADDRESS1             ADDRESS2 JOB MDATE                 FNAME
 ----- ------ ----- -------- --------------- ------- -------------------- -------- --- --------------------- ------------
 user5 1234   왕눈이   123-1234 email5@mail.com 111-111 인천시 남동구 간석4동         NULL     A03 2014-09-02 14:34:13.0 ansunggi.jpg
 user4 1234   왕눈이   123-1234 email4@mail.com 405-726 인천 남동구 간석4동 주안주공아파트  1-1      A03 2014-09-02 14:24:48.0 player.jpg
 user3 1234   개발자3  123-1234 email3@mail.com 123-123 용인시                  남동구      A01 2014-09-02 11:52:46.0 myface.jpg
 user2 1234   개발자2  123-1234 email2@mail.com 123-123 광명시                  남동구      A01 2014-09-02 11:52:45.0 man.jpg
 user1 1234   개발자1  123-1234 email1@mail.com 123-123 인천시                  남동구      A01 2014-09-02 11:52:31.0 man.jpg
 
 
 
 
7) user1 회원 정보 보기 
 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, 
    job, mdate, fname, grade 
FROM player  
WHERE id='user1'; 
 
 
 
8) 회원 이미지의 수정
UPDATE player 
SET fname='' 
WHERE id='user1'; 
 
 
 
9) 패스워드 변경
UPDATE player
SET passwd='1234'
WHERE id='';
 
SELECT id, mname, passwd
FROM player
ORDER BY id DESC;
 
 
 
10) 회원 정보 수정 
 
UPDATE player  
SET passwd='TEST',mname='TEST', tel='123-123', email='email10',zipcode='TEST',  
    address1='수원', address2='팔달구', job='TEST', grade = 'C' 
WHERE id = 'user3'; 
 
 
-- 모든 컬럼 전부 출력, 개발시는 비권장
SELECT * FROM player; 
 
- 이미지 수정 
UPDATE player 
SET fname = '' 
WHERE id=''; 
 
 
 
11) 회원 삭제 
 
DELETE FROM player WHERE id='man1'; 
 
SELECT * FROM player; 
 
 
 
12) 모든 회원 삭제(권장 아님) 
   - DELETE는 항상 대부분 WHERE 조건을 같이 사용합니다. 
 
DELETE FROM player; 
 
 
 
13) 로그인 관련 SQL 
  
SELECT COUNT(id) as cnt 
FROM player 
WHERE id = 'user1' AND passwd = '1234';  