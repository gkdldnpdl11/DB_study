PL/SQL : ����Ŭ���� �����ϴ� ���α׷��� ����� Ư���� ������ SQL�� Ȯ��
        SQL�� ������ + ���(if, for, loop)�� ���
        ������ ���α׷����� �����ϰ� �� ����Ŭ SQL ���� ����̴�

 1. ���ν��� : �Ϸ��� ������ ��ġ �ϳ��� �Լ�ó�� �����ϱ� ���� ������ �����̴�
    1) �͸� ���ν��� : �������� �ʴ´�. instance����
        ����) declare
                ��������;
             begin
                SQL���ڵ�
             end;

-- �͸� ���ν����� Ȱ���� ��� ���� --
    1. int i = 0 => i int := 0
    2. System.out.println(����) => dbms_output.put_line(����);
       dbms_output.put_line(����) ����ϱ� ���ؼ��� set serveroutput on; �����ؾ� �Ѵ�
    3. System.out.println(i+"�� i �̴�") => dbms_output.put_line(i || '�� i�̴�');

 1) if ��
    if ���ǽ� 
    then ��ɹ�(SQL��);
    end if;

-- ���� i �� 10�̸� �����͸� ���
    declare
        i int := 10;
    begin
        if (i=10) then dbms_output.put_line('i��' || i || '�̴�');
        end if;
    end;

    declare
        i number := 10;
        hak varchar2(10) := 'A';
    begin
        if (i=10) then dbms_output.put_line('hak �� ' || hak || ' �̴�');
        end if;
    end;

    -- then : ������ ���϶� ������ �����ϴ� ��, else : �����϶� ������ ����
 2) if ���ǽ� then ��ɹ�1(SQL��);
    else ��ɹ�2(SQL��);
    end if;

dbms ����ϱ� ���� ���� ���� : set serveroutput on;

-- ���� i �� Ȧ������, ¦������ �Ǻ�
    declare
        i number := 10;
    begin
        if(mod(i,2)=0) then  dbms_output.put_line(i|| ' �� ¦���̴�');
        else dbms_output.put_line(i|| ' �� Ȧ���̴�');
        end if;
    end;

    declare
        i number := 3;
        res varchar2(50) := '';
    begin
        if(mod(i,2)=0) then res :='¦��';
        else res := 'Ȧ��';
        end if;
            dbms_output.put_line(i || ' �� ' || res || '�̴�');
    end;
    
 3) if ���ǽ�1 then ��ɹ�1;
    elsif ���ǽ�2 then ��ɹ�2;
    elsif ���ǽ�3 then ��ɹ�3;
    elsif ���ǽ�4 then ��ɹ�4;
    else ��ɹ�5;
    end if;

-- ���� i�� 90 �̻��̸� A, 80�̻��̸� B, 70�̻��̸� C, ������ F
    declare
        i number := 75;
        res varchar2(50) := '';
    begin
        if(i>=90) then res := 'A';
        elsif(i>=80) then res := 'B';
        elsif(i>=70) then res := 'C';
        else res := 'F';
        end if;
            dbms_output.put_line(i|| '���� ' || res || ' �����Դϴ�');
    end;

 4) �ݺ���(for, while, loop)
    1. for�� ����
        for ���� in �ʱⰪ..������ loop
            ��ɹ�;
        end loop;

-- 1~10���� ��� (for�� ���)
    declare
    begin
        for cnt in 1..10 loop
        dbms_output.put_line('cnt = '||cnt);
        end loop;
    end;

-- 1~10 ¦���� ��� (for�� ���)
    declare
    begin
        for i in 1..10 loop
            if(mod(i,2)=0) then dbms_output.put_line('i = ' || i);
            end if;
        end loop;
    end;

-- 1~10 ¦���� �� ��� (for�� ���)
    declare
        res number := 0;
    begin
        for i in 1..10 loop
            if(mod(i,2)=0) then res := res+i;
            end if;
        end loop;
        dbms_output.put_line('¦���� ���� ' || res);
    end;

    2. while�� ����
    declare
        �ʱ��;
    begin
        while ���ǽ� loop
            ��ɹ�;
            ������;
        end loop;
    end;

-- 1~10���� ��� (while ���)
    declare
        i number := 1;
    begin
        while i<11 loop
            dbms_output.put_line(i);
            i := i+1;
        end loop;
    end;

-- 1~10 ¦���� ��� (while ���)
    declare
        i number := 1;
    begin
        while i<11 loop
            if(mod(i,2)=0) then dbms_output.put_line('i = ' || i);
            end if;
            i := i+1;
        end loop;
    end;

