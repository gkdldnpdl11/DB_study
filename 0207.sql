���� �Լ� : ��� ����� ���� ���� ����Ŭ���� �����ϴ� ���� ���̺�
���� ���� ���� �Լ� :
 1) ABS(����) : ���밪
    select abs(-75), abs(75), abs(-3.14), abs(3.14) from dual;
        
 2) CEIL(����) : �ø�, �ڸ��� ���� ����, �Ҽ��� ����(������� ������ ����)
                (�� ������ ū ���� �̵�)
    select ceil(-75.41), ceil(75.41), ceil(-75.61), ceil(75.61) from dual;
        
 3) FLOOR(����) : ����(�� ������ ���� ���� �̵�), �ڸ��� ���� ����, �Ҽ��� ����
    select floor(-75.41), floor(75.41), floor(-75.61), floor(75.61) from dual;
        
 4) trunc(����) : �Ҽ��� ���� ����
    select trunc(-75.41), trunc(75.41), trunc(-75.61), trunc(75.61) from dual;
        
    4-1) trunc(����, �ڸ���) : �Ҽ��� ���� �������� �ڸ��� ���� ����
        select trunc(-75.41,0), trunc(75.41,0), trunc(-75.61,0), trunc(75.61,0) from dual;
        
    4-2) �Ҽ��� ù°�ڸ�����
        select trunc(-75.41,1), trunc(75.41,1), trunc(-75.61,1), trunc(75.61,1) from dual;
        
    4-3) ������ ù°�ڸ� ����
        select trunc(-75.41,-1), trunc(75.41,-1), trunc(-75.61,-1), trunc(75.61,-1) from dual;
        
 5) ROUND(����) : �ݿø�
    select round(-13.4441), round(13.4441), round(-13.5441), round(13.5441) from dual;

    5-1) ROUND(����, �ڸ���) : �ݿø�, �ڸ��� ���� ����
        select round(-13.4441,1), round(13.4441,1), round(-13.5441,1), round(13.5441,1) from dual;

    5-2) ���� ù°�ڸ� ����
        select round(-144.4441,-1), round(144.4441,-1), round(-145.5441,-1), round(145.5441,-1) from dual;

 6) power(����, ����) : N�� ������
    select power(2,3), power(3,2) from dual;
        
 7) sign(����) : �����̸� -1, ����̸� 1�� ���´�
    select sign(-25), sign(25), sign(-25.25), sign(25.25) from dual;
    
 8) mod(����, ���� ����) : ������� �������� ���´�
    select mod(27,2), mod(27,3), mod(27,4), mod(27,5) from dual;

-- ���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�
    select custid, round(avg(saleprice),-2) from orders3 group by custid;

================================================================================

