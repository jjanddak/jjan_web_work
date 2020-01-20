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

create table board_file(
num number primary key,
writer varchar2(100),
title varchar2(100) not null,
orgFileName varchar2(100) not null, --원본 파일명
saveFileName varchar2(100) not null, --서버에 저장된 파일명
fileSize number,
downCount number default 0,
regdate date);

create sequence board_file_seq;

alter table users add(profile varchar2(50));