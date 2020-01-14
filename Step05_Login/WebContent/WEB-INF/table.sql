create table users
(id varchar2(30) primary key,
pwd varchar2(30) not null,
email varchar2(30),
regdate date);


create table board_cafe(
	num number primary key,
	writer varchar2(100) not null,
	title varchar2(100) not null,
	content clob,
	viewCount number,
	regdate date
);

create sequence board_cafe_seq;