���� �Լ� : 
 1. chr(�ƽ�Ű�ڵ����) : �ƽ�Ű�ڵ� ���ڸ� �޾Ƽ� ���ڷ� ǥ��
    select chr(65), chr(97), chr(48) from dual;

 2. concat('���ڿ�', '���ڿ�') : �� ������ ����
    select concat('ict', '���߿�') concat from dual;

 3. initcap('���ڿ�') : ù���ڸ� �빮�� �������� �ҹ��ڷ� ǥ��
 4. lower('���ڿ�') : ��� ���ڸ� �ҹ��ڷ� ǥ��
 5. upper('���ڿ�') : ��� ���ڸ� �빮�ڷ� ǥ��
    select initcap('koreaNO1'), lower('koreaNO1'), upper('koreaNO1'),
    initcap('���ѹα�NO1'), lower('���ѹα�NO1'), upper('���ѹα�NO1')
    from dual;

 6. trim('���ڿ�') : ���� ���� ����
 7. ltrim('���ڿ�') : ���� ���� ����
 8. rtrim('���ڿ�') : ������ ���� ����
 9. length('���ڿ�') : ���ڿ��� ����
    select trim('  oracle xe 18  ') trim, ltrim('  oracle xe 18  ') ltrim, 
    rtrim('  oracle xe 18  ') rtrim from dual;
    
    select length(trim('  oracle xe 18  ')), length(ltrim('  oracle xe 18  ')), 
    length(rtrim('  oracle xe 18  ')), length('  oracle xe 18  ')
    from dual;

 10. lpad('���ڿ�', �ڸ���, '���� ���� �޿� ����') : �ڸ��� ������ ä���. ���ڸ��� �ڸ���
 11. rpad('���ڿ�', �ڸ���, '������ ���� �޿� ����')
    select lpad('oracle xe 18',30,'@'), rpad('oracle xe 18',30,'@') from dual;
    select lpad('oracle xe 18',5,'@'), rpad('oracle xe 18',5,'@') from dual;

 12. substr('���ڿ�', ������ġ, ����) : 1���� ����, - �� ������ ���, ������ �ε��� ������ ���� ã��
        -- �ڹٿ� �ٸ�(.subString(������ġ, ����ġ) : 0���� ����)
    select 
    substr('abcdefgh',2,4),     -- bcde
    substr('abcdefgh',-2,4),    -- gh
    substr('abcdefgh',-5,4)     -- defg
    from dual;

 13. replace('���ڿ�', '������ ���ڿ�', '���� ����') : ġȯ
    select replace('ict ���� �α� ���簳�߿�', '����', '����') from dual;
    
 14. ascii('�ƽ�Ű����') : �ƽ�Ű ���ڷ� ��Ÿ��(chr�� �ݴ�)
    select ascii('A'), ascii('a'), ascii('0') from dual;

 15. instr('���ڿ�', 'ã�� ���ڿ�'), instr('���ڿ�', 'ã�¹��ڿ�', ������ġ)
    : ���ڿ� �ȿ��� ã�� ������ ��ġ ǥ�� = 1���� ����
    select instr('770707-1077999', '0') from dual;  -- ù��° ���� ��ġ���� ���´�, �ߺ��� ����
    select instr('770707-1077999', '0', 4) from dual;   -- ������ġ�� 4���� �ϸ� �ι�°�� ������ 0�� ��ġ���� ���´�
    select instr('770707-1077999', '0', (instr('770707-1077999', '0')+1)) from dual;    -- �ڹٽ� �ι�° ��ġ�� ���ϴ� ���
    select instr('770707-1077999', '0', 1,1) from dual; -- ù��° 0�� ��ġ��
    select instr('770707-1077999', '0', 1,2) from dual; -- �ι�° 0�� ��ġ��
    select instr('770707-1077999', '0', 1,3) from dual; -- ����° 0�� ��ġ��

-- ���� ���� �߱��� ���Ե� ������ �󱸷� ������ �� ��������� ������� (select���̶� ������ �ȹٲ�)
    select bookid, bookname, publisher, price, 
    replace(bookname, '�߱�', '��') 
    from book3;

-- �½��������� ������ ������ ����� ������ ���ڼ��� Ȯ�� (���ڿ��� ���̸� Ȯ��)
    select bookname, length(bookname) 
    from book3 
    where publisher='�½�����';

-- �� �߿��� ���� ���� ���� ����� ����̳� �Ǵ��� ���� �ο����� ���Ͻÿ�
    select substr(name, 1, 1), count(*)
    from customer3
    group by substr(name, 1, 1);

================================================================================

