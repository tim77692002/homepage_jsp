drop table team;

create table team(
	no			number 			not null,
	name 		varchar(20)		not null,
	gender		varchar(5)		not null,
	phone		varchar(20)		not null,
	zipcode		varchar(6)		not null,
	address1	varchar(200)	not null,
	address2	varchar(200)	not null,
	skill		varchar(100)	not null,
	hobby		varchar(100)	not null,
	filename	varchar(50)		default 'member.jpg',
	primary key(no)
);

select nvl(max(no),0)+1 from TEAM;

insert into TEAM (no,name,gender,phone,zipcode,address1,address2,skill,hobby,filename) values ((select nvl(max(no),0)+1 from TEAM),'마바사','남','010-1007-0958','11015','울릉도 동남쪽','뱃길따라','MVC','축구','member.jpg');

select * from team order by no asc;

update team set phone='010-1115-1008', zipcode='00700',address1='제주도 서귀포시',address2='감귤 농장',skill='Spring',hobby='영화보기' where no = 3;

select no, name, phone, skill from team order by no asc;

update team set filename='man.jpg' where no = 7;

delete team where filename='member.jpg';

select count(*) from team where name like '%가나%'

select no, name, phone, skill, filename, r
from(
	select no, name, phone, skill, filename, rownum r
	from(
		select no, name, phone, skill, filename from team 
		where name like '%가나%'
		order by no desc
	)
)where r>=1 and r<=5