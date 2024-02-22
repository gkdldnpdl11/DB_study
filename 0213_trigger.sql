Ʈ���� : �ڵ� ���� ���
        ȣ���ؼ� ���Ǵ� ���� �ƴ�
        Ư�� �̺�Ʈ�� �߻��ϸ� �ڵ����� �����
        Ư�� �̺�Ʈ�� insert, update, delete �� �ִ� (select �� �ϴ� ���� view �� �ִ�)
        �ڵ� ���� ���� before, after �� �ϳ��� ����Ѵ�

    ����) create trigger �̸� before | after
         Ʈ���� �̺�Ʈ on Ÿ�����̺��̸�
         for each row
         [when ������]
         begin
            ����
         end;
         
         ** for each row : ������ �޴� �� �࿡ ���ؼ� Ʈ���Ÿ� ���� ��ų�� ���
         ����) insert �� ��� �ԷµǴ� �����͸� :new �� ����ȴ�
              delete �� ��� �����Ǵ� �����͸� :old �� ����ȴ�
              update �� ��� ���� �� :old , ���� �� :new �� ����ȴ�
              begin ~ end; ����� old, new �� ���ȴ�
              begin~end ���̿��� ����ϸ� �տ� :(�ݷ�)�� �ٰ� ���̿��� ����� �׳� �����

    select * from customer3;

set serveroutput on;

-- customer3 ���̺� insert�� ���� �� XXX�� ���� ���� �̶�� ���� ���
    create trigger trigger_test01 after     -- Ʈ������ �̺�Ʈ�� ������ ���Ŀ� ��� ��
    insert on customer3     -- customer3 ���̺� insert�� �ϸ� Ʈ���� �߻�
    for each row
    begin
        dbms_output.put_line(:new.name||'�� ���� ����');
    end;

-- Ʈ���� ����
    insert into customer3(custid, name, address, phone)
    values(customer3_seq.nextval, '�̰���', '�ĸ� ��������', '000-2000-0002');

    ���� : drop trigger Ʈ�����̸�;
    Ȱ��ȭ : alter trigger Ʈ�����̸� enable;
    ��Ȱ��ȭ : alter trigger Ʈ�����̸� disable;
    
    drop trigger trigger_test01;

-- customer3 ���̺� insert�� �����ϸ� ������ ������ customer2 ���̺��� ����
    create trigger trigger_test02 after
    insert on customer3
    for each row
    begin
        insert into customer2(custid, name, address, phone)
        values(:new.custid, :new.name, :new.address, :new.phone);
        dbms_output.put_line('customer2 ���̺��� ���ԵǾ����ϴ�');
    end;

-- Ʈ���� ����
    insert into customer3(custid, name, address, phone)
    values(customer3_seq.nextval, '�����', '���� ����', '000-1000-0001');

    select c1.*, c2.*
    from customer3 c1
    left join customer2 c2
    on c1.custid=c2.custid;

-- ���̺��� (����) ����������, ��ü���� �� �� �ϳ� ����
    book2 ���̺��� ������ ����
    : create table cbook as select * from book3 where 1=0;
    select * from cbook;
    
-- book3 ���̺��� �����ϸ� cbook ���̺� ������ ������ ���Եǰ� ����
    create trigger trigger_test03 after
    delete on book
    for each row
    begin
        insert into cbook(bookid, bookname, publisher, price)
        values(:old.bookid, :old.bookname, :old.publisher, :old.price);
        dbms_output.put_line('������ ������ cbook ���̺� ���ԵǾ����ϴ�');
    end;
    
-- book3 ���̺��� bookid�� 4�� �����͸� ����
    delete from book where publisher='�̻�̵��';
    select * from cbook;