��¥ / �ð� �Լ�
 1. sysdate : �ý��ۻ��� ���� ��¥ ��ȯ�ϴ� ���ڰ� ���� �Լ�
    select sysdate, sysdate+10 from dual;   -- +10�� �ϰԵǸ� ��¥�� 10�� �߰���
    select substr(sysdate,0,10), substr(sysdate+10,0,10) from dual;     -- ���ڿ� ����� �̿��Ͽ� ��¥�� ���
    
 2. to_date('���ڿ�') : ���ڿ� �����͸� ��¥�� �����ͷ� ����
    select sysdate - '2024/02/01' from dual;    -- ���� �߻�(������ �������� ���ڿ��̱� ������ ������)
    select trunc(sysdate - to_date('2024/02/01')) from dual;
    select trunc(to_date('2024/12/31')-sysdate) from dual;

 3. to_char('��¥', '��¥��') : ��¥�� �����͸� ������ �����ͷ� ����
    select to_char(to_date('2024/02/01'), 'yyyymmdd') from dual;    -- ���� �Է� �����͸� �������� ��¥�� �����ͷ� �����ؾ� to_char ��� ����
    select to_char(sysdate, 'yymmdd') from dual;

 4. add_months(date, ����) : ��¥���� ��¥���� ������ �� ��ŭ �����Ѵ�(1 = 1�� ����, -1 = 1�� ����)
    select sysdate, add_months(sysdate, 4), add_months(sysdate, -4) from dual;

 5. last_day('��¥') : ��¥���� �޿��� ������ �� ��¥������ ��ȯ
    select sysdate, last_day(sysdate), last_day('2023/01/01') from dual;

 6. next_day('��¥', ����) : �ش� ������ ���� ����� �̷��� ��¥
    select sysdate, next_day(sysdate, 'ȭ����'), next_day(sysdate, '������'),
    next_day(sysdate, '�����'), next_day(sysdate, '�ݿ���') from dual;

 7. months_between(����¥, ���۳�¥) : �� ������ �Ⱓ���ϱ�
    select months_between(sysdate, '2024/01/01') from dual;
    select trunc(months_between(sysdate, '2024/01/01'),1) from dual;

-- �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�
    select orderid, orderdate, substr(orderdate+10,1,10) from orders3;

================================================================================
NULL :
 - ���� �������� ���� ��
 - '0', ''(����), ' '(����) ��� �ٸ���
 - NULL ���� �񱳿����ڷ� �񱳰� �Ұ����ϴ�
 - NULL ���� ������ �����ϸ� ��� ���� NULL ������ ��ȯ

    1) is null : ���ǽĿ��� null�� ã�� �� 
    2) is not null : ���ǽĿ��� null�� �ƴ� ���� ã�� ��
    3) NVL(�÷���, null ��� ���� ��) : 
    select * from customer3;
    
-- �� ���̺��� phone�� ���� ���� ������ ����Ͻÿ�
    select * from customer3 where phone is null;
    select * from customer3 where phone is not null;
    select name, phone, nvl() from customer3;
    
    select name, phone, nvl(phone,'111-2222-3335') from customer3;

    rownum : ����Ŭ ���ο��� �����Ǵ� ���� �÷�, sql ��ȸ ����� ������ ��Ÿ��
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

��(view) : ���� ���̺�, ���� �޸𸮿� �������� �ʴ´�
            ���������� ���� �Ǿ��ִ� ���̺��� �ƴϴ�
            �Ϲ����� ����ڴ� �並 ���� �� ����
            ��� insert, update, delete�� ������ �ƴ϶� select(�˻�)�� �����̴�
            ���� ���̺��� �ϳ��� ���ļ� �ϳ��� ��� ���� �����ϴ�
            �ϳ��� ���̺��� �̿��ؼ� �������� �並 ���� �����ϴ�
    �� ����) : 
        1) ���� �̸��� �䰡 �����ϸ� ���� �߻�
        create view ���̸�
            as select��;
        2) ���� �̸��� �䰡 �����ϸ� �ش� �並 �����ϰ� ���� �����(���� �����Ͱ� ����� �� �ֱ� ������ �����ϴ°� ��õ)
        create or replace view ���̸�
        as select��;
    
    �� ����) : drop view ���̸�;

-- 1. �ּҿ� ���ѹα��� �����ϴ� ����� ������ �並 ����� ��ȸ�Ͻÿ�
    select * from customer3 where address like '%���ѹα�%';
    -- ���ѹα��� ���Ե� �����͸� ������ �� ����
    create view v_test01
    as select * from customer3 where address like '%���ѹα�%';
    -- ������ �� ȣ��(�Ϲ� select���� ����)
    select * from v_test01;

