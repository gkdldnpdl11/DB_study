PL/SQL : 오라클에서 지원하는 프로그래밍 언어의 특성을 수용한 SQL의 확장
        SQL의 쿼리문 + 제어문(if, for, loop)를 사용
        절차적 프로그래밍이 가능하게 한 오라클 SQL 전용 언어이다

 1. 프로시저 : 일련의 쿼리를 마치 하나의 함수처럼 실행하기 위한 쿼리의 집합이다
    1) 익명 프로시저 : 저장하지 않는다. instance개념
        형식) declare
                변수선언;
             begin
                SQL문자들
             end;

-- 익명 프로시저를 활용한 제어문 연습 --
    1. int i = 0 => i int := 0
    2. System.out.println(내용) => dbms_output.put_line(내용);
       dbms_output.put_line(내용) 사용하기 위해서는 set serveroutput on; 실행해야 한다
    3. System.out.println(i+"는 i 이다") => dbms_output.put_line(i || '는 i이다');

 1) if 문
    if 조건식 
    then 명령문(SQL문);
    end if;

-- 변수 i 가 10이면 데이터를 출력
    declare
        i int := 10;
    begin
        if (i=10) then dbms_output.put_line('i는' || i || '이다');
        end if;
    end;

    declare
        i number := 10;
        hak varchar2(10) := 'A';
    begin
        if (i=10) then dbms_output.put_line('hak 은 ' || hak || ' 이다');
        end if;
    end;

    -- then : 조건이 참일때 문장을 실행하는 것, else : 거짓일때 문장을 실행
 2) if 조건식 then 명령문1(SQL문);
    else 명령문2(SQL문);
    end if;

dbms 출력하기 전에 서버 연결 : set serveroutput on;

-- 변수 i 가 홀수인지, 짝수인지 판별
    declare
        i number := 10;
    begin
        if(mod(i,2)=0) then  dbms_output.put_line(i|| ' 는 짝수이다');
        else dbms_output.put_line(i|| ' 는 홀수이다');
        end if;
    end;

    declare
        i number := 3;
        res varchar2(50) := '';
    begin
        if(mod(i,2)=0) then res :='짝수';
        else res := '홀수';
        end if;
            dbms_output.put_line(i || ' 는 ' || res || '이다');
    end;
    
 3) if 조건식1 then 명령문1;
    elsif 조건식2 then 명령문2;
    elsif 조건식3 then 명령문3;
    elsif 조건식4 then 명령문4;
    else 명령문5;
    end if;

-- 변수 i가 90 이상이면 A, 80이상이면 B, 70이상이면 C, 나머지 F
    declare
        i number := 75;
        res varchar2(50) := '';
    begin
        if(i>=90) then res := 'A';
        elsif(i>=80) then res := 'B';
        elsif(i>=70) then res := 'C';
        else res := 'F';
        end if;
            dbms_output.put_line(i|| '점은 ' || res || ' 학점입니다');
    end;

 4) 반복문(for, while, loop)
    1. for문 형식
        for 변수 in 초기값..최종값 loop
            명령문;
        end loop;

-- 1~10까지 출력 (for문 사용)
    declare
    begin
        for cnt in 1..10 loop
        dbms_output.put_line('cnt = '||cnt);
        end loop;
    end;

-- 1~10 짝수만 출력 (for문 사용)
    declare
    begin
        for i in 1..10 loop
            if(mod(i,2)=0) then dbms_output.put_line('i = ' || i);
            end if;
        end loop;
    end;

-- 1~10 짝수의 합 출력 (for문 사용)
    declare
        res number := 0;
    begin
        for i in 1..10 loop
            if(mod(i,2)=0) then res := res+i;
            end if;
        end loop;
        dbms_output.put_line('짝수의 합은 ' || res);
    end;

    2. while문 형식
    declare
        초기식;
    begin
        while 조건식 loop
            명령문;
            증감식;
        end loop;
    end;

-- 1~10까지 출력 (while 사용)
    declare
        i number := 1;
    begin
        while i<11 loop
            dbms_output.put_line(i);
            i := i+1;
        end loop;
    end;

-- 1~10 짝수만 출력 (while 사용)
    declare
        i number := 1;
    begin
        while i<11 loop
            if(mod(i,2)=0) then dbms_output.put_line('i = ' || i);
            end if;
            i := i+1;
        end loop;
    end;

-- 1~10 짝수의 합 출력 (while 사용)
    declare
        i number := 1;
        res number :=0;
    begin
        while i<11 loop
            if(mod(i,2)=0) then res := res+i;
            end if;
            i := i+1;
        end loop;
        dbms_output.put_line('res = ' || res);
    end;

    3. loop
    declare
        초기식;
    begin
        loop
        명령문;
        증감식;
        exit when 조건식 ;     -- 조건식이 참일때 탈출한다 (= 자바/ do~while)
        end loop;
    end;

