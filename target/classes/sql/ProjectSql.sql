/* 계정생성 & 권한 부여  */
conn sys as sysdba

create user sonsoo identified by 1
default tablespace users
temporary tablespace temp;

grant connect, dba to sonsoo

/*드롭*/
drop table Funding_Product;
drop table Funding_Category;
drop table readMessage;
drop table sendMessage;
drop table reviewComments;
drop table reviewBoard;
drop table cart;
drop table products;
drop table productCategory;
drop table orders;
drop table orderList;
drop table orderedProduct;
drop table coupon;
drop table cardpay;
drop table notice;
drop table faq;
drop table visitor;
drop table RefundList;
drop table Member;


drop sequence msg_seq_readMessage;
drop sequence msg_seq_sendMessage;
drop sequence seq_category;
drop sequence seq_cart;
drop sequence seq_orders;
drop sequence seq_orderList;
drop sequence seq_cardpay;
drop sequence seq_notice;
drop sequence seq_faq;
drop sequence seq_orderedProduct;
drop sequence seq_refundlist;
/*--------------------------------M E M B E R---------------------------------------------*/

create table Member(
id varchar2(20) primary key,
password varchar2(20),
name varchar2(30),
phone varchar2(50),
postcode varchar2(50),
address varchar2(100),
detailAddress varchar2(100),
extraAddress varchar2(100),
reg_date date default sysdate
);

insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress) 
values('yun','1234','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길');
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress) 
values('han','1234','원용','01012341234','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길');
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress) 
values('Lee','1234','찬주','01012341234','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길');
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress) 
values('kim','1234','찬호','01012341234','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길');
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress) 
values('hwang','1234','지영','01012341234','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길');
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress) 
values('hyuk','1234','준혁','01012341234','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길');
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress) 
values('admin','1234','관리자','01012341234','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길');
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress) 
values('abc','1234','에이비씨','01012341234','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길');

insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress) 
values('happy77','1234','해피','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길');
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress) 
values('hong','1234','길동','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길');
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress) 
values('chanju','1234','찬주','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길');
/*--------------------------------M E S S A G E---------------------------------------------*/
create table readMessage(
msg_seq int primary key,
sender varchar2(20) not null,
reader varchar2(20) not null,
title varchar2(100) not null,
content varchar2(100) not null,
regDate date default sysdate,
msgCheck varchar2(10) default 'NO'
);

create sequence msg_seq_readMessage;
create sequence msg_seq_sendMessage;

create table sendMessage(
msg_seq int primary key,
sender varchar2(20) not null,
reader varchar2(20) not null,
title varchar2(100) not null,
content varchar2(100) not null,
regDate date default sysdate
);


