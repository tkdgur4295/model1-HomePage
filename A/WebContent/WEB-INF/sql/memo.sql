drop table memo

CREATE TABLE Amemo( 
  memono  NUMBER(6)     NOT NULL,  -- 일련번호, -999999 ~ +999999 
  title   VARCHAR(100)  NOT NULL,  -- 메모 제목, 한글 50자 
  content VARCHAR(4000) NOT NULL,  -- 내용  
  wdate   DATE          NOT NULL,  -- 등록 날짜  
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, -99999 ~ +99999  
  PRIMARY KEY(memono)              -- 고유한 값, 중복 안됨    
);

-- SEQUENCE 객체 생성 
CREATE SEQUENCE memo_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100;

--create
insert into memo(memono,title,content,wdate)
values(memo_seq.nextval,'오늘 오후 세시 회의','내용은 홈페이지 수정관련',sysdate)
--read
select * from Amemo
where memono=1

--update
update memo
set title = '오늘 두시 회의 취소',
content ='다음주 화요일에 다시 회의'
where memono=1

--delete
delete from Amemo
where memono=1

--list

select memono, title, to_char(wdate,'yyyy-mm-dd') wdate,viewcnt, r
from(
	select memono, title, wdate,viewcnt,rownum r
	from(
		select memono, title, wdate,viewcnt from memo
		order by memono desc
	)
)where r>=1 and r<=5	
	
-------------------------------------------------------------------


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

SELECT newsno, title, media, author, rdate FROM news;

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(2, 'MS, 2016년 구형 ''IE'' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 
SELECT newsno, title, media, author, rdate FROM news;

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(3, '"차량 막무가내 견인한 뒤 요금 과다청구 많아"', '연합뉴스', '가길동', sysdate);
 
SELECT newsno, title, media, author, rdate FROM news;


