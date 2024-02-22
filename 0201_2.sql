조인 : 2개 이상의 테이블을 사용하여 SQL을 작성하는 것
    2개 이상의 테이블을 묶어서 하나의 결과를 만들어 내기 위한 방법

    1) 내부 조인(inner join) : 외래키(fk)를 이용하는 방법
        select A테이블.컬럼명, A테이블.컬럼명 , B테이블.컬럼명, B테이블.컬럼명
        from A테이블, B테이블
        where A테이블.컬럼명(fk사용) = B테이블.컬럼명(fk사용) ;
        ** 두 테이블이 모두 같은 컬럼(외래키 사용)을 가지고 있고 해당 컬럼으로 조건식을 사용
        ** 보통은 테이블이름 별칭 사용
        
        
-- 고객과 고객의 주문에 관한 데이터를 모두 보이시오
    select *
    -- 고객을 기준으로 주문에 관한 데이터가 나온다
    -- orders3가 앞에 있으면 해당 주문을 어떤 고객이 했느냐 라는 표가 나옴
    from customer3, orders3     
    where customer3.custid=orders3.custid ;
    
-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색
    select c.name, o.saleprice
    from customer3 c, orders3 o
    where c.custid=o.custid ;
    
-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오
    select c.name, count(*), sum(o.saleprice)
    from customer3 c, orders3 o
    where c.custid=o.custid
    group by c.name
    -- 이름순으로 정렬
    order by c.name;
    
-- 고객의 이름(custid)과 고객이 주문한 도서의 이름(bookid)을 구하시오
    -- customer3와 book3는 서로 관계가 없기 때문에 orders3라는 테이블을 이용함
    select c.name, b.bookname
    from customer3 c, orders3 o, book3 b
    where c.custid=o.custid and o.bookid=b.bookid ;
    
    -- 판매가 포함
    select c.name, b.bookname, o.saleprice
    from customer3 c, orders3 o, book3 b
    where c.custid=o.custid and o.bookid=b.bookid ;
    
-- 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오
    select c.name, b.bookname
    from customer3 c, orders3 o, book3 b
    where c.custid=o.custid and o.bookid=b.bookid and o.saleprice =20000;

 2. 외부 조인 : left join, right join
  : 오라클에서 LEFT JOIN은 아우터 조인(외부조인)에서 가장 많이 사용하는 방법 중 하나이다.
  LEFT OUTER JOIN은 OUTER 키워드를 생략하고 LEFT JOIN으로 사용하기도 한다. 
  아우터 조인은 조인할 테이블에 데이터가 없어도 기준 테이블의 데이터는 모두 출력되는 조인 방법이다.

    형식) 
    select
    from 기본테이블
    left join 조인테이블
    on  기본테이블.컬럼 = 조인테이블.컬럼
    where 조건
    
-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오
    select c.name, o.saleprice
    from customer3 c
    left join orders3 o
    on c.custid=o.custid ;
================================================================================

create table AAA(
    id number PRIMARY key ,
    ename VARCHAR2(50)
);
create table BBB(
    id number PRIMARY key ,
    kname VARCHAR2(50)
);

insert into AAA values(1,'AAA');
insert into AAA values(2,'BBB');
insert into AAA values(3,'CCC');

insert into BBB values(1,'가');
insert into BBB values(2,'나');
insert into BBB values(4,'라');
insert into BBB values(5,'마');
commit;

-- a테이블의 id가 기준이기 때문에 b테이블의 4,5번 id의 내용은 출력되지 않음
select * from AAA a left join BBB b on a.id=b.id ;

-- 기준 b테이블 id4,5= 값은 null, a테이블의 id=3은 b테이블에 없기 때문에 아예 출력되지 않음
select * from BBB b left join AAA a on b.id=a.id ;

-- right join (left랑 반대개념이라서 딱히 안쓰고 그냥 left씀)
select * from AAA a right join BBB b on a.id=b.id ;

-- 해당 테이블들을 모두 포함하고 있는 것 (공통 컬럼이 아니면 null)
-- 해당되는 전체 테이블의 데이터가 없는 것도 전부 다 출력(null)됨
select * from AAA a full join BBB b on a.id=b.id ;

