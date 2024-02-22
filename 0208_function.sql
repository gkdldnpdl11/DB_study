function (함수): 프로시저와 마찬가지로 저장 후 실행
    1) 일반 SQL 문에서는 function 을 호출 할 수 있다(프로시저와의 차이점)
    2) function 은 return 예약어를 반드시 사용해야 한다
        프로시저 : in = 입력 , out = 출력 (in, out 은 없어도 상관없음)
 형식)    function                              procedure
 -------------------------------------------------------------------------------
    create function 이름()                  create procedure 이름()
    return dateType                        as 
    as                                     begin
    begin                                   실행문;
        실행문                              end;
    end;
 실행방법) SQL 문에서 호출 할 수 있다           exec 프로시저이름(); => SQL문 호출

-- 판매된 도서에 대한 이익을 계산하는 함수(fnc_interest)
-- 가격이 30,000원 이상이면 10%, 30,000원 미만이면 5%
-- 외부에서 가격을 받는다
    create function fnc_interest(f_price in orders3.saleprice%type)
    return number   -- number는 변수가 아니라 반환하는 변수의 "자료형"
    as
        myprice number;     -- 결과를 저장 받아서 반환하는 변수
    begin
        if(f_price>=30000) then myprice := f_price*0.1 ;
        else myprice := f_price*0.05;
        end if;
        return myprice;     -- 변수의 값을 리턴
    end;
    -- 실행 방법(일반 SQL문에서 호출 가능함)
    select o.*, fnc_interest(o.saleprice) as 순이익 from orders3 o;
    -- 결과 확인
    select * from orders3;
    
-- 날짜를 받아서 날짜형식을 변경하는 함수 (fnc_orderdate)
    -- ex) 년월일요일
    create function fnc_orderdate(f_date in orders3.orderdate%type)
    return varchar2
    as
        v_date varchar2(50);
    begin
        v_date := to_char(f_date, 'yyyy"년" mm"월" dd"일" day');
        return v_date;
    end;
    -- 결과 확인
    select o.*, fnc_orderdate(o.orderdate) from orders3 o;
