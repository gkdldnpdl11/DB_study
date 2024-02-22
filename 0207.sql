내장 함수 : 출력 결과를 보기 위해 오라클에서 제공하는 가상 테이블
숫자 관련 내장 함수 :
 1) ABS(숫자) : 절대값
    select abs(-75), abs(75), abs(-3.14), abs(3.14) from dual;
        
 2) CEIL(숫자) : 올림, 자리수 지정 없음, 소수점 기준(결과값은 정수로 나옴)
                (둘 사이의 큰 수로 이동)
    select ceil(-75.41), ceil(75.41), ceil(-75.61), ceil(75.61) from dual;
        
 3) FLOOR(숫자) : 버림(둘 사이의 작은 수로 이동), 자리수 지정 없음, 소수점 기준
    select floor(-75.41), floor(75.41), floor(-75.61), floor(75.61) from dual;
        
 4) trunc(숫자) : 소수점 이하 버림
    select trunc(-75.41), trunc(75.41), trunc(-75.61), trunc(75.61) from dual;
        
    4-1) trunc(숫자, 자리수) : 소수점 이하 버림에서 자리수 지정 가능
        select trunc(-75.41,0), trunc(75.41,0), trunc(-75.61,0), trunc(75.61,0) from dual;
        
    4-2) 소수점 첫째자리까지
        select trunc(-75.41,1), trunc(75.41,1), trunc(-75.61,1), trunc(75.61,1) from dual;
        
    4-3) 정수의 첫째자리 버림
        select trunc(-75.41,-1), trunc(75.41,-1), trunc(-75.61,-1), trunc(75.61,-1) from dual;
        
 5) ROUND(숫자) : 반올림
    select round(-13.4441), round(13.4441), round(-13.5441), round(13.5441) from dual;

    5-1) ROUND(숫자, 자리수) : 반올림, 자리수 지정 가능
        select round(-13.4441,1), round(13.4441,1), round(-13.5441,1), round(13.5441,1) from dual;

    5-2) 정수 첫째자리 버림
        select round(-144.4441,-1), round(144.4441,-1), round(-145.5441,-1), round(145.5441,-1) from dual;

 6) power(숫자, 숫자) : N의 제곱승
    select power(2,3), power(3,2) from dual;
        
 7) sign(숫자) : 음수이면 -1, 양수이면 1로 나온다
    select sign(-25), sign(25), sign(-25.25), sign(25.25) from dual;
    
 8) mod(숫자, 나눌 숫자) : 결과값은 나머지로 나온다
    select mod(27,2), mod(27,3), mod(27,4), mod(27,5) from dual;

-- 고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하시오
    select custid, round(avg(saleprice),-2) from orders3 group by custid;

================================================================================

