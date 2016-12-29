drop table address;

create table address(
no			number		not null,
name		varchar(20)	not null,
phone		varchar(20)	not null,
zipcode		varchar(6)	not null,
address1	varchar(100)	not null,
address2	varchar(100)	not null,
wdate		date	not null,
primary key(no)
);

insert into address (no,name,phone,zipcode,address1,address2,wdate)
values ((select nvl(max(no),0)+1 from address),'가나다','010-1548-1120','34820','대한민국 경기도 수원시','수원역 3번출구 앞',sysdate);

insert into address (no,name,phone,zipcode,address1,address2,wdate)
values ((select nvl(max(no),0)+1 from address),'가나다','010-1548-1120','34820','대한민국 경기도 수원시','수원역 3번출구 앞',sysdate);

insert into address (no,name,phone,zipcode,address1,address2,wdate)
values ((select nvl(max(no),0)+1 from address),'가나다','010-1548-1120','34820','대한민국 경기도 수원시','수원역 3번출구 앞',sysdate);

select * from ADDRESS;

update address set name='에이비',phone='010-1120-1552',zipcode='16112',address1='미국 뉴욕',address2='뉴욕 길거리' where no = 3;

delete from ADDRESS where no = 2;

select no, name, phone, to_char(wdate,'yyyy-mm-dd') as wdate, r
from(
	select no, name, phone, wdate, rownum r
	from (
		select no, name, phone, wdate from ADDRESS order by no desc
	)
) where r>=1 and r<=5