-- 해당 테이블들의 공통 컬럼을 제외
-- null 값을 가진 데이터들만 출력(시험문제??)
select * from AAA a full join BBB b on a.id=b.id    -- null값을 포함한 전체 출력
where a.id is null or b.id is null;                 -- null값을 포함한 데이터만 출력

================================================================================

서브 쿼리 : (메인)쿼리 안에 (서브)쿼리를 말함
    - 결과 : 
        단일행 연산자 : 결과가 1줄. 보통 메인쿼리는 비교연산자를 사용
        다중행 연산자 : 결과가 여러줄. in, any, all, exists ;

-- book3 테이블에서 가장 비싼 도서의 이름 검색
    -- 가장 비싼 금액
    -- group by와 상관없이 집계함수만 따로 사용 가능
    select max(price) from book3 b;
    -- 가장 비싼 금액의 도서 이름
    select bookname from book3 b where price=35000;
    -- 위의 두줄짜리 코딩을 한줄로 변경 (서브쿼리를 이용한 단일행 연산자 사용)
    select bookname from book3 b where price =(select max(price) from book3);
    
-- 도서 구매이력(orders3)이 있는 고객의 이름(customer3) 검색
    -- 구매이력이 있는 고객 (중복구매도 있으므로 중복 제거함)
    select distinct custid from orders3 ;
    -- 구매이력이 있는 고객의 이름
    select name from customer3 where custid=1;
    select name from customer3 where custid=2;
    select name from customer3 where custid=3;
    select name from customer3 where custid=4;
    -- 위의 다중행을 한줄로 변경함
    select name from customer3 c where custid in (1,2,3,4);
    -- 변경한 다중행 코딩과 구매이력 고객을 한줄로 코딩(서브쿼리를 이용한 다중행 연산자 사용)
    select name from customer3 c where custid in (select distinct custid from orders3);
    -- join을 이용한 방법
    select distinct c.name 
    from customer3 c, orders3 o 
    where c.custid = o.custid;

-- 대한미디어에서 출판한 도서(book3)를 구매한 고객의 이름(customer3)
    -- 대한미디어에서 출판한 책
    select bookid from book3 where publisher='대한미디어';   -- 3,4
    
    -- orders3 테이블에서 3,4(bookid) 를 주문한 custid
    select custid from orders3 where bookid in (3,4);      -- 1
    
    -- custid=1 사람의 이름
    select name from customer3 where custid=1;
    
    -- 위의 3단계의 코딩을 한번에 (서브 쿼리 사용)
    select name from customer3
    where custid = (select custid 
                    from orders3 
                    where bookid in (select bookid 
                                        from book3 
                                        where publisher='대한미디어'));
    
    -- 서브쿼리를 이용한 코딩을 join으로 변경
    select distinct c.name
    from orders3 o , customer3 c, book3 b
    where o.custid=c.custid and b.bookid=o.bookid and b.publisher='이상미디어';

-- _구로 시작한 책을 구입한 사람
    select bookid from book3 where bookname like '_구%';
    select distinct custid from orders3 where bookid in(1,2,3,7,8);
    select name from customer3 where custid in(1,3,4);
    
    select name from customer3 where custid in (select distinct custid from orders3 
    where bookid in(select bookid from book3 where bookname like '_구%'));

-- 평균 도서 가격보다 비싼 도서이름
    -- 평균가 : 14450
    select avg(price) from book3;
    select bookname from book3 where price>14450;
    
    select bookname from book3 where price> (select avg(price) from book3);

================================================================================
-- 합집합 union, 차집합 minus, 교집합 intersect
-- 주의 : 오라클은 차집합을 minus로 하지만 SQL 표준은 except 사용
    
-- 도서를 주문하지 않은 고객의 이름 (차집합)
 -- 전체 고객-주문한 고객 = 주문하지 않은 고객
    -- 전체 고객
    select name from customer3;
    -- 주문한 고객 : 1,2,3,4
    select custid from orders3;
    -- 결론
    select name from customer3
    minus 
    select name from customer3 where custid in (select custid from orders);
================================================================================