문자 함수 : 
 1. chr(아스키코드숫자) : 아스키코드 숫자를 받아서 문자로 표시
    select chr(65), chr(97), chr(48) from dual;

 2. concat('문자열', '문자열') : 두 문자의 결합
    select concat('ict', '개발원') concat from dual;

 3. initcap('문자열') : 첫글자를 대문자 나머지를 소문자로 표시
 4. lower('문자열') : 모든 글자를 소문자로 표시
 5. upper('문자열') : 모든 글자를 대문자로 표시
    select initcap('koreaNO1'), lower('koreaNO1'), upper('koreaNO1'),
    initcap('대한민국NO1'), lower('대한민국NO1'), upper('대한민국NO1')
    from dual;

 6. trim('문자열') : 양쪽 공백 제거
 7. ltrim('문자열') : 왼쪽 공백 제거
 8. rtrim('문자열') : 오른쪽 공백 제거
 9. length('문자열') : 문자열의 길이
    select trim('  oracle xe 18  ') trim, ltrim('  oracle xe 18  ') ltrim, 
    rtrim('  oracle xe 18  ') rtrim from dual;
    
    select length(trim('  oracle xe 18  ')), length(ltrim('  oracle xe 18  ')), 
    length(rtrim('  oracle xe 18  ')), length('  oracle xe 18  ')
    from dual;

 10. lpad('문자열', 자리수, '왼쪽 공백 메울 문자') : 자리가 남으면 채운다. 모자르면 자른다
 11. rpad('문자열', 자리수, '오른쪽 공백 메울 문자')
    select lpad('oracle xe 18',30,'@'), rpad('oracle xe 18',30,'@') from dual;
    select lpad('oracle xe 18',5,'@'), rpad('oracle xe 18',5,'@') from dual;

 12. substr('문자열', 시작위치, 갯수) : 1부터 시작, - 는 오른쪽 출발, 문자의 인덱스 값으로 문자 찾기
        -- 자바와 다름(.subString(시작위치, 끝위치) : 0부터 시작)
    select 
    substr('abcdefgh',2,4),     -- bcde
    substr('abcdefgh',-2,4),    -- gh
    substr('abcdefgh',-5,4)     -- defg
    from dual;

 13. replace('문자열', '변경할 문자열', '변경 문자') : 치환
    select replace('ict 대한 민국 인재개발원', '대한', '大韓') from dual;
    
 14. ascii('아스키문자') : 아스키 숫자로 나타남(chr의 반대)
    select ascii('A'), ascii('a'), ascii('0') from dual;

 15. instr('문자열', '찾는 문자열'), instr('문자열', '찾는문자열', 시작위치)
    : 문자열 안에서 찾는 문자의 위치 표시 = 1부터 시작
    select instr('770707-1077999', '0') from dual;  -- 첫번째 문자 위치값만 나온다, 중복은 무시
    select instr('770707-1077999', '0', 4) from dual;   -- 시작위치를 4부터 하면 두번째에 나오는 0의 위치값이 나온다
    select instr('770707-1077999', '0', (instr('770707-1077999', '0')+1)) from dual;    -- 자바식 두번째 위치값 구하는 방법
    select instr('770707-1077999', '0', 1,1) from dual; -- 첫번째 0의 위치값
    select instr('770707-1077999', '0', 1,2) from dual; -- 두번째 0의 위치값
    select instr('770707-1077999', '0', 1,3) from dual; -- 세번째 0의 위치값

-- 도서 제목에 야구가 포함된 도서를 농구로 변경한 후 도서목록을 출력하자 (select문이라서 원본은 안바뀜)
    select bookid, bookname, publisher, price, 
    replace(bookname, '야구', '농구') 
    from book3;

-- 굿스포츠에서 출판한 도서의 제목과 제목의 글자수를 확인 (문자열의 길이를 확인)
    select bookname, length(bookname) 
    from book3 
    where publisher='굿스포츠';

-- 고객 중에서 같은 성을 가진 사람이 몇명이나 되는지 성별 인원수를 구하시오
    select substr(name, 1, 1), count(*)
    from customer3
    group by substr(name, 1, 1);

================================================================================

