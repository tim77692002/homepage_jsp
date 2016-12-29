drop table guestbook;

CREATE TABLE guestbook( 
  no  NUMBER(6)     NOT NULL,  -- 일련번호, -999999 ~ +999999 
  title   VARCHAR(100)  NOT NULL,  -- 방명록 제목, 한글 50자 
  content VARCHAR(4000) NOT NULL,  -- 방명록 내용
  wname   VARCHAR(20)	NOT NULL,  -- 방명록 작성자
  wdate   DATE          NOT NULL,  -- 등록 날짜  
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, -99999 ~ +99999  
  PRIMARY KEY(no)              -- 고유한 값, 중복 안됨    
); 
 
-- SEQUENCE 객체 생성 
CREATE SEQUENCE memo_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 

-- create
insert into guestbook(no, title, content, wname, wdate) values((SELECT NVL(MAX(no), 0) + 1 as no FROM guestbook),'방명록 개시2','방명록 2호글','2테스터',sysdate);

-- read
select * from guestbook ;

-- update
update memo set title = '오늘 2시 회의 취소', content = '다음주 화요일에 다시 회의' where memono = 1;
update guestbook set title = '오늘 2시 회의 취소', content = '다음주 화요일에 다시 회의', wname = '오늘작성자소' where no = 1
update memo set viewcnt = 0;

-- delete
delete from memo where memono = 1;

-- list
select * from memo order by memono desc;

select memono, title, to_char(wdate, 'yyyy-mm-dd') wdate, viewcnt, r
from(
	select memono, title, wdate, viewcnt, rownum r
	from (
		select memono, title, wdate, viewcnt 
		from memo 
		
		order by memono desc
	)
)where r>=6 and r<=10

select count(*) from memo where title like '%1%'

--------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE news;

CREATE TABLE news(
  newsno INT          NOT NULL,
  title  VARCHAR(100) NOT NULL,
  media  VARCHAR(50)  NOT NULL,
  author VARCHAR(30)  NOT NULL,
  rdate  DATE         NOT NULL,
  PRIMARY KEY(newsno)
);
 
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, 'MS, 2016년 구형 IE 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 
SELECT * FROM news;

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(2, 'MS, 2016년 구형 ''IE'' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 
SELECT newsno, title, media, author, rdate FROM news;

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(3, '"차량 막무가내 견인한 뒤 요금 과다청구 많아"', '연합뉴스', '가길동', sysdate);