insert into readmessage (msg_seq, sender, reader, title, content) values (msg_seq_readMessage.nextval, 'admin', 'han', '답변 입니다!', '반갑습니다');
insert into sendmessage (msg_seq, sender, reader, title, content) values (msg_seq_sendMessage.nextval, 'admin', 'han', '답변 입니다!', '반갑습니다');
insert into readmessage (msg_seq, sender, reader, title, content) values (msg_seq_readMessage.nextval, 'han', 'admin', '작가님 안녕하세요!', '반갑습니다');
insert into sendmessage (msg_seq, sender, reader, title, content) values (msg_seq_sendMessage.nextval, 'han', 'admin', '작가님 안녕하세요!', '반갑습니다');
insert into readmessage (msg_seq, sender, reader, title, content) values (msg_seq_readMessage.nextval, 'admin', 'han', '상품문의 답변입니다!!', '반갑습니다');
insert into sendmessage (msg_seq, sender, reader, title, content) values (msg_seq_sendMessage.nextval, 'admin', 'han', '상품문의 답변입니다!!', '반갑습니다');
insert into readmessage (msg_seq, sender, reader, title, content) values (msg_seq_readMessage.nextval, 'han', 'admin', '상품 문의 드립니다...', '반갑습니다');
insert into sendmessage (msg_seq, sender, reader, title, content) values (msg_seq_sendMessage.nextval, 'han', 'admin', '상품 문의 드립니다...', '반갑습니다');
insert into readmessage (msg_seq, sender, reader, title, content) values (msg_seq_readMessage.nextval, 'admin', 'Lee', '잘가잘가잘가', '반갑습니다');
insert into sendmessage (msg_seq, sender, reader, title, content) values (msg_seq_sendMessage.nextval, 'admin', 'Lee', '안녕하세요', '반갑습니다');
insert into readmessage (msg_seq, sender, reader, title, content) values (msg_seq_readMessage.nextval, 'Lee', 'admin', '작가님 응원합니다!', '반갑습니다');
insert into sendmessage (msg_seq, sender, reader, title, content) values (msg_seq_sendMessage.nextval, 'Lee', 'admin', '작가님 응원합니다!', '반갑습니다');
insert into readmessage (msg_seq, sender, reader, title, content) values (msg_seq_readMessage.nextval, 'admin', 'hong', '감사합니다!', '반갑습니다');
insert into sendmessage (msg_seq, sender, reader, title, content) values (msg_seq_sendMessage.nextval, 'admin', 'hong', '감사합니다!', '반갑습니다');
insert into readmessage (msg_seq, sender, reader, title, content) values (msg_seq_readMessage.nextval, 'hong', 'admin', '안녕하세요??', '반갑습니다');
insert into sendmessage (msg_seq, sender, reader, title, content) values (msg_seq_sendMessage.nextval, 'hong', 'admin', '안녕하세요??', '반갑습니다');
insert into readmessage (msg_seq, sender, reader, title, content) values (msg_seq_readMessage.nextval, 'admin', 'hong', '잘가잘가잘가', '반갑습니다');
insert into sendmessage (msg_seq, sender, reader, title, content) values (msg_seq_sendMessage.nextval, 'admin', 'hong', '안녕하세요', '반갑습니다');
insert into readmessage (msg_seq, sender, reader, title, content) values (msg_seq_readMessage.nextval, 'kim', 'admin', '상품 재입고 되나요?', '반갑습니다');
insert into sendmessage (msg_seq, sender, reader, title, content) values (msg_seq_sendMessage.nextval, 'kim', 'admin', '상품 재입고 되나요?', '반갑습니다');

/*--------------------------------R E V I E W---------------------------------------------*/
create table reviewBoard(
rno number,
id varchar2(20),
p_id varchar2(20) not null,
title varchar2(100) not null,
content varchar2(2000) not null,
regDate date default sysdate,
uploadFile varchar2(100),
imageName varchar2(100),
star varchar2(5) not null
);

alter table reviewBoard add constraint pk_review primary key (rno);
alter table reviewBoard add constraint fk_review_id foreign key (id) references Member (id) on delete set null;