날짜 / 시간 함수
 1. sysdate : 시스템상의 오늘 날짜 반환하는 인자가 없는 함수
    select sysdate, sysdate+10 from dual;   -- +10을 하게되면 날짜에 10이 추가됨
    select substr(sysdate,0,10), substr(sysdate+10,0,10) from dual;     -- 문자열 출력을 이용하여 날짜만 출력
    
 2. to_date('문자열') : 문자열 데이터를 날짜형 데이터로 변경
    select sysdate - '2024/02/01' from dual;    -- 오류 발생(숫자의 형태지만 문자열이기 때문에 오류임)
    select trunc(sysdate - to_date('2024/02/01')) from dual;
    select trunc(to_date('2024/12/31')-sysdate) from dual;

 3. to_char('날짜', '날짜형') : 날짜형 데이터를 문자형 데이터로 변경
    select to_char(to_date('2024/02/01'), 'yyyymmdd') from dual;    -- 직접 입력 데이터를 문자형을 날짜형 데이터로 변경해야 to_char 사용 가능
    select to_char(sysdate, 'yymmdd') from dual;

 4. add_months(date, 숫자) : 날짜형의 날짜에서 지정한 달 만큼 증감한다(1 = 1달 증가, -1 = 1달 감소)
    select sysdate, add_months(sysdate, 4), add_months(sysdate, -4) from dual;

 5. last_day('날짜') : 날짜형의 달에서 마지막 날 날짜형으로 반환
    select sysdate, last_day(sysdate), last_day('2023/01/01') from dual;

 6. next_day('날짜', 요일) : 해당 요일의 가장 가까운 미래의 날짜
    select sysdate, next_day(sysdate, '화요일'), next_day(sysdate, '수요일'),
    next_day(sysdate, '목요일'), next_day(sysdate, '금요일') from dual;

 7. months_between(끝날짜, 시작날짜) : 월 단위의 기간구하기
    select months_between(sysdate, '2024/01/01') from dual;
    select trunc(months_between(sysdate, '2024/01/01'),1) from dual;

-- 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오
    select orderid, orderdate, substr(orderdate+10,1,10) from orders3;

================================================================================
NULL :
 - 아직 지정되지 않은 값
 - '0', ''(빈문자), ' '(공백) 등과 다르다
 - NULL 값은 비교연산자로 비교가 불가능하다
 - NULL 값의 연산을 수행하면 결과 역시 NULL 값으로 반환

    1) is null : 조건식에서 null을 찾을 때 
    2) is not null : 조건식에서 null이 아닌 것을 찾을 때
    3) NVL(컬럼명, null 대신 들어가는 값) : 
    select * from customer3;
    
-- 고객 테이블에서 phone이 없는 고객의 정보를 출력하시오
    select * from customer3 where phone is null;
    select * from customer3 where phone is not null;
    select name, phone, nvl() from customer3;
    
    select name, phone, nvl(phone,'111-2222-3335') from customer3;

    rownum : 오라클 내부에서 생성되는 가상 컬럼, sql 조회 결과의 순번을 나타냄
    select rownum, c.*
    from (select * 
            from customer3 
            order by custid desc) c;

    select * 
    from ( select rownum r_num, a.* 
            from (select * 
                    from bbs_t 
                    order by b_idx desc) a
         )  
    where r_num between #{begin} and #{end}; 

================================================================================

뷰(view) : 가상 테이블, 실제 메모리에 존재하지 않는다
            물리적으로 저장 되어있는 테이블이 아니다
            일반적인 사용자는 뷰를 만들 수 없다
            뷰는 insert, update, delete가 목적이 아니라 select(검색)가 목적이다
            여러 테이블을 하나로 합쳐서 하나의 뷰로 생성 가능하다
            하나의 테이블을 이용해서 여러개의 뷰를 생성 가능하다
    뷰 생성) : 
        1) 같은 이름의 뷰가 존재하면 오류 발생
        create view 뷰이름
            as select문;
        2) 같은 이름의 뷰가 존재하면 해당 뷰를 삭제하고 새로 만든다(기존 데이터가 사라질 수 있기 때문에 사용안하는걸 추천)
        create or replace view 뷰이름
        as select문;
    
    뷰 삭제) : drop view 뷰이름;

-- 1. 주소에 대한민국을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오
    select * from customer3 where address like '%대한민국%';
    -- 대한민국이 포함된 데이터를 가지고 뷰 생성
    create view v_test01
    as select * from customer3 where address like '%대한민국%';
    -- 생성된 뷰 호출(일반 select문과 동일)
    select * from v_test01;

