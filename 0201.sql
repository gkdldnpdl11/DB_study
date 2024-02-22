select : 검색 (결과는 테이블로 나온다)
    ** insert, update, delete 의 결과는 숫자로 나온다
 형식) select [ * | distinct ] 컬럼명(들), ...
        from 테이블이름(들)
        [ where 조건식 ]
        [ group by 컬럼명(들) ]
        [ having 조건식 ]
        [ order by 속성이름 [ASC=생략 | DESC ]
        ** ASC = 생략 = 오름차순, DESC = 내림차순

-- 모든 도서의 이름과 가격을 검색 (book 테이블)
    select bookname, price
    from book3;
    
-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색 (book 테이블)
    select bookid, bookname, publisher, price
    from book3;
    -- 둘 다 같은 뜻임. 테이블 안의 모든 내용을 검색할 때는 * 사용하면 됨
    select *
    from book3;
    
-- 도서 테이블에 있는 모든 출판사를 검색 (book 테이블)
    select publisher
    from book3;
    
-- 검색 결과에서 중복을 제거하고 싶으면 distinct 키워드 사용 (book 테이블)
    -- select distinct 컬럼명 from 테이블이름;
    select distinct publisher
    from book3;
    
    -- 주의 사항 : 다른 컬럼과 함께 사용하면 안됨
    -- publisher와 bookname을 동시에 사용하면 bookname을 결과 도출을 위해 중복제거가 풀림
        -- 그래서 distinct는 혼자 사용해야됨(같이 사용하는 의미가없음=중복이 풀림)
    select distinct publisher, bookname
    from book3;

** 별칭 사용 : 별칭을 사용해도 원본 속성명은 변경되지 않는다
    select 컬럼명 as 별칭 , select 컬럼명 별칭
    
    -- 모든 도서의 이름과 가격을 검색 (book 테이블)
    select bookname as 도서명, price as 정가
    from book3;

    -- book3 테이블의 bookname, price 검색, customer3 테이블의 name, address 검색
    select bookname, price, name, address
    from book3, customer3;

    -- select 테이블.컬럼명 , 테이블.컬럼명
    select book3.bookname, book3.price, customer3.name, customer3.address
    from book3, customer3;
    
    -- 위의 코드를 별칭을 사용해서 적용
    -- 테이블에서 별칭 사용할 때는 as를 붙이면 오류 발생
    select b.bookname, b.price, c.name, c.address
    from book3 b, customer3 c;

    -- 숫자 속성, 날짜 속성은 계산 가능
    -- book3 테이블에서 price에 10% 할인 가격
    select bookid, bookname, publisher, price, price*0.9 as 할인가격
    from book3;

    -- order 테이블에 orderdate 때 10일을 추가한 날짜
    select custid, bookid, saleprice, orderdate, orderdate+10 반납일
    from orders3;
 ===============================================================================
 1. where 조건절 : 컬럼명 연산자
    : 비교연산 : =(같다) , <>, != (다르다), >=, <=, >, <
    
    -- 가격이 20,000원 미만인 도서를 검색 (book3 테이블)
    select * from book3 where price < 20000;
    
    -- 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오(book테이블)
    select * from book3 where price >=10000 and price <=20000;
    select * from book3 where price between 10000 and 20000;
    
    -- 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’인 도서를 검색하시오(book테이블)
    select * from book3 where publisher = '굿스포츠' or publisher='대한미디어';
    select * from book3 where publisher in ('굿스포츠','대한미디어');
    
    -- 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’인 아닌 도서를 검색하시오(book테이블)
    select * from book3 where publisher != '굿스포츠' and publisher != '대한미디어';
    select * from book3 where publisher not in ('굿스포츠','대한미디어');
================================================================================
2. 패턴 : 원하는 데이터가 정확하지 않을때 사용 like
    like % = 여러개의 문자 대신 사용 , _ = 한 글자 대신 사용

    -- '축구의 역사'를 출간한 출판사 검색
    select publisher from book3 where bookname = '축구의 역사';
    select publisher from book3 where bookname like '축구의 역사';
    
    -- 도서 이름에 '축구'가 포함된 출판사 검색
    select bookname, publisher from book3 where bookname = '축구';
    select bookname, publisher from book3 where bookname like '%축구%';   -- 축구를 포함하는
    select bookname, publisher from book3 where bookname like '야구%';    -- 야구로 시작하는
    select bookname, publisher from book3 where bookname like '%여자';    -- 여자로 끝나는
    
    -- 도서 이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서들 검색
    select bookname, publisher from book3 where bookname like '_구';     -- x구 두글자로 끝나는 책이름이 없음
    select bookname, publisher from book3 where bookname like '_구%';    -- x구를 포함된 
    
    -- 축구에 관한 도서 중 가격이 20,000원 이상인 도서들 검색
    select * from book3 where bookname like '%축구%' and price >=20000;
    
    -- 1,3,5,7,9번 자료의 날짜 변경 = 2020/08/15로 변경 (orders3 테이블)
    update orders3 set orderdate = '2020/08/15' where orderid in (1,3,5,7,9);
    
    -- orders3 테이블에서 7월인 자료만 검색
    select * from orders3 where orderdate like '%7%';       -- 월 말고 날짜에서 7이 포함되어있으면 같이 검색함
    select * from orders3 where orderdate like '2020/07%';
    
    -- orders3 테이블에서 orderdate가 2020년인 모든 정보 보기
    select * from orders3 where orderdate >= '2020/01/01' and orderdate <= '2020/12/31';
    select * from orders3 where orderdate between '2020/01/01' and '2020/12/31';
    select * from orders3 where orderdate like '2020%';

================================================================================
3. 정렬 : 항상 맨 마지막 줄에 넣어야 함
    [order by 컬럼명 [ASC=생략 | DESC]]
    ** ASC = 생략 = 오름차순 정렬 , DESC = 내림차순 정렬
    
    -- book3 테이블에서 이름순으로 검색 (오름차순)
    select * from book3 order by bookname;
    
    -- book3 테이블에서 가격순으로 검색하고, 가격이 같으면 이름순으로 검색
    select * from book3 order by price, bookname;
    
    -- 도서를 가격의 내림차순으로 검색하고, 가격이 같으면 출판사의 오름차순으로 검색
    select * from book3 order by price desc, publisher;
================================================================================
4. 집계함수 : sum(컬럼명), avg(컬럼명), max(컬럼명), min(컬럼명), count(컬럼명), count(*)

-- 고객이 주문한 도서의 총 판매액 (orders3 테이블)
    select sum(saleprice) as 판매액 from orders3;
    select sum(saleprice) from orders3;

-- 2번 김연아 고객이 주문한 도서의 총 판매액 (orders3 테이블)
    select sum(saleprice) as 판매액 from orders3 where custid=2;
    
-- 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가 (orders3 테이블)
    select sum(saleprice) as 총_판매액, avg(saleprice) as 평균값, min(saleprice) as 최소값, max(saleprice) as 최고값
    from orders3;
    
-- 도서 판매 건수 (orders3 테이블)
    select count(*) as 판매건수 from orders3;
    
-- 2번 김연아 고객이 주문한 도서 판매 건수 (orders3 테이블)
    select count(*) as 판매건수 from orders3 where custid=2;
================================================================================
5. group by : 속성값이 같은 것 끼리 그룹을 만든다
                집계함수도 사용할 수 있다
    select group by에 사용한 속성, 집계함수들
    from 테이블이름
    [where 조건식]
    [group by 묶을 속성명(들)]
    [having 조건식 = group by에 사용한 속성, 집계함수들];

-- 고객별로 주문한 도서의 총 수량과 총 판매액
    select custid as 고객번호, count(*) as 총_수량, sum(saleprice) as 총_판매액
    from orders3 
    group by custid;
    
-- 고객별 주문 도서의 총 수량, 단 3권 이상 구매 고객 대상
    select custid as 고객번호, count(*) as 총_수량
    from orders3 
    group by custid 
    having count(*)>=3;
    
-- 가격이 8,000원 이상인 도서를 구매한 고객. 고객별 주문 도서의 총 수량, 단 2권 이상 구매 고객 대상
    select custid as 고객번호, count(*)
    from orders3
    where saleprice>=8000
    group by custid
    having count(*)>=2;
================================================================================

* 연습문제

-- 도서번호가 1인 도서의 이름
    select bookname from book3 where bookid=1;
    select * from book3 where bookid like 1;
    
-- 가격이 20,000원 이상인 도서의 이름
    select * from book3 where price >= 20000;
    
-- 모든 고객의 이름, 주소
    select name, address from customer3;
    
-- 2020년 7월 4일~7월 7일 사이에 주문받은 도서의 주문번호
    select * from orders3 where orderdate between '2020/07/04' and '2020/07/07';
    --select orderdate from orders3 where orderdate between '2020/07/04' and '2020/07/07';
    --select orderdate from orders3 where orderdate in ('2020/07/04','2020/07/07');
    
-- 2020년 7월 4일~7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호 
    select * from orders3 where orderdate not between '2020/07/04' and '2020/07/07';
    --select orderdate from orders3 where orderdate not in ('2020/07/04','2020/07/07');
    
-- 성이 ‘김’ 씨인 고객의 이름과 주소
    select name, address from customer3 where name like '김%';
    
-- 성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소
    select name, address from customer3 where name like '김%아';
    select name, address from customer3 where name like '김%' and name like '%아';
    
-- 박지성의 총 구매액 (박지성의 고객번호 1번으로 작성) orders3 테이블
    select sum(saleprice) as 총_구매액 from orders3 where custid=1;

-- 박지성이 구매한 도서의 수 (박지성의 고객번호 1번으로 작성) orders3 테이블
    select count(*) as 도서_구매수량 from orders3 where custid=1;

-- 도서의 총 개수
    select count(*) as 도서수량 from book3;

-- 도서를 출고하는 출판사의 총 개수 (중복제거)
    select count(distinct publisher) from book3 ;

-- 주문 금액의 총액과 주문의 평균 금액
    select sum(saleprice) as 총액, avg(saleprice) as 평균가
    from orders3;

================================================================================

create table test1(
custid  number not null primary key,
club   varchar2(50),
stu     number,
proj    number
)
alter table test1 drop primary key;

insert into test1(custid, club, stu, proj)
values(1,'A',20,20);
insert into test1(custid, club, stu, proj)
values(1,'B',10,20);
insert into test1(custid, club, stu, proj)
values(1,'C',5,8);
insert into test1(custid, club, stu, proj)
values(2,'A',15,10);
insert into test1(custid, club, stu, proj)
values(2,'B',15,20);
insert into test1(custid, club, stu, proj)
values(3,'A',5,15);
insert into test1(custid, club, stu, proj)
values(3,'B',12,20);
insert into test1(custid, club, stu, proj)
values(3,'C',8,15);

-- 학년별 동아리 가입한 학생수, 제출한 과제수
-- 학생이 10명 이상 가입한 동아리에 대하여 동아리와 제출한 총 과제수
    select club, sum(stu) as 학생수, sum(proj) as 과제수
    from test1
    group by club;
    
================================================================================

create table nbook(
bookid  number not null primary key,
bookname    varchar2(100),
publisher   varchar2(100),
date    varchar2(100)
)

-- 도서(도서번호, 도서제목, 출판사명, 발행연도) 테이블
-- 2000년 이후 10권 이상 책 발행한 출판사 이름을 중복없이 출력
-- 도서번호는 도서 테이블의 기본키
    select bookid
    from nbook
    where date >=10, publisher distinct
    group by bookid;

