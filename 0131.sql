commit : 현재 상태를 데이터베이스에 그대로 저장한다

rollback : 현재 상태(commit 이후) > update, insert, delete 여러번 사용 실행 
            > commit(변경내용 저장) or rollback(변경 전 commit 상태로 되돌아감) 

UPDATE : 특정 속성 값을 수정하는 명령어
 기본형식 : update 테이블이름
            set 속성이름1 = 값1 [, 속성이름2 = 값2, 속성이름3 = 값3 ... ]
            [where 조건식 ] ;
            ** 조건식에서 조건이 없으면 해당 컬럼의 모든 데이터가 변경된다
                조건식에서의 '=' 는 같다라는 뜻이다
                set에서의 '='는 데이터 저장이라는 개념
1. customer 테이블에서 고객번호가 5번인 고객의 주소를 '대한민국 부산'으로 변경
    update customer
    set     address='대한민국 부산'
    where   custid=5;
    
2. customer 테이블에서 김연아 고객의 주소를 '대한민국 대전'으로 변경
    update customer
    set     address ='대한민국 대전'
    where   name='김연아';
    
3. book 테이블에서 출판사가 '대한미디어'에서 '대한출판사'로 이름 변경
    update book
    set     publisher ='대한출판사'
    where   publisher ='대한미디어';
    
4. customer 테이블에서 추신수의 주소를 '대한민국 경기도', 핸드폰번호를 '000-1111-9999'로 변경
    update customer
    set     address = '대한민국 경기도', phone='000-1111-9999'
    where   name='추신수';

delete : 테이블에 있는 기존 튜플(=레코드or행)을 삭제하는 명령
 기본 형식 : delete from 테이블이름
            [where 조건식 ] ;
            ** 조건이 없으면 해당 테이블의 모든 데이터가 삭제된다
               조건식에서 '='는 같다 라는 의미임

1. customer 테이블의 모든 데이터 삭제하기
    delete from customer;

2. 모든 데이터 삭제된 것을 확인 후 rollback
    rollback;

3. customer 테이블에서 고객 번호 5번의 고객 삭제
    delete from customer
    where   custid=5;

4. 삭제된 것 확인 후 rollback
    rollback;

--연습문제
1. 새로운 도서 ('스포츠 세계', '대한미디어', 10000원)이 마당서점에 입고되었다. 
     삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보자.
     --제약 조건이 없는 상태에서는 삽입 가능--
    insert into book(bookname, publisher, price)
    values ('스포츠 세계', '대한미디어', 10000);
    
2. '삼성당'에서 출판한 도서를 삭제해야 한다.
    delete from book
    where publisher='삼성당';

3. '이상미디어'에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인을 생각해보자.
    delete from book
    where publisher='이상미디어';
    
4. 전체를 commit 상태로 rollback
    rollback;

================================================================================
--원래는 생성할때 기본키(pk)와 외래키(fk)를 지정하는게 맞음 (정보 보호를 위해)
--테이블 생성할 때 외래키 지정하는 방법
--CONSTRAINT fk명 FOREIGN key(컬럼명) REFERENCES pk가 위치한 테이블명(컬럼명);
--외래키는 참조하는 것은 기본키로 해야함 (외래키를 가진 테이블 및 insert때도 마지막에)

--부모테이블 부터 생성
create table customer2(
    custid      number not null primary key,
    name        varchar2(50),
    address     varchar2(50),
    phone       varchar2(50)
);