-- 1~10까지 출력 (loop 사용)
    declare
        i number := 1;
    begin
        loop
        dbms_output.put_line('i = '|| i);
        i := i+1;
        exit when i>=11;
        end loop;
    end;
    
-- 1~10 짝수만 출력 (loop 사용)
    declare
        i number := 1;
    begin
        loop
            if(mod(i,2)=0) then dbms_output.put_line('i = '|| i);
            end if;
        i := i+1;
        exit when i>=11;
        end loop;
    end;

-- 1~10 짝수의 합 출력 (loop 사용)
    declare
        i number := 1;
        res number := 0;
    begin
        loop
            if(mod(i,2)=0) then res := res+i;
            end if;
        i := i+1;
        exit when i>=11;
        end loop;
        dbms_output.put_line('res = '|| res);
    end;

 5) 배열
    type 배열이름 is varray(배열크기) of 배열타입;
    ex) type arr is varray(5) of varchar2(50);
    ex) type arr is varray(5) of number;

    declare
        type name_arr is varray(5) of varchar2(50); -- 배열선언(생성)
        type avg_arr is varray(5) of number;
        /* 배열을 저장할 변수, 자료형을 배열로 지정 */
        names name_arr;     -- 생성한 배열을 저장
        avgs avg_arr;
        total number;
    begin
        names := name_arr('hong', 'park', 'kim', 'lee');
        avgs := avg_arr(85.2, 89.0, 95.8, 79.4);
        total := names.count;
        for i in 1..total loop
            dbms_output.put_line('이름 : ' || names(i) || ', 평균 : ' || avgs(i));
        end loop;
        dbms_output.put_line('총 인원 : ' || total);
    end;

================================================================================

-- 고정값이 아닌 외부 정보의 값을 받아서 변경하기 위해서 사용함
-- 외부에서 정보를 받아서 적용하는 프로시저는 자바의 메소드처럼 사용하면됨

    2) 저장 프로시저 : 저장되서 나중에 호출 가능하다
    형식) create [or replace] procedure 이름
        as | is
            변수선언;
        begin
            명령문(update, insert, delete 문 일반 SQL문과 동일. select문은 다름);
        end;

-- customer3 테이블에서 custid=2 고객의 이름을 '손흥민'로 변경 (고정값 이용)
    update customer3 set name = '손흥민' where custid=2;

    create procedure c_name01
    as 
    begin
        update customer3 set name = '손흥민' where custid=2;
    end;

    create procedure c_name02
    as 
    begin
        update customer3 set name = '손흥민' where custid=2;
    end;

    -- 프로시저 삭제 : drop procedure c_name02;
    select * from customer3;
    -- 프로시저 c_name01을 저장하였지만 실행하지 않아서 내용이 변경되지 않음

    - 프로시저 실행 : exec 프로시저이름;
    exec c_name01;

-- 외부에서 custid와 name을 받아서 customer3 테이블을 수정하는 프로시저 생성
-- 외부에서 정보를 받는것 => 인자, 매개변수 => in(생략가능, 들어오는것), out(나가는것)
-- 데이터 타입을 모를 때 => 테이블이름.컬럼명%type(해당 테이블 컬럼의 타입을 가져오는 방법)
    create procedure c_name02(v_custid in customer3.custid%type, v_name in customer3.name%type)
    as 
    begin 
        update customer3 set name = v_name where custid = v_custid ;
    end;

    exec c_name02(1, '박찬호');    -- 프로시저 실행
    select * from customer3;

-- customer3 테이블(시퀀스있음)에서 '둘리', '대한민국 방학동' , '000-2000-0001'
-- 삽입하는 프로시저 생성 (프로시저 이름 : p_cust01)
    -- 프로시저 생성
    create procedure p_cust01 as
    begin
        insert into customer3(custid, name, address, phone)
        values(customer3_seq.nextval, '둘리', '대한민국 방학동', '000-2000-0001');
    end;
    -- 프로시저 실행
    exec p_cust01;
    -- 결과 확인
    select * from customer3;
    
-- customer3 테이블(시퀀스있음)에서 외부에서 이름, 주소, 전화번호를 "받아서"
-- 삽입하는 프로시저 생성 (프로시저 이름 : p_cust02)
    -- 삽입 프로시저 생성
    create procedure p_cust02(ctm_name in customer3.name%type, 
     ctm_address in customer3.address%type, ctm_phone in customer3.phone%type) 
    as
    begin
        insert into customer3(custid, name, address, phone)
        values(customer3_seq.nextval, ctm_name, ctm_address, ctm_phone);
    end;
    -- 프로시저 실행
    exec p_cust02('손연재','대한민국 창진동','000-1111-7946');
    -- 결과 확인
    select * from customer3;