insert into reviewBoard(rno, id, p_id, title, content, uploadFile,imageName, star)
values((select nvl(max(rno),0)+1 from reviewBoard),'hyuk','P1234','너무 이뻐서 못먹겠어요..!!','진짜 꿀맛이에요,, 
기다리고기다리던 마카롱 다 먹고 나서 후기 남깁니당 ㅠㅠ 최고였어요!!!!!!! 시중에서 더 비싼 마카롱 저려미하게 먹어서 행복했는데 맛도 엄청나더라구요 순수우유 못잃어,, 
돈 많이 벌어서 30개씩 사두고 싶어요ㅠㅠ 작가님 적게 일하시고 많이 버세요 !-!','ma.jpg','ma.jpg','5');

insert into reviewBoard(rno, id, p_id, title, content, uploadFile,imageName, star)
values((select nvl(max(rno),0)+1 from reviewBoard),'hwang','P1234','다음에 또 구매할게요 ㅠㅠ','진짜 꿀맛이에요,, 
기다리고기다리던 마카롱 다 먹고 나서 후기 남깁니당 ㅠㅠ 최고였어요!!!!!!! 시중에서 더 비싼 마카롱 저려미하게 먹어서 행복했는데 맛도 엄청나더라구요 순수우유 못잃어,, 
돈 많이 벌어서 30개씩 사두고 싶어요ㅠㅠ 작가님 적게 일하시고 많이 버세요 !-!','ma.jpg','ma.jpg','5');

insert into reviewBoard(rno, id, p_id, title, content, uploadFile,imageName, star)
values((select nvl(max(rno),0)+1 from reviewBoard),'yun','P1234','다음에 또 구매할게요 ㅠㅠ','진짜 꿀맛이에요,, 
기다리고기다리던 마카롱 다 먹고 나서 후기 남깁니당 ㅠㅠ 최고였어요!!!!!!! 시중에서 더 비싼 마카롱 저려미하게 먹어서 행복했는데 맛도 엄청나더라구요 순수우유 못잃어,, 
돈 많이 벌어서 30개씩 사두고 싶어요ㅠㅠ 작가님 적게 일하시고 많이 버세요 !-!','ma.jpg','ma.jpg','5');

insert into reviewBoard(rno, id, p_id, title, content, uploadFile,imageName, star)
values((select nvl(max(rno),0)+1 from reviewBoard),'kim','P1234','다음에 또 구매할게요 ㅠㅠ','진짜 꿀맛이에요,, 
기다리고기다리던 마카롱 다 먹고 나서 후기 남깁니당 ㅠㅠ 최고였어요!!!!!!! 시중에서 더 비싼 마카롱 저려미하게 먹어서 행복했는데 맛도 엄청나더라구요 순수우유 못잃어,, 
돈 많이 벌어서 30개씩 사두고 싶어요ㅠㅠ 작가님 적게 일하시고 많이 버세요 !-!','ma.jpg','ma.jpg','5');

insert into reviewBoard(rno, id, p_id, title, content, uploadFile,imageName, star)
values((select nvl(max(rno),0)+1 from reviewBoard),'Lee','P1234','너무 맛있어요!!!','친구한테 선물로 보내줬습니다! 친구가 완전 맛있다고 해줬어요
 ㅎㅎ 이때까지 먹어본 뚱카롱 중에 필링이 젤 많은데, 맛이 순하고 부드러워서 부담스럽지 않고 너무 맛있다고 극찬을 아끼지 않네요 ㅎㅎ 이것저것 잘 나눠먹는 친구인데, 하나 먹자마자 
자기가 다 먹을거라고 숨겨뒀다고 하네요 ㅋㅋㅋㅋ 중간에 배송 주소때문에 귀찮으셨을텐데 꼼꼼히 챙겨봐주시고 신경써주셔서 넘넘 감사합니다 ㅠㅠ♥ 저도 조만간 시켜 먹어보려구요!!'
,'ma2.jpg','ma2.jpg','4');

insert into reviewBoard(rno, id, p_id, title, content, uploadFile,imageName, star)
values((select nvl(max(rno),0)+1 from reviewBoard),'han','P1234','너무 이뻐서 못먹겠어요..!!','친구한테 선물로 보내줬습니다! 친구가 완전 맛있다고 해줬어요
 ㅎㅎ 이때까지 먹어본 뚱카롱 중에 필링이 젤 많은데, 맛이 순하고 부드러워서 부담스럽지 않고 너무 맛있다고 극찬을 아끼지 않네요 ㅎㅎ 이것저것 잘 나눠먹는 친구인데, 하나 먹자마자 
자기가 다 먹을거라고 숨겨뒀다고 하네요 ㅋㅋㅋㅋ 중간에 배송 주소때문에 귀찮으셨을텐데 꼼꼼히 챙겨봐주시고 신경써주셔서 넘넘 감사합니다 ㅠㅠ♥ 저도 조만간 시켜 먹어보려구요!!'
,'ma3.jpg','ma3.jpg','5');


/*--------------------------------R E V I E W C O M M E N T S---------------------------------------------*/

create table reviewComments(
rcno number,
rno number not null,
id varchar2(20) not null,
content varchar2(1000) not null,
regDate date default sysdate
);

alter table reviewComments add constraint pk_comments primary key (rcno);

alter table reviewComments add constraint fk_comments_review foreign key (rno) references reviewBoard (rno);

/*--------------------------------P R O D U C T C A T E G O R Y---------------------------------------------*/

create table productCategory(
seq int primary key,
c_name varchar2(20) unique,
description clob
);

create sequence seq_category start with 1 increment by 1;

insert into productCategory(seq,c_name,description) 
    values(seq_category.nextval,'food','다양한 수제음료와 수제먹거리');
insert into productCategory(seq,c_name,description) 
    values(seq_category.nextval,'accessary','작가들의 독특한 디자인의 악세서리');
insert into productCategory(seq,c_name,description) 
    values(seq_category.nextval,'interior','드라이플라워, 캔들 등 인테리어 소품');
insert into productCategory(seq,c_name,description) 
    values(seq_category.nextval,'toy','통통 튀는 아이디어의 인형과 장난감');
/*--------------------------------P R O D U C T S---------------------------------------------*/
   
create table products(
p_id varchar2(20) primary key,
name varchar2(100),
category varchar2(20), 
price number,
stock number,
sale number,
likey number,
cnt number,
script clob,
tnImage varchar2(100),
dsImage varchar2(100),
id varchar2(20),
constraint fk_category foreign key(category) references productCategory(c_name),
constraint fk_seller foreign key(id) references Member(id) on delete set null
);

insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1234', '레인보우 마카롱', 'food', 2500, '다양한 색의 쫀득한 마카롱', 'macaron_tn.png', 'macaron_ds.png', 'happy77');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1235', '수제 레몬청', 'food', 12000, '수제 레몬청입니다.', 'lemonjam_tn.png', 'lemonjam_ds.png', 'happy77');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1236', '드라이 플라워', 'interior', 9900, '시들지 않아요.', 'dryflower_tn.png', 'dryflower_ds.png', 'hong');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1237', '수제 캔들', 'interior', 11000, '예쁘고 향기로운 수제 캔들', 'candle_tn.png', 'candle_ds.png', 'chanju');
    
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1238', '유기농마카롱', 'food', 2800, '천연 재료만으로 만들었어요', '유기농마카롱.png', 'macaron_ds.png', 'kim');    
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1239', '포켓토이_그레이', 'toy', 29000, '작은 상자속에 귀여운 동물의 집', '포켓그레이.png', '포켓그레이.png', 'hwang');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1240', '포켓토이_퍼플', 'toy', 29000, '작은 상자속에 귀여운 동물의 집', '포켓퍼플.png', '포켓퍼플.png', 'hwang');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1241', '포켓토이_블루', 'toy', 29000, '작은 상자속에 귀여운 동물의 집', '포켓블루.png', '포켓블루.png', 'hwang');    
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1242', '이니셜마스크스트랩', 'accessary', 4500, '마스크스트랩에 내이름을 새겨봐요', '이니셜마스크스트랩.png', '이니셜마스크스트랩.png', 'yun');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1243', '가죽마스크스트랩', 'accessary', 5500, '튼튼한 마스크스트랩', '가죽마스크스트랩.png', '가죽마스크스트랩.png', 'yun');    
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1244', '동백꽃 팔찌', 'accessary', 9900, '예쁜 동백꽃자수 팔찌', '동백꽃팔찌.png', '동백꽃팔찌.png', 'yun');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1245', '오가닉애착인형_고양이', 'toy', 25000, '유기농 애착인형을 선물하세요', '오가닉애착인형고양이.png', '오가닉애착인형고양이.png', 'han');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1246', '오가닉애착인형_쥐', 'toy', 25000, '유기농 애착인형을 선물하세요', '오가닉애착인형쥐.png', '오가닉애착인형쥐.png', 'han');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1247', '오가닉애착인형_토끼', 'toy', 25000, '유기농 애착인형을 선물하세요', '오가닉애착인형토끼.png', '오가닉애착인형토끼.png', 'han');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1248', '유니콘슬라임', 'toy', 12000, '판타지유니콘슬라임', '유니콘슬라임.png', '유니콘슬라임.png', 'hyuk');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1249', '밀크티슬라임', 'toy', 9900, '타로밀크티같은슬라임', '밀크티슬라임.png', '밀크티슬라임.png', 'hyuk');
insert into products(p_id, name, category, price, script, tnImage, dsImage, id)
    values('P1250', '커피로만든캔들홀더', 'interior', 22000, '커피로만든 캔들홀더입니다 향기솔솔', '커피로만든캔들홀더.png', '커피로만든캔들홀더.png', 'kim');
    
