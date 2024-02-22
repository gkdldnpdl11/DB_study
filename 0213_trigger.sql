트리거 : 자동 실행 기능
        호출해서 사용되는 것이 아님
        특정 이벤트가 발생하면 자동으로 실행됨
        특정 이벤트란 insert, update, delete 가 있다 (select 만 하는 것은 view 가 있다)
        자동 실행 예는 before, after 중 하나를 사용한다

    형식) create trigger 이름 before | after
         트리거 이벤트 on 타겟테이블이름
         for each row
         [when 조건절]
         begin
            내용
         end;
         
         ** for each row : 영향을 받는 각 행에 대해서 트리거를 실행 시킬때 사용
         주의) insert 의 경우 입력되는 데이터를 :new 에 저장된다
              delete 의 경우 삭제되는 데이터를 :old 에 저장된다
              update 의 경우 변경 전 :old , 변경 후 :new 에 저장된다
              begin ~ end; 벗어나면 old, new 로 사용된다
              begin~end 사이에서 사용하면 앞에 :(콜론)이 붙고 사이에서 벗어나면 그냥 사용함

    select * from customer3;

set serveroutput on;

-- customer3 테이블에 insert를 했을 때 XXX님 삽입 성공 이라는 글자 출력
    create trigger trigger_test01 after     -- 트리거의 이벤트가 성공한 이후에 라는 뜻
    insert on customer3     -- customer3 테이블에 insert를 하면 트리거 발생
    for each row
    begin
        dbms_output.put_line(:new.name||'님 삽입 성공');
    end;

-- 트리거 실행
    insert into customer3(custid, name, address, phone)
    values(customer3_seq.nextval, '이강인', '파리 생제르망', '000-2000-0002');

    삭제 : drop trigger 트리거이름;
    활성화 : alter trigger 트리거이름 enable;
    비활성화 : alter trigger 트리거이름 disable;
    
    drop trigger trigger_test01;

-- customer3 테이블에 insert가 성공하면 삽입한 내용을 customer2 테이블에도 삽입
    create trigger trigger_test02 after
    insert on customer3
    for each row
    begin
        insert into customer2(custid, name, address, phone)
        values(:new.custid, :new.name, :new.address, :new.phone);
        dbms_output.put_line('customer2 테이블에도 삽입되었습니다');
    end;

-- 트리거 실행
    insert into customer3(custid, name, address, phone)
    values(customer3_seq.nextval, '김민재', '독일 뮌헨', '000-1000-0001');

    select c1.*, c2.*
    from customer3 c1
    left join customer2 c2
    on c1.custid=c2.custid;

-- 테이블복사 (시험) 구조만복사, 전체복사 둘 중 하나 출제
    book2 테이블의 구조만 복사
    : create table cbook as select * from book3 where 1=0;
    select * from cbook;
    
-- book3 테이블에서 삭제하면 cbook 테이블에 삭제된 내용이 삽입되게 하자
    create trigger trigger_test03 after
    delete on book
    for each row
    begin
        insert into cbook(bookid, bookname, publisher, price)
        values(:old.bookid, :old.bookname, :old.publisher, :old.price);
        dbms_output.put_line('삭제된 내용이 cbook 테이블에 삽입되었습니다');
    end;
    
-- book3 테이블에서 bookid가 4인 데이터를 삭제
    delete from book where publisher='이상미디어';
    select * from cbook;
