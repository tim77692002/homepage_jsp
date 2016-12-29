DROP TABLE board CASCADE CONSTRAINTS PURGE; 
 
CREATE TABLE board ( 
       num                  NUMBER(6) NOT NULL,      -- 글 일련 번호 
       name                 VARCHAR(10) NOT NULL,    -- 글쓴이 성명 
       subject              VARCHAR(100) NOT NULL,   -- 제목 
       content              VARCHAR(4000) NOT NULL,  -- 내용 
       ref                  NUMBER(5) NOT NULL,      -- 부모글 번호(그룹번호) 
       indent               NUMBER(2) DEFAULT 0 NOT NULL, -- 답변여부,깊이 
       ansnum               NUMBER(5) DEFAULT 0 NOT NULL, -- 답변 순서(최신답변은 부모글 바로 아래 달려집니다.) 
       regdate              DATE NOT NULL,           -- 글 등록일 
       passwd               VARCHAR(15) NOT NULL,    -- 패스워드 
       count                NUMBER(5) DEFAULT 0 NOT NULL,      -- 조회수  
       ip                   VARCHAR(15) NOT NULL,    -- 글쓴이 IP  
       filename             VARCHAR(50) NULL,        -- 파일명  
       filesize             NUMBER(7) NULL,          -- 파일 사이즈 
       refnum               NUMBER    DEFAULT 0,          -- 답변확인 컬럼 
       PRIMARY KEY (num) 
); 
 
 
 
--  Sequence Object 
 
    CREATE SEQUENCE board_seq 
    START WITH   1         --시작번호 
    INCREMENT BY 1         --증가값 
    MAXVALUE     99999     --최대값 
    CACHE 20               --시쿼스 변경시 자주 update되는 것을 방지하기위한 캐시값 
    NOCYCLE;     
 
 
     
select * from BOARD 
 
-- 단순한 데이터 출력 
-- rownum: 가상 컬럼, SELECT시에 동적으로 일련번호를 생성합니다. 
SELECT num, name, subject, regdate, rownum FROM board; 
 
 
-- 내림 차순 출력, rownum컬럼은 ORDER BY 문 보다 먼저 생성됩니다. 
SELECT num, name, subject, regdate, rownum FROM board 
ORDER BY name DESC; 
 
 
-- 서브쿼리와 rownum의 출력, 내부 쿼리는 정렬 실행,  
-- 외부 쿼리는 rownum 일련번호 산출 
SELECT num, name, subject, regdate, rownum r 
FROM ( 
      SELECT num, name, subject, regdate FROM board 
      ORDER BY name DESC 
) 
 
 
 
-- r컬럼을 인식을 못합니다. 
SELECT num, name, subject, regdate, rownum r 
FROM ( 
      SELECT num, name, subject, regdate FROM board 
      ORDER BY name DESC 
) 
WHERE r >= 1 and r <= 5; 
 
 
 
-- rownum을 이용한 페이징 출력, 1~5번 레코드만 출력 
SELECT num, name, subject, regdate, r 
FROM( 
    SELECT num, name, subject, regdate, rownum r 
    FROM ( 
        SELECT num, name, subject, regdate FROM board 
--        where subject like '%게%' 
--        or content like '%게%' 
        ORDER BY num DESC 
    ) 
) 
WHERE r >= 6 and r <=10; 
 
 
-- 6 ~ 10번 레코드만 출력 
SELECT num, name, subject, regdate, r 
FROM( 
    SELECT num, name, subject, regdate, rownum r 
    FROM ( 
        SELECT num, name, subject, regdate FROM board 
        ORDER BY num DESC 
    ) 
) 
WHERE r >= 6 and r <= 10; 
 
select num,ref,indent,ansnum,refnum,subject 
from board 
order by ref DESC, ansnum 
 
 
 
select * from board 