insert into customer2(custid, name, address, phone)
values(1, '박지성', '영국 맨체스터', '000-5000-0001');
insert into customer2(custid, name, address, phone)
values(2, '김연아', '대한민국 서울', '000-6000-0001');
insert into customer2(custid, name, address, phone)
values(3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into customer2(custid, name, address, phone)
values(4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into customer2(custid, name, address, phone)
values(5, '박세리', '대한민국 대전', null);

--부모테이블 부터 생성
create table book2(
    bookid      number not null primary key,
    bookname    varchar2(50),
    publisher   varchar2(50),
    price       number
);

insert into book2(bookid, bookname, publisher, price)
values(1, '축구의 역사', '굿스포츠', 7000);
insert into book2(bookid, bookname, publisher, price)
values(2, '축구아는 여자', '나무수', 13000);
insert into book2(bookid, bookname, publisher, price)
values(3, '축구의 이해', '대한미디어', 22000);
insert into book2(bookid, bookname, publisher, price)
values(4, '골프 바이블', '대한미디어', 35000);
insert into book2(bookid, bookname, publisher, price)
values(5, '피겨 교본', '굿스포츠', 8000);
insert into book2(bookid, bookname, publisher, price)
values(6, '역도 단계별기술', '굿스포츠', 6000);
insert into book2(bookid, bookname, publisher, price)
values(7, '야구의 추억', '이상미디어', 20000);
insert into book2(bookid, bookname, publisher, price)
values(8, '야구를 부탁해', '이상미디어', 13000);
insert into book2(bookid, bookname, publisher, price)
values(9, '올림픽 이야기', '삼성당', 7500);
insert into book2(bookid, bookname, publisher, price)
values(10, 'Olympic Champions', 'Pearson', 13000);

-- 자식테이블은 외래키를 포함하여 부모테이블에서 정보를 참조받기 때문에 가장 나중에 생성
-- 2개의 부모테이블을 가진 자식테이블
create table orders2(
    orderid     number not null primary key,
    custid      number,
    bookid      number,
    saleprice   number,
    orderdate   date,
    constraint fk_custid foreign key (custid) references customer2(custid),
    constraint fk_bookid foreign key (bookid) references book2(bookid)
);

-- 외래키가 있는 테이블이기 때문에 insert도 마지막에 실행해야한다 
-- 오류발생 때문에 부모테이블 먼저 생성함
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(1,1,1,6000,'2020/07/01');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(2,1,3,21000,'2020/07/03');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(3,2,5,8000,'2020/07/03');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(4,3,6,6000,'2020/07/04');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(5,4,7,20000,'2020/07/05');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(6,1,2,12000,'2020/07/07');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(7,4,8,13000,'2020/07/07');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(8,3,10,12000,'2020/07/08');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(9,2,10,7000,'2020/07/09');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(10,3,8,13000,'2020/07/10');
================================================================================

1. 새로운 도서 ('스포츠 세계', '대한미디어', 10000원)이 마당서점에 입고되었다. 
     삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보자.
     -- custid에 제약조건이 not null primary key
     -- 아래 예시는 기본키를 지정하지 않았으므로 오류 발생
    insert into book2(bookname, publisher, price)
    values ('스포츠 세계', '대한미디어', 10000);

* 외래키 지정 후 삭제(무결성 제약 조건 조심해야함)
 ** 자식테이블은 마음대로 삭제 가능
 ** 부모테이블은 마음대로 삭제할 수 없다(정보 보호를 위해)
 ** 자식테이블에서 참조하지 않으면 부모테이블에서도 삭제 가능하다


2. '삼성당'에서 출판한 도서를 삭제해야 한다.
    -- orders2 테이블에 있는 bookid 중에 삼성당을 참조하는 데이터가 없으므로 삭제 가능
    delete from book2
    where publisher='삼성당';

3. '이상미디어'에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인을 생각해보자.
    -- orders2 테이블에 있는 bookid 중에 이상미디어를 참조하는 데이터가 있으므로 삭제 불가능
    -- 참조 무결성 제약조건 오류 발생 (자식레코드가 있는 경우에 해당함)
    delete from book2
    where publisher='이상미디어';

--부모테이블은 마음대로 삽입이 가능하지만, 자식테이블은 부모테이블에 없는 데이터를 삽입할 수 없다
 * 외래키 지정 후 삽입 (무결성 제약 조건 조심해야함)
  ** 자식테이블 (외래키를 가지고 있는 테이블)에서 삽입할 때
        참조하는 부모테이블의 컬럼 데이터 중에서 삽입해야 한다
     없는 데이터를 삽입하면 오류 발생

4. orders2 테이블에 데이터 삽입
    1) orderid=11에 박지성(custid=1)이 '골프 바이블'(bookid=4) 책을 35000원을 주고 
        2020-07-12일 구매 (삽입 가능)
    insert into orders2(orderid, custid, bookid, saleprice, orderdate)
    values(11,1,4,35000,'2020-07-12');

    2) orderid=12에 박세리(custid=5)가 '축구 바이블'(bookid=11) 책을 35000원을 주고 
        2020-07-12일 구매 (삽입 불가능)
            -- 무결성 제약조건 오류 (부모키 없음)
            -- 부모키 orderid의 12번 데이터가 없기 때문에 오류 발생
    insert into orders2(orderid, custid, bookid, saleprice, orderdate)
    values(12,5,11,25000,'2020-07-12');