--연습문제--
-- 박지성이 구매한 도서의 출판사 수
    select count(distinct publisher) as 출판사
    from customer3 c, orders3 o, book3 b
    where o.custid=c.custid and o.bookid=b.bookid and c.name='박지성';
    
-- 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
    select b.bookname, b.price, o.saleprice, b.price-o.saleprice as 할인금액
    from customer3 c, orders3 o, book3 b
    where o.custid=c.custid and o.bookid=b.bookid and c.name='박지성';
   
-- 박지성이 구매하지 않은 도서의 이름
    select bookname from book3;
    select bookid from orders3 where custid=1;

    select bookname from book3
    minus 
    select bookname from book3 where bookid in (select bookid from orders3 where custid=1);

-- 주문하지 않은 고객의 이름(부속질의 사용)
    select name from customer3
    where name not in (select name from customer3 c, orders3 o where c.custid=o.custid);
    
    select name from customer3
    minus
    select name from customer3 where custid in(select distinct custid from orders3);
    
-- 주문 금액의 총액과 주문의 평균 금액
    select sum(saleprice), avg(saleprice) from orders3;
    
-- 고객의 이름과 고객별 구매액
    select c.name, sum(saleprice)
    from customer3 c, orders3 o
    where c.custid=o.custid
    group by c.name;

-- 고객의 이름과 고객이 구매한 도서 목록
    select c.name, b.bookname from customer3 c, orders3 o, book3 b
    where o.custid = c.custid and b.bookid = o.bookid;
    -- 정렬 : order by c.name asc;
    
-- 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
    select b.bookname, b.publisher, b.price, o.saleprice
    from book3 b, orders3 o
    where b.bookid=o.bookid and b.price-o.saleprice =
    (select max(b.price-o.saleprice) from book3 b, orders3 o
    where b.bookid=o.bookid);
    
-- 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
    -- 도서 판매 평균액
    select avg(saleprice) from orders3;
    -- 본인 구매 평균액
    select c.name, avg(o.saleprice) from customer3 c, orders3 o
    where o.custid=c.custid
    group by c.name;
   
    -- 비교 결과
    select c.name, avg(o.saleprice) from customer3 c, orders3 o
    where o.custid=c.custid
    group by c.name
    having avg(o.saleprice) > (select avg(saleprice) from orders3);

================================================================================
-- p.199 no.11 테이블 생성하고 문제풀이 제약조건 확인
-- 제약조건 : 영화가격 20000이하, 상영관번호 1~10번, 같은사람이 같은 좌석번호를 두번 예약X
CREATE TABLE 극장2 (
    극장번호 number,
    극장이름 VARCHAR2(50),
    위치 VARCHAR2(50),
    primary key(극장번호)
);

CREATE TABLE 고객2 (
    고객번호 number,
    이름 VARCHAR2(50),
    주소 VARCHAR2(50),
    primary key(고객번호)
);

CREATE TABLE 상영관2 (
    극장번호 number ,
    상영관번호 number CHECK (상영관번호 between 1 and 10),
    영화제목 VARCHAR2(50),
    가격 number CHECK (가격 <= 20000),
    좌석수 number,
    primary key (극장번호,상영관번호)
);

-- 테이블 생성 : 예약 (reservation)
CREATE TABLE 예약2 (
    극장번호 NUMBER NOT NULL,
    상영관번호 NUMBER NOT NULL,
    고객번호 NUMBER NOT NULL,
    좌석번호 NUMBER,
    날짜 DATE,
    primary key (극장번호,상영관번호,고객번호)
);

insert into 극장2(극장번호,극장이름,위치) values(1,'롯데','잠실');
insert into 극장2(극장번호,극장이름,위치) values(2,'메가','강남');
insert into 극장2(극장번호,극장이름,위치) values(3,'대한','잠실');

insert into 상영관2(극장번호,상영관번호,영화제목,가격,좌석수) values(1,1,'어려운 영화',15000, 48);
insert into 상영관2(극장번호,상영관번호,영화제목,가격,좌석수) values(3,1,'멋진 영화',7500, 120);
insert into 상영관2(극장번호,상영관번호,영화제목,가격,좌석수) values(3,2,'재밌는 영화',8000, 110);