-- 1~10 ¦���� �� ��� (while ���)
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
        �ʱ��;
    begin
        loop
        ��ɹ�;
        ������;
        exit when ���ǽ� ;     -- ���ǽ��� ���϶� Ż���Ѵ� (= �ڹ�/ do~while)
        end loop;
    end;

-- 1~10���� ��� (loop ���)
    declare
        i number := 1;
    begin
        loop
        dbms_output.put_line('i = '|| i);
        i := i+1;
        exit when i>=11;
        end loop;
    end;
    
-- 1~10 ¦���� ��� (loop ���)
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

-- 1~10 ¦���� �� ��� (loop ���)
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

 5) �迭
    type �迭�̸� is varray(�迭ũ��) of �迭Ÿ��;
    ex) type arr is varray(5) of varchar2(50);
    ex) type arr is varray(5) of number;

    declare
        type name_arr is varray(5) of varchar2(50); -- �迭����(����)
        type avg_arr is varray(5) of number;
        /* �迭�� ������ ����, �ڷ����� �迭�� ���� */
        names name_arr;     -- ������ �迭�� ����
        avgs avg_arr;
        total number;
    begin
        names := name_arr('hong', 'park', 'kim', 'lee');
        avgs := avg_arr(85.2, 89.0, 95.8, 79.4);
        total := names.count;
        for i in 1..total loop
            dbms_output.put_line('�̸� : ' || names(i) || ', ��� : ' || avgs(i));
        end loop;
        dbms_output.put_line('�� �ο� : ' || total);
    end;

================================================================================

-- �������� �ƴ� �ܺ� ������ ���� �޾Ƽ� �����ϱ� ���ؼ� �����
-- �ܺο��� ������ �޾Ƽ� �����ϴ� ���ν����� �ڹ��� �޼ҵ�ó�� ����ϸ��

    2) ���� ���ν��� : ����Ǽ� ���߿� ȣ�� �����ϴ�
    ����) create [or replace] procedure �̸�
        as | is
            ��������;
        begin
            ��ɹ�(update, insert, delete �� �Ϲ� SQL���� ����. select���� �ٸ�);
        end;

-- customer3 ���̺��� custid=2 ���� �̸��� '�����'�� ���� (������ �̿�)
    update customer3 set name = '�����' where custid=2;

    create procedure c_name01
    as 
    begin
        update customer3 set name = '�����' where custid=2;
    end;

    create procedure c_name02
    as 
    begin
        update customer3 set name = '�����' where custid=2;
    end;

    -- ���ν��� ���� : drop procedure c_name02;
    select * from customer3;
    -- ���ν��� c_name01�� �����Ͽ����� �������� �ʾƼ� ������ ������� ����

    - ���ν��� ���� : exec ���ν����̸�;
    exec c_name01;

-- �ܺο��� custid�� name�� �޾Ƽ� customer3 ���̺��� �����ϴ� ���ν��� ����
-- �ܺο��� ������ �޴°� => ����, �Ű����� => in(��������, �����°�), out(�����°�)
-- ������ Ÿ���� �� �� => ���̺��̸�.�÷���%type(�ش� ���̺� �÷��� Ÿ���� �������� ���)
    create procedure c_name02(v_custid in customer3.custid%type, v_name in customer3.name%type)
    as 
    begin 
        update customer3 set name = v_name where custid = v_custid ;
    end;

    exec c_name02(1, '����ȣ');    -- ���ν��� ����
    select * from customer3;

-- customer3 ���̺�(����������)���� '�Ѹ�', '���ѹα� ���е�' , '000-2000-0001'
-- �����ϴ� ���ν��� ���� (���ν��� �̸� : p_cust01)
    -- ���ν��� ����
    create procedure p_cust01 as
    begin
        insert into customer3(custid, name, address, phone)
        values(customer3_seq.nextval, '�Ѹ�', '���ѹα� ���е�', '000-2000-0001');
    end;
    -- ���ν��� ����
    exec p_cust01;
    -- ��� Ȯ��
    select * from customer3;
    
