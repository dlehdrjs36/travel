create table image
(
  key NUMBER(38),
  path VARCHAR2(4000),
  title VARCHAR2(4000),
  content VARCHAR2(4000),
  thumnail VARCHAR2(4000),
  detail VARCHAR2(4000),
  price VARCHAR2(4000),
  hits VARCHAR2(4000)  
);

create table contact_information (
  name varchar2(40) not null primary key,
  mail varchar2(60) not null,
  message varchar2(4000) not null
);

create table subscribe (
  no number primary key,
  submail varchar2(60) not null
);

create table member ( 
id VARCHAR2(30) primary key,
pw VARCHAR2(30) not null,
phone VARCHAR2(50) not null,
address VARCHAR2(200) not null,
gender number not null,
name VARCHAR2(30) not null,
email VARCHAR2(100) not null,
member_date date default sysdate
);


create table searchData(
key NUMBER,
countryCode VARCHAR2(4000),
latitude VARCHAR2(4000),
longitude VARCHAR2(4000),
toName VARCHAR2(4000),
title VARCHAR2(4000),
content VARCHAR2(4000),
hits NUMBER
);

create table imageList(
toName VARCHAR2(4000),
countryCode VARCHAR2(4000),
imageName VARCHAR2(4000)
);

create sequence searchData_SEQ;
create sequence imageList_SEQ;

create sequence subscribe_seq; 
create sequence image_SEQ;

insert into SEARCHDATA values(searchdata_seq.nextval,'CN','37.09024','-95.71289100000001','중국', 'China', 'Welcome.', 0);
insert into SEARCHDATA values(searchdata_seq.nextval,'US','35.86166','104.19539699999996','미국', 'United States', 'Welcome', 0);
insert into SEARCHDATA values(searchdata_seq.nextval,'VN','14.058324','108.277199','베트남','Vietnam', 'Welcome', 0);
insert into SEARCHDATA values(searchdata_seq.nextval,'ES','40.46366700000001','-3.7492200000000366','스페인', 'Spain','Welcome', 0);
insert into SEARCHDATA values(searchdata_seq.nextval,'GB','55.378051','-3.43597299999999','영국', 'United Kingdom','Welcome', 0);
insert into SEARCHDATA values(searchdata_seq.nextval,'JP','36.204824','경도','일본', 'Japan','Welcome', 0);

insert into IMAGELIST values('중국','CN','중국1.jpg');
insert into IMAGELIST values('중국','CN','중국2.jpg');
insert into IMAGELIST values('중국','CN','중국3.jpg');
insert into IMAGELIST values('중국','CN','중국4.jpg');

insert into IMAGELIST values('미국','US','미국1.jpg');
insert into IMAGELIST values('미국','US','미국2.jpg');
insert into IMAGELIST values('미국','US','미국3.jpg');
insert into IMAGELIST values('미국','US','미국4.jpg');

insert into IMAGELIST values('베트남','VN','베트남1.jpg');
insert into IMAGELIST values('베트남','VN','베트남2.jpg');
insert into IMAGELIST values('베트남','VN','베트남3.jpg');
insert into IMAGELIST values('베트남','VN','베트남4.jpg');

insert into IMAGELIST values('스페인','ES','스페인1.jpg');
insert into IMAGELIST values('스페인','ES','스페인2.jpg');
insert into IMAGELIST values('스페인','ES','스페인3.jpg');
insert into IMAGELIST values('스페인','ES','스페인4.jpg');

insert into IMAGELIST values('영국','GB','영국1.jpg');
insert into IMAGELIST values('영국','GB','영국2.jpg');
insert into IMAGELIST values('영국','GB','영국3.jpg');
insert into IMAGELIST values('영국','GB','영국4.jpg');

insert into IMAGELIST values('일본','JP','일본1.jpg');
insert into IMAGELIST values('일본','JP','일본2.jpg');
insert into IMAGELIST values('일본','JP','일본3.jpg');
insert into IMAGELIST values('일본','JP','일본4.jpg');



//
create sequence reservation_seq;
create table reservation ( 
key number primary key,
departure varchar2(30) not null,
arrival varchar2(30) not null,
departure_date varchar2(30) not null,
departure_time varchar2(30) not null,
arrival_time varchar2(30) not null,
flight_number varchar2(30) not null,
ticket number not null,
seat varchar2(30) not null,
price varchar2(50) not null,
total_price varchar2(50) not null,
airline varchar2(50) not null,
lname VARCHAR2(10) not null,
fname VARCHAR2(30) not null,
nationality VARCHAR2(30) not null,
phone VARCHAR2(50) not null,
email VARCHAR2(100) not null,
reservation_date date default sysdate,
id VARCHAR2(20) not null
);
COMMENT ON TABLE reservation IS '예약정보';
COMMENT ON COLUMN reservation.key IS '시퀀스번호';
COMMENT ON COLUMN reservation.departure IS '출발지';
COMMENT ON COLUMN reservation.arrival IS '도착지';
COMMENT ON COLUMN reservation.departure_date IS '출발날짜';
COMMENT ON COLUMN reservation.departure_time IS '출발시간';
COMMENT ON COLUMN reservation.arrival_time IS '도착시간';
COMMENT ON COLUMN reservation.flight_number IS '비행기번호';
COMMENT ON COLUMN reservation.ticket IS '구매표 개수';
COMMENT ON COLUMN reservation.seat IS '구매한 좌석의 유형';
COMMENT ON COLUMN reservation.price IS '표 한개의 가격';
COMMENT ON COLUMN reservation.total_price IS '전체구매한 표의 가격';
COMMENT ON COLUMN reservation.airline IS '항공사이름';
COMMENT ON COLUMN reservation.lname IS '성';
COMMENT ON COLUMN reservation.fname IS '이름';
COMMENT ON COLUMN reservation.phone IS '휴대전화번호';
COMMENT ON COLUMN reservation.email IS '이메일';
COMMENT ON COLUMN reservation.reservation_date IS '예약한 날짜';
COMMENT ON COLUMN reservation.ID IS '접속한 회원ID';

create sequence countryRank_seq;
create table countryRank ( 
countryName varchar2(50),
Rcount NUMBER
);
COMMENT ON TABLE countryRank IS '실시간예약순위';
COMMENT ON COLUMN countryRank.countryName IS '나라이름';
COMMENT ON COLUMN countryRank.Rcount IS '출발지';

insert into countryRank values('인천',11);
insert into countryRank values('서울',12);
insert into countryRank values('부산',13);
insert into countryRank values('제주',14);
insert into countryRank values('홍콩',15);
insert into countryRank values('타이페이',16);
insert into countryRank values('마카오',17);
insert into countryRank values('상하이',18);
insert into countryRank values('베이징',19);
insert into countryRank values('칭다오',20);
insert into countryRank values('도쿄',21);
insert into countryRank values('싱가포르',22);
insert into countryRank values('방콕',32);
insert into countryRank values('마닐라',23);
insert into countryRank values('쿠알라룸푸르',16);
insert into countryRank values('하노이',27);
insert into countryRank values('칭다오',12);
insert into countryRank values('런던',82);
insert into countryRank values('파리',6);
insert into countryRank values('로마',17);
insert into countryRank values('로스앤젤레스',12);
insert into countryRank values('뉴욕',84);
insert into countryRank values('샌프란시스코',34);

create table CHATTING_TEMP
(
  ses_id NUMBER,
  id VARCHAR2(30),
  chat_msg VARCHAR2(4000),
  create_date DATE
);