-- custid를 받아서 삭제하는 프로시저 생성 (p_cust03)
    -- 삭제 프로시저 생성
    create procedure p_cust03(ctm_custid in customer3.custid%type)
    as
    begin
        delete from customer3 where custid=ctm_custid;
    end;
    -- 프로시저 실행
    exec p_cust03(9);
    -- 결과 확인
    select * from customer3;

- begin ~ end ; 블록안에서 사용되는 select 문
    select 컬럼
    into 저장변수(결과값을 저장)
    from 테이블이름
    where 조건식;
        => 결과가 하나 나오고 나온 결과를 저장변수에 저장한다
        
-- book3 테이블에서 도서의 이름, 가격, 출판사의 정보를 받아서 도서의 이름과 출판사가 같으면 업데이트, 다르면 삽입(p_book01)
    create procedure p_book01(b_bookname in book3.bookname%type, 
     b_price in book3.price%type, b_publisher in book3.publisher%type)
    as 
        cnt number := 0;    -- 새로 생긴 변수에 저장함(저장변수)
    begin
        select count(*)
        into cnt    -- 저장 변수
        from book3
        where bookname=b_bookname and publisher=b_publisher;
            if(cnt=0) then 
                insert into book3(bookid, bookname, publisher, price)
                values(book3_seq.nextval, b_bookname, b_publisher, b_price);
            else 
                update book3
                set price=b_price
                where bookname=b_bookname and publisher=b_publisher;
            end if;
    end;

    exec p_book01('축구 바이블', 34000, '한빛아카데미');   -- 데이터가 없으므로 삽입
    exec p_book01('골프 바이블', 44000, '대한미디어');    -- 데이터가 있으므로 수정
    
    select * from book3;

-- book3 테이블 구조를 복사한 book4 테이블 생성
    create table book4 as select * from book3 where 1=0;

-- 복사한 book4 테이블의 시퀀스 생성
    create sequence book4_seq
    increment by 1
    start with 1
    nocycle;

-- book4의 프로시저 생성
    create procedure p_book02(b_bookid in book3.bookid%type)
    as 
        i_bookname book3.bookname%type;
        i_publisher book3.publisher%type;
        i_price book3.price%type;
        cnt number := 0;
    begin
        select count(*)
        into cnt    -- 저장 변수
        from book3
        where bookid = b_bookid;
            if(cnt=1) then
                select bookname, publisher, price
                into i_bookname, i_publisher, i_price
                from book3
                where bookid=b_bookid;
                
                delete from book3 where bookid=b_bookid;
                
                insert into book4(bookid, bookname, publisher, price)
                values(book4_seq.nextval, i_bookname, i_publisher, i_price);
            else 
                dbms_output.put_line('id가 존재하지 않습니다');
            end if;
    end;
    
-- bookid를 받아서 book3 테이블에서는 삭제하고 book4 테이블에 삽입

    exec p_book02(45);  -- bookid가 없는것은 삭제도 안되고 삽입도 안됨
    
    select * from book3;    -- bookid 4번 삭제
    select * from book4;    -- book3 테이블의 삭제된 bookid 4번의 데이터가 book4 테이블에 생성됨

-- out를 이용해서 프로시저 결과 내보내기
-- book3 테이블의 평균가격을 반환하는 프로시저
    create procedure avg_price(avg_bookprice out number)
    as
    begin
        select avg(price)
        into avg_bookprice
        from book3
        where price is not null;
    end;
    
    -- 호출안됨
    -- exec avg_price();
    
-- 익명 프로시저, 다른 프로시저 호출
    declare
        aaa number;
    begin
        -- 미리 만들어놓은 프로시저 호출
        avg_price(aaa);
        dbms_output.put_line('책값의 평균 : ' || trunc(aaa));
    end;

-- 도서이름을 입력받아서 도서이름과 가격을 출력하는 프로시저
    create procedure book_test(t_bookname in book3.bookname%type,
     a_bookname out book3.bookname%type, a_price out book3.price%type)
    as
    begin
        select bookname, price
        into a_bookname, a_price
        from book3
        where bookname=t_bookname;
    end;

    declare
        aa book3.bookname%type;
        bb book3.price%type;
    begin
        book_test('축구의 역사', aa, bb);
        dbms_output.put_line('도서 이름 : ' || aa);
        dbms_output.put_line('도서 가격 : ' || bb);
    end;

    select * from book3;
    
-- 책 이름을 입력받아서 책이름, 가격을 출력하는 프로시저 (book_test02)
    create procedure book_test02(b_name in book3.bookname%type)
    as
        p_name book3.bookname%type;
        p_price book3.price%type;
    begin
        select bookname, price
        into p_name, p_price
        from book3
        where bookname=b_name;
        
        dbms_output.put_line('책 이름 : ' || p_name);
        dbms_output.put_line('책 가격 : ' || p_price);
    end;
    
    exec book_test02('축구의 역사');
    select * from book3;