-- customer3 ���̺�(����������)���� �ܺο��� �̸�, �ּ�, ��ȭ��ȣ�� "�޾Ƽ�"
-- �����ϴ� ���ν��� ���� (���ν��� �̸� : p_cust02)
    -- ���� ���ν��� ����
    create procedure p_cust02(ctm_name in customer3.name%type, 
     ctm_address in customer3.address%type, ctm_phone in customer3.phone%type) 
    as
    begin
        insert into customer3(custid, name, address, phone)
        values(customer3_seq.nextval, ctm_name, ctm_address, ctm_phone);
    end;
    -- ���ν��� ����
    exec p_cust02('�տ���','���ѹα� â����','000-1111-7946');
    -- ��� Ȯ��
    select * from customer3;

-- custid�� �޾Ƽ� �����ϴ� ���ν��� ���� (p_cust03)
    -- ���� ���ν��� ����
    create procedure p_cust03(ctm_custid in customer3.custid%type)
    as
    begin
        delete from customer3 where custid=ctm_custid;
    end;
    -- ���ν��� ����
    exec p_cust03(9);
    -- ��� Ȯ��
    select * from customer3;

- begin ~ end ; ��Ͼȿ��� ���Ǵ� select ��
    select �÷�
    into ���庯��(������� ����)
    from ���̺��̸�
    where ���ǽ�;
        => ����� �ϳ� ������ ���� ����� ���庯���� �����Ѵ�
        
-- book3 ���̺��� ������ �̸�, ����, ���ǻ��� ������ �޾Ƽ� ������ �̸��� ���ǻ簡 ������ ������Ʈ, �ٸ��� ����(p_book01)
    create procedure p_book01(b_bookname in book3.bookname%type, 
     b_price in book3.price%type, b_publisher in book3.publisher%type)
    as 
        cnt number := 0;    -- ���� ���� ������ ������(���庯��)
    begin
        select count(*)
        into cnt    -- ���� ����
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

    exec p_book01('�౸ ���̺�', 34000, '�Ѻ���ī����');   -- �����Ͱ� �����Ƿ� ����
    exec p_book01('���� ���̺�', 44000, '���ѹ̵��');    -- �����Ͱ� �����Ƿ� ����
    
    select * from book3;

-- book3 ���̺� ������ ������ book4 ���̺� ����
    create table book4 as select * from book3 where 1=0;

-- ������ book4 ���̺��� ������ ����
    create sequence book4_seq
    increment by 1
    start with 1
    nocycle;

-- book4�� ���ν��� ����
    create procedure p_book02(b_bookid in book3.bookid%type)
    as 
        i_bookname book3.bookname%type;
        i_publisher book3.publisher%type;
        i_price book3.price%type;
        cnt number := 0;
    begin
        select count(*)
        into cnt    -- ���� ����
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
                dbms_output.put_line('id�� �������� �ʽ��ϴ�');
            end if;
    end;
    
-- bookid�� �޾Ƽ� book3 ���̺����� �����ϰ� book4 ���̺� ����

    exec p_book02(45);  -- bookid�� ���°��� ������ �ȵǰ� ���Ե� �ȵ�
    
    select * from book3;    -- bookid 4�� ����
    select * from book4;    -- book3 ���̺��� ������ bookid 4���� �����Ͱ� book4 ���̺� ������

-- out�� �̿��ؼ� ���ν��� ��� ��������
-- book3 ���̺��� ��հ����� ��ȯ�ϴ� ���ν���
    create procedure avg_price(avg_bookprice out number)
    as
    begin
        select avg(price)
        into avg_bookprice
        from book3
        where price is not null;
    end;
    
    -- ȣ��ȵ�
    -- exec avg_price();
    
-- �͸� ���ν���, �ٸ� ���ν��� ȣ��
    declare
        aaa number;
    begin
        -- �̸� �������� ���ν��� ȣ��
        avg_price(aaa);
        dbms_output.put_line('å���� ��� : ' || trunc(aaa));
    end;

-- �����̸��� �Է¹޾Ƽ� �����̸��� ������ ����ϴ� ���ν���
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
        book_test('�౸�� ����', aa, bb);
        dbms_output.put_line('���� �̸� : ' || aa);
        dbms_output.put_line('���� ���� : ' || bb);
    end;

    select * from book3;
    
-- å �̸��� �Է¹޾Ƽ� å�̸�, ������ ����ϴ� ���ν��� (book_test02)
    create procedure book_test02(b_name in book3.bookname%type)
    as
        p_name book3.bookname%type;
        p_price book3.price%type;
    begin
        select bookname, price
        into p_name, p_price
        from book3
        where bookname=b_name;
        
        dbms_output.put_line('å �̸� : ' || p_name);
        dbms_output.put_line('å ���� : ' || p_price);
    end;
    
    exec book_test02('�౸�� ����');
    select * from book3;