-- 2. orders3 ���̺��� ����ȣ�� ���̸�, ������ȣ�� ���������� �����ؼ� v_orders �� ����
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

-- 3. v_order �並 �̿��ؼ� �迬�� ���� �ֹ��� �ֹ������� ���
    select * from v_order where name like '�迬��';
    
    
-- �������� --
-- 1. �ǸŰ����� 20,000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highoders �� ����
    select b.bookid ������ȣ, b.bookname �����̸�, c.name ���̸�, b.publisher ���ǻ�, o.saleprice �ǸŰ���
    from orders3 o, customer3 c, book3 b
    where o.custid=c.custid and b.bookid=o.bookid and o.saleprice >= 20000;
    
    create view highorders
    as select b.bookid ������ȣ, b.bookname �����̸�, c.name ���̸�, b.publisher ���ǻ�, o.saleprice �ǸŰ���
    from orders3 o, customer3 c, book3 b
    where o.custid=c.custid and b.bookid=o.bookid and o.saleprice >= 20000;

    select * from highorders;

-- 2. ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL�� �ۼ�
    select �����̸�, ���̸� from highorders;

-- 3. highorders �並 �����ϰ��� �Ѵ�. �ǸŰ��� �Ӽ��� �����ϴ� ��� ����. ���� �� 2�� SQL���� �ٽ� ����
    -- �� ������ > �� ���� �� �ٽ� ����
    drop view highorders;
    
    create view highorders
    as select b.bookid ������ȣ, b.bookname �����̸�, c.name ���̸�, b.publisher ���ǻ�
    from orders3 o, customer3 c, book3 b
    where o.custid=c.custid and b.bookid=o.bookid and o.saleprice >= 20000;

    select �����̸�, ���̸� from highorders;

    -- orders3 ���̺��� �迬��(custid=2)�� ������ �������� 10,000���� ���� �λ�(���� ����)
    -- v_order�� ���뵵 ����Ǿ����� Ȯ��
    select custid from customer3 where name like '�迬��'; -- custid=2
    update orders3 set saleprice= saleprice+10000 where custid =2;
    
    select * from v_order where name like '%�迬��%';
    select * from orders3 where custid=2;   -- ������ ����Ǿ���(Ȯ��)

-- �ε��� : �˻��� ������ �ϱ� ���ؼ� ����ϴ� ���

================================================================================

������ : ����Ŭ���� �ڵ����� ���� ���ڰ��� �����ϸ�, �ַ� �⺻Ű�� �̿�ȴ�
    ������ ����)
    create sequence �������̸�(���̺��̸�_seq);
    increment by ������
    start with ���۰�
    -- �ַ� �⺻Ű�� ����ϱ� ������ nocycle�� ����Ѵ�
    nocycle (=�ٽ� �������� �ʴ´�)
    
    select * from customer3;
    
    create sequence customer3_seq
    increment by 1
    -- ������ ��ŸƮ�� 1���� �����ص� �Ǵµ� customer3 ���̺� 
    -- 5������ �����Ͱ� �ֱ� ������ 6�� ���
    start with 6
    nocycle;

    -- ������ ��� ��� : ���� pk�̰� ������ �� �������̸�.nextval ����ϸ� ���ڰ� �嵿���� �ο��ȴ�
    insert into customer3(custid, name, address, phone)
    values(customer3_seq.nextval, '���θ�', '���ѹα� ����', '000-4000-0001');
    
    insert into customer3(custid, name, address, phone)
    values(customer3_seq.nextval, '���θ�', '���ѹα� ����', '000-4000-0001');

-- book3 ���̺� ����� �������� ���� book3 ���̺� ������ �ϳ� ����
    select * from book3;
    create sequence book3_seq
    increment by 1
    start with 11
    nocycle;
    insert into book3(bookid, bookname, publisher, price)
    values(book3_seq.nextval, 'DB ���а� �ǽ�', '�Ѻ���ī����', 35000);