/*----------------------------------------C A R T---------------------------------------------*/

create table cart(
seq int primary key,
id varchar2(20),
p_id varchar2(20),
quantity int,
constraint fk_id foreign key(id) references Member(id) on delete set null,
constraint fk_pid foreign key(p_id) references Products(p_id)
);

create sequence seq_cart start with 1 increment by 1;

insert into cart(seq,id,p_id,quantity) 
    values(seq_cart.nextval,'hong','P1234',1);



/*--------------------------------O R D E R S---------------------------------------------*/

create table orders(
seq number,
o_number varchar2(100) primary key,
o_date date default sysdate,
status varchar2(30) default '1',
p_id varchar2(30),
qty number,
id varchar2(20),
name varchar2(30),	
phone varchar2(50),
postcode varchar2(50),
address varchar2(100),
detailAddress varchar2(100),
extraAddress varchar2(100),
requestedTerm varchar2(200),
couponUsed varchar2(100),
totalCost number,
constraint fk_mid foreign key(id) references Member(id) on delete set null
);

create sequence seq_orders;

insert into orders(seq,o_number,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031111','yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용',2500);


/*--------------------------------O R D E R L I S T---------------------------------------------*/

create table orderList(
seq number,
o_number varchar2(100) primary key,
o_date date
);

create sequence seq_orderList;

insert into orderList(seq,o_number,o_date) values(seq_orderList.nextval,'TN2009031111',(select o_date from orders where o_number='TN2009031111'));

/*--------------------------------O R D E R E D P R O D U C T---------------------------------------------*/
/* 주문 완료된 상품 목록 - 주문번호로 조회 가능 */
create table orderedProduct(
seq number,
o_number varchar2(100),
p_id varchar2(20),
p_name varchar2(100),
price number,
qty number,
tnImage varchar2(100),
status varchar2(30) default '1'
);

create sequence seq_orderedProduct;

insert into orderedProduct(seq,o_number,p_id,p_name,price,qty,tnImage)
values(seq_orderedProduct.nextval,'TN2009031111','P1234','다양한 색의 쫀득한 마카롱',2500, 1 ,'macaron_tn.png');

/*--------------------------------C O U P O N---------------------------------------------*/

create table coupon(
id varchar2(30),
couponNum varchar2(50) primary key,
couponName varchar2(100),
discount int
);

insert into coupon values('yun','1','신규 가입 축하 쿠폰',3000);
insert into coupon values('yun','2','친구 소개 이벤트 쿠폰',2000);


/*--------------------------------C A R D P A Y---------------------------------------------*/

create table cardpay(
seq number,
o_number varchar2(100) primary key,
cardNumber varchar2(50),
expDate varchar2(50),
securityCode varchar2(50)
);

create sequence seq_cardpay;

/*--------------------------------N O T I C E---------------------------------------------*/

create table notice(
bno number primary key,
title varchar2(100) not null,
summary varchar2(100) not null,
content varchar2(1000) not null,
regDate date default sysdate,
cnt number default 0,
thumbnail varchar2(100)
);

create sequence seq_notice;

insert into notice(bno,title,summary,content,thumbnail) 
values(seq_notice.nextval,'배송 업체 변경','추석 연휴 기간 동안의 배송 업체 변경 공지'
,'2020년 추석 연휴 기간에는 CJ대한통운에서 로젠택배로 배송 업체가 임시 변경됩니다. 이용에 차질 없으시길 바랍니다.','shipping.png');

insert into notice(bno,title,summary,content,thumbnail) 
values(seq_notice.nextval,'결제 수단 관련 안내','계좌이체 및 가상계좌 발급 중단 !'
,'2020년 7월부터 계좌이체 및 가상 계좌 발급이 불가합니다.결제 수단은 신용카드 및 체크카드 그리고 카카오페이만 가능하오니 본 쇼핑몰 이용 시 참고 바랍니다.','onlycard.png');

insert into notice(bno,title,summary,content,thumbnail) 
values(seq_notice.nextval,'해외 결제 및 해외 배송 불가 안내','해외 배송 서비스 미제공'
,'SONSOO에서는 해외 결제 및 해외 배송 서비스를 진행하고 있지 않습니다. 원화만 결제 가능하며 해외 배송 서비스는 배송대행업체를 별도로 이용해주세요.','internationalshipping.png');

insert into notice(bno,title,summary,content,thumbnail) 
values(seq_notice.nextval,'9월 25일 임시 휴무','고객센터 미운영'
,'9월 25일은 내부 서버 교체 작업으로 인하여 임시 휴무입니다. 고객센터는 미운영되오니 참고 바랍니다.','off.png');

insert into notice(bno,title,summary,content,thumbnail) 
values(seq_notice.nextval,'2020년 배송비 이벤트','한 해 동안 배송비 무료 이벤트 진행'
,'신규 회원 및 기존 회원 관계없이 2020년 한 해 동안 배송비 무료 이벤트를 진행합니다. 많은 이용 부탁드립니다.','freefee.png');

insert into notice(bno,title,summary,content,thumbnail) 
values(seq_notice.nextval,'고객센터 운영시간','평일 오전 10시부터 오후 5시'
,'고객 센터 운영 시간은 평일 오전 10시부터 오후 5시까지로 응답이 가능한 시간은 오후 4시 50분까지 접수된 주문건까지만 가능합니다. 주말은 휴무이니 이용 시 참고 바랍니다.','callcenter.png');


/*--------------------------------F A Q---------------------------------------------*/

create table faq(
bno number,
title varchar2(100) not null,
summary varchar2(100) not null,
content varchar2(1000) not null,
regDate date default sysdate,
cnt number default 0,
thumbnail varchar2(100)
);

create sequence seq_faq;

alter table faq add constraint pk_faq primary key(bno);


insert into faq(bno,title,summary,content,thumbnail) 
values(seq_faq.nextval,'SONSOO 분쟁해결기준','서비스 이용 과정에서 문의사항 및 불편/불만사항이 발생하는 경우'
,'고객이 불편/불만사항을 접수하거나 건의사항을 전달하는 경우, 고객에게 접수일로부터 3영업일 이내 진행 결과를 전달하고, 10영업일 이내 조사 결과 또는 처리 방안을 안내합니다.','shipping.png');

insert into faq(bno,title,summary,content,thumbnail) 
values(seq_faq.nextval,'작가 입점 안내','금손이라면 누구나 작가가 될 수 있습니다.'
,'SONSOO 입점 심사는 온라인 판매를 위한 5가지 기준을 원칙으로 심사합니다.','onlycard.png');

insert into faq(bno,title,summary,content,thumbnail) 
values(seq_faq.nextval,'결제 / 현금 영수증 조회 및 출력','고객 센터로 연락해주세요.'
,'결제/현금 영수증 상세 조회 및 출력이 필요하시면 고객센터로 연락주세요.','internationalshipping.png');

insert into faq(bno,title,summary,content,thumbnail) 
values(seq_faq.nextval,'48시간 이상 출고 지연 시','주문 이후 48시간 이상 경과된 건에 관한 답변'
,'주문량 폭주로 출고가 평소보다 1~2일 정도 지연될 수 있습니다. 불편을 끼쳐드려 죄송하며 이점 양해 부탁드립니다. 가능한 빠른 시간 내에 정상 출고될 수 있도록 최선을 다 하겠습니다.','shipping2.png');

insert into faq(bno,title,summary,content,thumbnail) 
values(seq_faq.nextval,'주문하지 않은 제품/파손된 제품/제품 분실','위와 관련된 환불 문의에 대한 답변'
,'고객님의 환불 요청을 검토하는 데 있어 영업일(월~금) 기준 2~3일 정도가 소요될 수 있습니다. 환불 승인 후 고객님께서 주문 시 사용한 결제 수단으로 환불되기까지는 영업일 기준 5~7일 정도가 소요됩니다. ','sorry.png');

insert into faq(bno,title,summary,content,thumbnail) 
values(seq_faq.nextval,'이전과 다른 품질의 제품에 관하여','품질 문의에 관한 답변'
,'SONSOO의 협력 업체들인 제조사들은 늘 품질 향상을 위해 노력하고 있습니다. 그리고 판매 제품들에 변화가 있을 때마다 이 변화된 포장, 영양 성분, 제품 상세 정보 등을 해당 제품 페이지에 업데이트하고 있습니다. ','different.png');

/*--------------------------------F U N D I N G _ C A T E G O R Y---------------------------------------------*/
			
create table Funding_Category(
category varchar2(20),
description varchar2(300)
);
alter table Funding_Category add constraint pk_fc primary key(category);
insert into Funding_Category values('도서','소설, 수필, 에세이, 동화 등 모든 장르의 도서'); 
insert into Funding_Category values('게임','모바일 게임, 보드 게임, 카드 게임 등 모든 장르의 게임'); 
insert into Funding_Category values('잡화','생활에 도움이 되는 물건들입니다'); 
/*--------------------------------F U N D I N G _ P R O D U C T---------------------------------------------*/

create table Funding_Product(
fp_id varchar2(20),
fp_name varchar2(70),
fp_category varchar2(20),
fp_image varchar2(100),
fp_description varchar2(3000),
fp_seller varchar2(20), 
fp_price int,
goal_cost int,
startDate date default sysdate,
deadline date, 
payDate date,
updateDate date default sysdate,
funding_qty int default 0,
fp_state int default 0,
constraint fk_fcategory foreign key(fp_category) references Funding_Category(category),
constraint fk_fp_seller foreign key(fp_seller) references Member(id) on delete set null
);
alter table Funding_Product add constraint pk_fp primary key(fp_id);

insert into Funding_Product 
	values('F1000','앨리스의 퀴즈 여행','도서','F1000.jpg',
			'아티비티 시리즈. 책장을 넘길 때마다 아름답게 펼쳐지는 환상적인 공간에서 흥미로운 퀴즈가 주어진다. 문제를 풀기 위해서는 관찰력과 집중력, 추리력 등 지적 사고력을 총동원해야 한다. 80가지 퀴즈를 모두 풀어야만 목적지까지 갈 수 있다.',
			'hwang',10000,1200000,'2020-09-06',
			'2020-10-18',
			'2020-10-19',sysdate,0,0);
insert into Funding_Product 
	values('F1001','꼬마 여우의 사계절','도서','F1001.jpg',
			'혼자 여행을 하고 돌아와 또 다른 모험을 꿈꾸던 꼬마 여우가 겨울, 봄, 여름, 그리고 다시 가을을 지내는 이야기가 자연물을 꼴라주한 작품에 담겨 아름답게 펼쳐진다. 눈여우를 만들고, 꿈틀꿈틀 애벌레도 만나고, 친구를 만나 신나게 노는 꼬마 여우를 따라가며 사계절의 변화와 아름다움을 흠뻑 느낄 수 있다. 나뭇잎과 꽃잎을 주워 오리고 붙이며 자연미술 놀이를 할 수 있는, 책 자체가 멋진 워크북이다.',
			'yun',22000,3300000,'2020-09-05',
			'2020-10-10',
			'2020-10-11',sysdate,0,0);
insert into Funding_Product 
	values('F1002','다 같이 흘러내리지','도서','F1002.jpg',
			'차가운 얼음이 온기에 흘러내리듯, 고양이 털처럼 노곤하고 부드러운 마음을 전하는 책',
			'Lee',15000,2000000,'2020-09-03',
			'2020-10-12',
			'2020-10-13',sysdate,0,0);
insert into Funding_Product 
	values('F1003','종이접기 뚝딱!','도서','F1003.jpg',
			'종이를 간편하게 한 장씩 뜯어내 친절한 설명을 따라 접기만 하면 돛단배, 나비, 개구리, 백조, 여우가 뚝딱 완성된다. 패턴과 색깔이 각기 다른 다양한 패턴 색종이 중에서 무엇이든 골라 접어 돛단배와 동물들을 수십 개씩 만들 수 있다.',
			'han',9900,1500000,'2020-09-02',
			'2020-10-15',
			'2020-10-16',sysdate,0,0);
insert into Funding_Product 
	values('F1004','단어수집가','도서','F1004.jpg',
			'세상에는 여러 종류의 수집가가 있지만 제롬은 그중에서도 낱말을 모은다. 이야기를 듣다 왠지 관심이 가는 단어, 지나가다가 눈에 띄거나 책을 읽다가 문장 속에서 튀어나오는 단어, 기분 좋은 말, 노래 같은 말, 무슨 뜻인지 통 모르겠지만 어쩐지 그냥 근사하게 들리는 낱말. 마음에 탁 들어오는 단어를 발견했을 때 호기심과 기쁨이 내려앉은 제롬의 콧잔등은 사랑스럽게 찡긋거린다. 종이에 적은 말들을 주제별로 차곡차곡 풀로 붙여 낱말책에 정리하는 일은 제롬의 보람이다. 낱말책은 나날이 두툼해지고 또 쌓여 간다.',
			'hyuk',12800,2300000,'2020-09-05',
			'2020-10-20',
			'2020-10-21',sysdate,0,0);

insert into Funding_Product 
	values('F1005','세모 인형 파우치','잡화','F1005.jpg',
			'인형처럼 폭신폭신하고 도톰한 입체 파우치로 돌아온 레모니와 애플이예요! 카드와 립밤 등 작은 소지품을 들고 다니기 좋은 아담한 파우치입니다.',
			'hwang',18000,3000000,'2020-08-29',
			'2020-09-23',
			'2020-09-24',sysdate,0,0);
			
insert into Funding_Product 
	values('F1006','코코카 쿼카 코알라 귀여운 필통 플랫파우치','잡화','F1006.jpg',
			'세상에 둘도 없는 귀여운 친구들 코코카 파우치를 소개합니다. 코코카는 쿼카와 코알라가 합쳐진 이름이에요~ 여러분이 좋은 친구가 되어주세요:)',
			'hwang',8400,2500000,'2020-08-29',
			'2020-10-25',
			'2020-10-26',sysdate,0,0);
			
insert into Funding_Product 
	values('F1007','Among Us','게임','F1007.png',
			'Wonderful party game with friends, has the vibe of Gmods Murder gamemode or TTT but this one is simple and just an overall fun game. highly recommend with groups of friends.',
			'han',5500,3500000,'2020-09-25',
			'2020-11-02',
			'2020-11-03',sysdate,0,0);
			
insert into Funding_Product 
	values('F1008','Untitled Goose Game','게임','F1008.png',
			'It is a lovely morning in the village and you are a horrible goose.Untitled Goose Game is a slapstick-stealth-sandbox, where you are a goose let loose on an unsuspecting village. Make your way around town, from peoples back gardens to the high street shops to the village green, setting up pranks, stealing hats, honking a lot, and generally ruining everyone’s day.',
			'kim',15300,5500000,'2020-09-25',
			'2020-10-30',
			'2020-10-31',sysdate,0,0);
			
insert into Funding_Product 
	values('F1009','The Henry StickMin Collection','게임','F1009.png',
			'The Henry Stickmin Collection is a Newgrounds choose-your-own-path classic, reborn and revitalized. This 6-game epic culminates in multiple entirely canon, extremely different endings. Each step of the journey has you choose from options such as a Teleporter or calling in your buddy Charles to help you out. Correct choices will move the story forward, but incorrect choices lead to a fail. If you get to the end on your first try, you’re doing it wrong. Failing is half the fun.',
			'hwang',15500,4000000,'2020-09-25',
			'2020-10-15',
			'2020-10-16',sysdate,0,0);
			
insert into Funding_Product 
	values('F1010','플라밍고 우산 폴드','잡화','F1010.jpg',
			'플라밍고 손잡이와 화사한 핑크 색상으로 인싸가 되어보세요!! 비오는 날이 행복해지는 플라밍고 우산! 지금 당장 예약하세요!',
			'hwang',22000,3200000,'2020-08-29',
			'2020-10-19',
			'2020-10-20',sysdate,0,0);
			
/*--------------------------------R E F U N D _ L I S T---------------------------------------------*/
			
create table RefundList(
seq number primary key,
o_number varchar2(100),
p_id varchar2(30)  not null,
price number, 
qty number,
requestDate date default sysdate,
refundDate date,
refundMeans varchar2(100),
refundSystem varchar2(100),
id varchar2(30),
name varchar2(30),
phone varchar2(50),
postcode varchar2(50),
address varchar2(300),
totalCost number
);

create sequence seq_refundlist;

/*-----------------------------------V I S I T O R-------------------------------------------------*/
create table visitor(
id varchar2(20),
visit_date date default sysdate
);

alter table visitor add constraint fk_visitor_id foreign key (id) references member (id) on delete set null;

insert into visitor (id,visit_date) values ('abc',TO_DATE('2020-10-06 18:00:00','YYYY-MM-DD HH24:MI:SS'));