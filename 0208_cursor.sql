Ŀ��(cursor) : ���� ��� ���̺��� �ѹ��� �ϳ��� �� �� ó���ϱ� ���ؼ� 
                ���̺��� ���� ������� ����Ű�µ� ����Ѵ�
    -- Ŀ���� ��������� �ʰ� ���� ���ν����� �Բ� ���������
 1) �Ͻ��� Ŀ�� : �ڵ����� ������ ����, �׸��� ������ ó���� �ȴ�
 2) ����� Ŀ�� : �������� �����ڿ� ���ؼ� ����, ����, ������ó���� �ȴ�
 
    - Ŀ���� ���õ� Ű���� :
        -- ����� Ŀ��
        cursor Ŀ���� is Ŀ������  => Ŀ�� ����
        open Ŀ����              => Ŀ�� ��� ����
        fetch Ŀ���� into ����    => �� �����͸� ������
        close Ŀ����             => Ŀ�� ��� ����

    rowcount : ���� ��
    isopen : �Ͻ��� �� �� �׻� true
             ����� �� �� ������ ������ �˾ƺ��� �����
    found : ����� �Ѱ� �̻��̸� true
    notfound : ����� �ϳ��� ������ true

-- ����� Ŀ�� ���(å�̸� ���)
    create procedure cursor_test
    as
        cursor cur is select bookname from book3;
        b_name book3.bookname%type;
    begin
        open cur;
        loop
            fetch cur into b_name;
            dbms_output.put_line(b_name);
            exit when cur%notfound;     -- Ŀ���� ���� ��� �����
        end loop;
        close cur;
    end;
    -- ��� Ȯ��
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
            exit when cur%notfound;     -- Ŀ���� ���� ��� �����
        end loop;
        close cur;
    end;
    -- ��� Ȯ��
    exec cursor_test2;

-- orders3 ���̺��� 20,000�� �̻��̸� 10%, 20,000�� �̸��̸� 5%�� �̿��Ͽ� ���ͱ� ó��(cursor ���)
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
            dbms_output.put_line('���ͱ� : '||res);
            exit when cur %notfound;
        end loop;
    close cur;
    end;
    
    exec cursor_test3;