insert into 예약2(극장번호,상영관번호,고객번호,좌석번호,날짜) values(3,2,3,15, '2020-09-01');
insert into 예약2(극장번호,상영관번호,고객번호,좌석번호,날짜) values(3,1,4,16, '2020-09-01');
insert into 예약2(극장번호,상영관번호,고객번호,좌석번호,날짜) values(1,1,9,48, '2020-09-01');

insert into 고객2(고객번호,이름,주소) values(3,'홍길동','강남');
insert into 고객2(고객번호,이름,주소) values(4,'김철수','잠실');
insert into 고객2(고객번호,이름,주소) values(9,'박영희','강남');

-- 모든 극장의 이름과 위치
    select * from 극장2;
    
-- 잠실에 있는 극장
    select * from 극장2 where 위치='잠실';
    
-- 잠실에 사는 고객의 이름을 오름차순으로
    select 이름, 주소 from 고객2 order by 주소;
    
-- 가격이 8000원 이하인 영화의 극장번호, 상영관번호, 영화제목
    select 극장번호, 상영관번호, 영화제목 from 상영관2 where 가격<=8000;
    
-- 극장 위치와 고객의 주소가 같은 고객 <?????몰루>
    select 고객2.이름, 고객2.주소, 극장2.극장이름, 극장2.위치
    from 극장2, 고객2, 예약2
    where 극장2.극장번호=예약2.극장번호 and 고객2.고객번호=예약2.고객번호 and 고객2.주소=극장2.위치;

(1) 단순 질의(SQL)
① 모든 극장의 이름과 위치를 보이시오.
    select * from 극장2;
    
② ‘잠실’에 있는 극장을 보이시오.
    select * from 극장2 where 위치 like '잠실';
    
③ ‘잠실’에 사는 고객의 이름을 오름차순으로 보이시오.
    select * from 고객2 where 주소 like '잠실' order by 이름;
    
④ 가격이 6,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.
    select 극장번호, 상영관번호, 영화제목 from 상영관2 where 가격<=6000;
    
⑤ 극장 위치와 고객의 주소가 같은 고객들을 보이시오.
    select distinct 고객2.* from 극장2, 고객2 where 극장2.위치 like 고객2.주소;
    
(2) 집계질의
① 극장의 수는 몇 개인가?
    select count(*) from 극장2;
    
② 상영되는 영화의 평균 가격은 얼마인가?
    select avg(가격) from 상영관2;
    
③ 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?
    -- 연월일시분초 까지 표기로 바꿈 그래서 '2020/09/01%' %가 들어감
    select count(*) from 예약2 where 날짜 like '2020/09/01%'; 
    
(3) 부속질의와 조인
① ‘대한’ 극장에서 상영된 영화제목을 보이시오.
    select 상영관2.영화제목 from 극장2, 상영관2
    where 극장2.극장번호=상영관2.극장번호 and 극장2.극장이름 like '대한';
    
② ‘대한’ 극장에서 영화를 본 고객의 이름을 보이시오.
    select 고객2.이름 from 예약2, 극장2, 고객2
    where 예약2.극장번호=극장2.극장번호 and 고객2.고객번호=예약2.고객번호 
        and 극장2.극장이름 like '대한';
    
③ ‘대한’ 극장의 전체 수입을 보이시오.
    select sum(가격) from 극장2, 상영관2, 예약2
    where 극장2.극장번호 = 상영관2.극장번호 and 상영관2.극장번호 =예약2.극장번호 
    and 예약2.상영관번호=상영관2.상영관번호 and 극장2.극장이름 like '대한';

(4) 그룹질의
① 극장별 상영관  수를 보이시오.
    select 극장번호, count(*) from 상영관2 group by 극장번호;
    
② ‘잠실’에 있는 극장의 상영관을 보이시오.
    select * from 극장2, 상영관2
    where 극장2.극장번호 = 상영관2.극장번호 and 극장2.위치 like '잠실';
    
③ 2020년 9월 1일에 극장별 평균 관람 고객의 수를 보이시오.
    select 극장번호, count(*) from 예약2 
    where 날짜 like '2020/09/01%' 
    group by 극장번호;
    
-- ④ 2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오.
