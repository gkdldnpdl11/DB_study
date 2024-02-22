select : �˻� (����� ���̺�� ���´�)
    ** insert, update, delete �� ����� ���ڷ� ���´�
 ����) select [ * | distinct ] �÷���(��), ...
        from ���̺��̸�(��)
        [ where ���ǽ� ]
        [ group by �÷���(��) ]
        [ having ���ǽ� ]
        [ order by �Ӽ��̸� [ASC=���� | DESC ]
        ** ASC = ���� = ��������, DESC = ��������

-- ��� ������ �̸��� ������ �˻� (book ���̺�)
    select bookname, price
    from book3;
    
-- ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻� (book ���̺�)
    select bookid, bookname, publisher, price
    from book3;
    -- �� �� ���� ����. ���̺� ���� ��� ������ �˻��� ���� * ����ϸ� ��
    select *
    from book3;
    
-- ���� ���̺� �ִ� ��� ���ǻ縦 �˻� (book ���̺�)
    select publisher
    from book3;
    
-- �˻� ������� �ߺ��� �����ϰ� ������ distinct Ű���� ��� (book ���̺�)
    -- select distinct �÷��� from ���̺��̸�;
    select distinct publisher
    from book3;
    
    -- ���� ���� : �ٸ� �÷��� �Բ� ����ϸ� �ȵ�
    -- publisher�� bookname�� ���ÿ� ����ϸ� bookname�� ��� ������ ���� �ߺ����Ű� Ǯ��
        -- �׷��� distinct�� ȥ�� ����ؾߵ�(���� ����ϴ� �ǹ̰�����=�ߺ��� Ǯ��)
    select distinct publisher, bookname
    from book3;

** ��Ī ��� : ��Ī�� ����ص� ���� �Ӽ����� ������� �ʴ´�
    select �÷��� as ��Ī , select �÷��� ��Ī
    
    -- ��� ������ �̸��� ������ �˻� (book ���̺�)
    select bookname as ������, price as ����
    from book3;

    -- book3 ���̺��� bookname, price �˻�, customer3 ���̺��� name, address �˻�
    select bookname, price, name, address
    from book3, customer3;

    -- select ���̺�.�÷��� , ���̺�.�÷���
    select book3.bookname, book3.price, customer3.name, customer3.address
    from book3, customer3;
    
    -- ���� �ڵ带 ��Ī�� ����ؼ� ����
    -- ���̺��� ��Ī ����� ���� as�� ���̸� ���� �߻�
    select b.bookname, b.price, c.name, c.address
    from book3 b, customer3 c;

    -- ���� �Ӽ�, ��¥ �Ӽ��� ��� ����
    -- book3 ���̺��� price�� 10% ���� ����
    select bookid, bookname, publisher, price, price*0.9 as ���ΰ���
    from book3;

    -- order ���̺� orderdate �� 10���� �߰��� ��¥
    select custid, bookid, saleprice, orderdate, orderdate+10 �ݳ���
    from orders3;
 ===============================================================================
 1. where ������ : �÷��� ������
    : �񱳿��� : =(����) , <>, != (�ٸ���), >=, <=, >, <
    
    -- ������ 20,000�� �̸��� ������ �˻� (book3 ���̺�)
    select * from book3 where price < 20000;
    
    -- ������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�(book���̺�)
    select * from book3 where price >=10000 and price <=20000;
    select * from book3 where price between 10000 and 20000;
    
    -- ���ǻ簡 ���½������� Ȥ�� �����ѹ̵��� ������ �˻��Ͻÿ�(book���̺�)
    select * from book3 where publisher = '�½�����' or publisher='���ѹ̵��';
    select * from book3 where publisher in ('�½�����','���ѹ̵��');
    
    -- ���ǻ簡 ���½������� Ȥ�� �����ѹ̵��� �ƴ� ������ �˻��Ͻÿ�(book���̺�)
    select * from book3 where publisher != '�½�����' and publisher != '���ѹ̵��';
    select * from book3 where publisher not in ('�½�����','���ѹ̵��');
================================================================================
2. ���� : ���ϴ� �����Ͱ� ��Ȯ���� ������ ��� like
    like % = �������� ���� ��� ��� , _ = �� ���� ��� ���

    -- '�౸�� ����'�� �Ⱓ�� ���ǻ� �˻�
    select publisher from book3 where bookname = '�౸�� ����';
    select publisher from book3 where bookname like '�౸�� ����';
    
    -- ���� �̸��� '�౸'�� ���Ե� ���ǻ� �˻�
    select bookname, publisher from book3 where bookname = '�౸';
    select bookname, publisher from book3 where bookname like '%�౸%';   -- �౸�� �����ϴ�
    select bookname, publisher from book3 where bookname like '�߱�%';    -- �߱��� �����ϴ�
    select bookname, publisher from book3 where bookname like '%����';    -- ���ڷ� ������
    
    -- ���� �̸��� ���� �� ��° ��ġ�� '��'��� ���ڿ��� ���� ������ �˻�
    select bookname, publisher from book3 where bookname like '_��';     -- x�� �α��ڷ� ������ å�̸��� ����
    select bookname, publisher from book3 where bookname like '_��%';    -- x���� ���Ե� 
    
    -- �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻�
    select * from book3 where bookname like '%�౸%' and price >=20000;
    
    -- 1,3,5,7,9�� �ڷ��� ��¥ ���� = 2020/08/15�� ���� (orders3 ���̺�)
    update orders3 set orderdate = '2020/08/15' where orderid in (1,3,5,7,9);
    
    -- orders3 ���̺��� 7���� �ڷḸ �˻�
    select * from orders3 where orderdate like '%7%';       -- �� ���� ��¥���� 7�� ���ԵǾ������� ���� �˻���
    select * from orders3 where orderdate like '2020/07%';
    
    -- orders3 ���̺��� orderdate�� 2020���� ��� ���� ����
    select * from orders3 where orderdate >= '2020/01/01' and orderdate <= '2020/12/31';
    select * from orders3 where orderdate between '2020/01/01' and '2020/12/31';
    select * from orders3 where orderdate like '2020%';

================================================================================
3. ���� : �׻� �� ������ �ٿ� �־�� ��
    [order by �÷��� [ASC=���� | DESC]]
    ** ASC = ���� = �������� ���� , DESC = �������� ����
    
    -- book3 ���̺��� �̸������� �˻� (��������)
    select * from book3 order by bookname;
    
    -- book3 ���̺��� ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻�
    select * from book3 order by price, bookname;
    
    -- ������ ������ ������������ �˻��ϰ�, ������ ������ ���ǻ��� ������������ �˻�
    select * from book3 order by price desc, publisher;
================================================================================
4. �����Լ� : sum(�÷���), avg(�÷���), max(�÷���), min(�÷���), count(�÷���), count(*)

-- ���� �ֹ��� ������ �� �Ǹž� (orders3 ���̺�)
    select sum(saleprice) as �Ǹž� from orders3;
    select sum(saleprice) from orders3;

-- 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž� (orders3 ���̺�)
    select sum(saleprice) as �Ǹž� from orders3 where custid=2;
    
-- ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ� (orders3 ���̺�)
    select sum(saleprice) as ��_�Ǹž�, avg(saleprice) as ��հ�, min(saleprice) as �ּҰ�, max(saleprice) as �ְ�
    from orders3;
    
-- ���� �Ǹ� �Ǽ� (orders3 ���̺�)
    select count(*) as �ǸŰǼ� from orders3;
    
-- 2�� �迬�� ���� �ֹ��� ���� �Ǹ� �Ǽ� (orders3 ���̺�)
    select count(*) as �ǸŰǼ� from orders3 where custid=2;
================================================================================
5. group by : �Ӽ����� ���� �� ���� �׷��� �����
                �����Լ��� ����� �� �ִ�
    select group by�� ����� �Ӽ�, �����Լ���
    from ���̺��̸�
    [where ���ǽ�]
    [group by ���� �Ӽ���(��)]
    [having ���ǽ� = group by�� ����� �Ӽ�, �����Լ���];

-- ������ �ֹ��� ������ �� ������ �� �Ǹž�
    select custid as ����ȣ, count(*) as ��_����, sum(saleprice) as ��_�Ǹž�
    from orders3 
    group by custid;
    
-- ���� �ֹ� ������ �� ����, �� 3�� �̻� ���� �� ���
    select custid as ����ȣ, count(*) as ��_����
    from orders3 
    group by custid 
    having count(*)>=3;
    
-- ������ 8,000�� �̻��� ������ ������ ��. ���� �ֹ� ������ �� ����, �� 2�� �̻� ���� �� ���
    select custid as ����ȣ, count(*)
    from orders3
    where saleprice>=8000
    group by custid
    having count(*)>=2;
================================================================================

* ��������

-- ������ȣ�� 1�� ������ �̸�
    select bookname from book3 where bookid=1;
    select * from book3 where bookid like 1;
    
-- ������ 20,000�� �̻��� ������ �̸�
    select * from book3 where price >= 20000;
    
-- ��� ���� �̸�, �ּ�
    select name, address from customer3;
    
-- 2020�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
    select * from orders3 where orderdate between '2020/07/04' and '2020/07/07';
    --select orderdate from orders3 where orderdate between '2020/07/04' and '2020/07/07';
    --select orderdate from orders3 where orderdate in ('2020/07/04','2020/07/07');
    
-- 2020�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ 
    select * from orders3 where orderdate not between '2020/07/04' and '2020/07/07';
    --select orderdate from orders3 where orderdate not in ('2020/07/04','2020/07/07');
    
-- ���� ���衯 ���� ���� �̸��� �ּ�
    select name, address from customer3 where name like '��%';
    
-- ���� ���衯 ���̰� �̸��� ���ơ��� ������ ���� �̸��� �ּ�
    select name, address from customer3 where name like '��%��';
    select name, address from customer3 where name like '��%' and name like '%��';
    
-- �������� �� ���ž� (�������� ����ȣ 1������ �ۼ�) orders3 ���̺�
    select sum(saleprice) as ��_���ž� from orders3 where custid=1;

-- �������� ������ ������ �� (�������� ����ȣ 1������ �ۼ�) orders3 ���̺�
    select count(*) as ����_���ż��� from orders3 where custid=1;

-- ������ �� ����
    select count(*) as �������� from book3;

-- ������ ����ϴ� ���ǻ��� �� ���� (�ߺ�����)
    select count(distinct publisher) from book3 ;

-- �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
    select sum(saleprice) as �Ѿ�, avg(saleprice) as ��հ�
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

-- �г⺰ ���Ƹ� ������ �л���, ������ ������
-- �л��� 10�� �̻� ������ ���Ƹ��� ���Ͽ� ���Ƹ��� ������ �� ������
    select club, sum(stu) as �л���, sum(proj) as ������
    from test1
    group by club;
    
================================================================================

create table nbook(
bookid  number not null primary key,
bookname    varchar2(100),
publisher   varchar2(100),
date    varchar2(100)
)

-- ����(������ȣ, ��������, ���ǻ��, ���࿬��) ���̺�
-- 2000�� ���� 10�� �̻� å ������ ���ǻ� �̸��� �ߺ����� ���
-- ������ȣ�� ���� ���̺��� �⺻Ű
    select bookid
    from nbook
    where date >=10, publisher distinct
    group by bookid;