-- 2. orders3 테이블에서 고객번호를 고객이름, 도서번호를 도서명으로 수정해서 v_orders 뷰 생성
    select o.orderid, c.name, b.bookname, o.saleprice, substr(o.orderdate,1,10)
    from orders3 o, customer3 c, book3 b
    where o.custid=c.custid and o.bookid=b.bookid
    order by o.orderid asc;

    create view v_order
    as select o.orderid orderid, c.name name, b.bookname bookname, 
                o.saleprice saleprice, substr(o.orderdate,1,10) orderdate
    from orders3 o, customer3 c, book3 b
    where o.custid=c.custid and o.bookid=b.bookid
    order by o.orderid asc;
    
    select * from v_order;

-- 3. v_order 뷰를 이용해서 김연아 고객이 주문한 주문내용을 출력
    select * from v_order where name like '김연아';
    
    
-- 연습문제 --
-- 1. 판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highoders 뷰 생성
    select b.bookid 도서번호, b.bookname 도서이름, c.name 고객이름, b.publisher 출판사, o.saleprice 판매가격
    from orders3 o, customer3 c, book3 b
    where o.custid=c.custid and b.bookid=o.bookid and o.saleprice >= 20000;
    
    create view highorders
    as select b.bookid 도서번호, b.bookname 도서이름, c.name 고객이름, b.publisher 출판사, o.saleprice 판매가격
    from orders3 o, customer3 c, book3 b
    where o.custid=c.custid and b.bookid=o.bookid and o.saleprice >= 20000;

    select * from highorders;

-- 2. 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL문 작성
    select 도서이름, 고객이름 from highorders;

-- 3. highorders 뷰를 변경하고자 한다. 판매가격 속성을 삭제하는 명령 수행. 삭제 후 2번 SQL문을 다시 수행
    -- 뷰 변경은 > 뷰 삭제 후 다시 생성
    drop view highorders;
    
    create view highorders
    as select b.bookid 도서번호, b.bookname 도서이름, c.name 고객이름, b.publisher 출판사
    from orders3 o, customer3 c, book3 b
    where o.custid=c.custid and b.bookid=o.bookid and o.saleprice >= 20000;

    select 도서이름, 고객이름 from highorders;

    -- orders3 테이블에서 김연아(custid=2)가 구매한 도서들을 10,000원씩 가격 인상(원본 수정)
    -- v_order의 내용도 변경되었는지 확인
    select custid from customer3 where name like '김연아'; -- custid=2
    update orders3 set saleprice= saleprice+10000 where custid =2;
    
    select * from v_order where name like '%김연아%';
    select * from orders3 where custid=2;   -- 원본도 변경되었음(확인)

-- 인덱스 : 검색을 빠르게 하기 위해서 사용하는 기법

================================================================================

시퀀스 : 오라클에서 자동으로 고유 숫자값을 생성하며, 주로 기본키에 이용된다
    시퀀스 생성)
    create sequence 시퀀스이름(테이블이름_seq);
    increment by 증가값
    start with 시작값
    -- 주로 기본키로 사용하기 때문에 nocycle을 사용한다
    nocycle (=다시 시작하지 않는다)
    
    select * from customer3;
    
    create sequence customer3_seq
    increment by 1
    -- 원래는 스타트를 1부터 시작해도 되는데 customer3 테이블에 
    -- 5까지의 데이터가 있기 때문에 6을 사용
    start with 6
    nocycle;

    -- 시퀀스 사용 방법 : 보통 pk이가 숫자일 때 시퀀스이름.nextval 사용하면 숫자가 장동으로 부여된다
    insert into customer3(custid, name, address, phone)
    values(customer3_seq.nextval, '차두리', '대한민국 수원', '000-4000-0001');
    
    insert into customer3(custid, name, address, phone)
    values(customer3_seq.nextval, '차두리', '대한민국 수원', '000-4000-0001');

-- book3 테이블에 사용할 시퀀스를 만들어서 book3 테이블에 데이터 하나 삽입
    select * from book3;
    create sequence book3_seq
    increment by 1
    start with 11
    nocycle;
    insert into book3(bookid, bookname, publisher, price)
    values(book3_seq.nextval, 'DB 개론과 실습', '한빛아카데미', 35000);
