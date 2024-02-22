커서(cursor) : 실행 결과 테이블을 한번에 하나의 행 씩 처리하기 위해서 
                테이블의 행을 순서대로 가리키는데 사용한다
    -- 커서만 만들어지지 않고 보통 프로시저와 함께 만들어진다
 1) 암시적 커서 : 자동으로 열림과 닫힘, 그리고 데이터 처리가 된다
 2) 명시적 커서 : 수동으로 개발자에 의해서 열림, 닫힘, 데이터처리가 된다
 
    - 커서와 관련된 키워드 :
        -- 명시적 커서
        cursor 커서명 is 커서정의  => 커서 생성
        open 커서명              => 커서 사용 시작
        fetch 커서명 into 변수    => 행 데이터를 가져옴
        close 커서명             => 커서 사용 종료

    rowcount : 행의 수
    isopen : 암시적 일 때 항상 true
             명시적 일 때 열림과 닫힘을 알아보는 예약어
    found : 결과가 한개 이상이면 true
    notfound : 결과가 하나도 없으면 true

-- 명시적 커서 사용(책이름 출력)
    create procedure cursor_test
    as
        cursor cur is select bookname from book3;
        b_name book3.bookname%type;
    begin
        open cur;
        loop
            fetch cur into b_name;
            dbms_output.put_line(b_name);
            exit when cur%notfound;     -- 커서가 없는 경우 종료됨
        end loop;
        close cur;
    end;
    -- 결과 확인
    exec cursor_test;

    create procedure cursor_test2
    as
        cursor cur is select bookname, price from book3;
        b_name book3.bookname%type;
        b_price book3.price%type;
    begin
        open cur;
        loop
            fetch cur into b_name, b_price;
            dbms_output.put_line(b_name || ', ' || b_price);
            exit when cur%notfound;     -- 커서가 없는 경우 종료됨
        end loop;
        close cur;
    end;
    -- 결과 확인
    exec cursor_test2;

-- orders3 테이블에서 20,000원 이상이면 10%, 20,000원 미만이면 5%를 이용하여 이익금 처리(cursor 사용)
    create procedure cursor_test3
    as
      cursor cur is select saleprice from orders3;
      myprice orders3.saleprice%type;
      res number;
    begin
    open cur;
        loop
            fetch cur into myprice;
            if(myprice>=20000) then res := myprice*0.1;
            else res := myprice*0.05;
            end if;
            dbms_output.put_line('이익금 : '||res);
            exit when cur %notfound;
        end loop;
    close cur;
    end;
    
    exec cursor_test3;