================================================================================

create table book3(
    bookid      number,
    bookname    varchar2(50),
    publisher   varchar2(50),
    price       number
);

insert into book3(bookid, bookname, publisher, price)
values(1, '축구의 역사', '굿스포츠', 7000);
insert into book3(bookid, bookname, publisher, price)
values(2, '축구아는 여자', '나무수', 13000);
insert into book3(bookid, bookname, publisher, price)
values(3, '축구의 이해', '대한미디어', 22000);
insert into book3(bookid, bookname, publisher, price)
values(4, '골프 바이블', '대한미디어', 35000);
insert into book3(bookid, bookname, publisher, price)
values(5, '피겨 교본', '굿스포츠', 8000);
insert into book3(bookid, bookname, publisher, price)
values(6, '역도 단계별기술', '굿스포츠', 6000);
insert into book3(bookid, bookname, publisher, price)
values(7, '야구의 추억', '이상미디어', 20000);
insert into book3(bookid, bookname, publisher, price)
values(8, '야구를 부탁해', '이상미디어', 13000);
insert into book3(bookid, bookname, publisher, price)
values(9, '올림픽 이야기', '삼성당', 7500);
insert into book3(bookid, bookname, publisher, price)
values(10, 'Olympic Champions', 'Pearson', 13000);

create table customer3(
    custid      number,
    name        varchar2(50),
    address     varchar2(50),
    phone       varchar2(50)
);

insert into customer3(custid, name, address, phone)
values(1, '박지성', '영국 맨체스터', '000-5000-0001');
insert into customer3(custid, name, address, phone)
values(2, '김연아', '대한민국 서울', '000-6000-0001');
insert into customer3(custid, name, address, phone)
values(3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into customer3(custid, name, address, phone)
values(4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into customer3(custid, name, address, phone)
values(5, '박세리', '대한민국 대전', null);

create table orders3(
    orderid     number,
    custid      number,
    bookid      number,
    saleprice   number,
    orderdate   date
);

insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(1,1,1,6000,'2020/07/01');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(2,1,3,21000,'2020/07/03');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(3,2,5,8000,'2020/07/03');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(4,3,6,6000,'2020/07/04');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(5,4,7,20000,'2020/07/05');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(6,1,2,12000,'2020/07/07');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(7,4,8,13000,'2020/07/07');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(8,3,10,12000,'2020/07/08');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(9,2,10,7000,'2020/07/09');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(10,3,8,13000,'2020/07/10');


테이블을 만들어 놓은 상태에서 기본키와 외래키 삽입
    : alter table 테이블이름 add 

-- 기본의 테이블들을 데이터와 함께 복사 (원본 그대로 가지고 있기 위함)
    create table book3 as select * from book;
    create table customer3 as select * from customer;
    create table orders3 as select * from orders;

-- 기본키 삽입
    --alter table 테이블이름 add primary key (컬럼명);
    alter table book3 add primary key (bookid);
    alter table customer3 add primary key (custid);
    alter table orders3 add primary key (orderid);

-- 외래키 삽입
    --alter table 테이블이름 add constraint fk_이름 foreign key (컬럼명) references pk를 가진 부모테이블(컬럼명);
    alter table orders3 add constraint fk_custid3 foreign key (custid) references customer3(custid);
    alter table orders3 add constraint fk_bookid3 foreign key (bookid) references book3(bookid);

-- 기본키 삭제하기, 외래키 삭제하기 ( 숙제 : ~02/02 )
    alter table 테이블명(orders3) drop 제약조건(primary key) ;
    alter table 테이블명(orders3) drop constraint 외래키명(fk_bookid3) ;
