���� : 2�� �̻��� ���̺��� ����Ͽ� SQL�� �ۼ��ϴ� ��
    2�� �̻��� ���̺��� ��� �ϳ��� ����� ����� ���� ���� ���

    1) ���� ����(inner join) : �ܷ�Ű(fk)�� �̿��ϴ� ���
        select A���̺�.�÷���, A���̺�.�÷��� , B���̺�.�÷���, B���̺�.�÷���
        from A���̺�, B���̺�
        where A���̺�.�÷���(fk���) = B���̺�.�÷���(fk���) ;
        ** �� ���̺��� ��� ���� �÷�(�ܷ�Ű ���)�� ������ �ְ� �ش� �÷����� ���ǽ��� ���
        ** ������ ���̺��̸� ��Ī ���
        
        
-- ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�
    select *
    -- ���� �������� �ֹ��� ���� �����Ͱ� ���´�
    -- orders3�� �տ� ������ �ش� �ֹ��� � ���� �ߴ��� ��� ǥ�� ����
    from customer3, orders3     
    where customer3.custid=orders3.custid ;
    
-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻�
    select c.name, o.saleprice
    from customer3 c, orders3 o
    where c.custid=o.custid ;
    
-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�
    select c.name, count(*), sum(o.saleprice)
    from customer3 c, orders3 o
    where c.custid=o.custid
    group by c.name
    -- �̸������� ����
    order by c.name;
    
-- ���� �̸�(custid)�� ���� �ֹ��� ������ �̸�(bookid)�� ���Ͻÿ�
    -- customer3�� book3�� ���� ���谡 ���� ������ orders3��� ���̺��� �̿���
    select c.name, b.bookname
    from customer3 c, orders3 o, book3 b
    where c.custid=o.custid and o.bookid=b.bookid ;
    
    -- �ǸŰ� ����
    select c.name, b.bookname, o.saleprice
    from customer3 c, orders3 o, book3 b
    where c.custid=o.custid and o.bookid=b.bookid ;
    
-- ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�
    select c.name, b.bookname
    from customer3 c, orders3 o, book3 b
    where c.custid=o.custid and o.bookid=b.bookid and o.saleprice =20000;

 2. �ܺ� ���� : left join, right join
  : ����Ŭ���� LEFT JOIN�� �ƿ��� ����(�ܺ�����)���� ���� ���� ����ϴ� ��� �� �ϳ��̴�.
  LEFT OUTER JOIN�� OUTER Ű���带 �����ϰ� LEFT JOIN���� ����ϱ⵵ �Ѵ�. 
  �ƿ��� ������ ������ ���̺� �����Ͱ� ��� ���� ���̺��� �����ʹ� ��� ��µǴ� ���� ����̴�.

    ����) 
    select
    from �⺻���̺�
    left join �������̺�
    on  �⺻���̺�.�÷� = �������̺�.�÷�
    where ����
    
-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�
    select c.name, o.saleprice
    from customer3 c
    left join orders3 o
    on c.custid=o.custid ;
================================================================================

create table AAA(
    id number PRIMARY key ,
    ename VARCHAR2(50)
);
create table BBB(
    id number PRIMARY key ,
    kname VARCHAR2(50)
);

insert into AAA values(1,'AAA');
insert into AAA values(2,'BBB');
insert into AAA values(3,'CCC');

insert into BBB values(1,'��');
insert into BBB values(2,'��');
insert into BBB values(4,'��');
insert into BBB values(5,'��');
commit;

-- a���̺��� id�� �����̱� ������ b���̺��� 4,5�� id�� ������ ��µ��� ����
select * from AAA a left join BBB b on a.id=b.id ;

-- ���� b���̺� id4,5= ���� null, a���̺��� id=3�� b���̺� ���� ������ �ƿ� ��µ��� ����
select * from BBB b left join AAA a on b.id=a.id ;

-- right join (left�� �ݴ밳���̶� ���� �Ⱦ��� �׳� left��)
select * from AAA a right join BBB b on a.id=b.id ;

-- �ش� ���̺���� ��� �����ϰ� �ִ� �� (���� �÷��� �ƴϸ� null)
-- �ش�Ǵ� ��ü ���̺��� �����Ͱ� ���� �͵� ���� �� ���(null)��
select * from AAA a full join BBB b on a.id=b.id ;

-- �ش� ���̺���� ���� �÷��� ����
-- null ���� ���� �����͵鸸 ���(���蹮��??)
select * from AAA a full join BBB b on a.id=b.id    -- null���� ������ ��ü ���
where a.id is null or b.id is null;                 -- null���� ������ �����͸� ���

================================================================================

���� ���� : (����)���� �ȿ� (����)������ ����
    - ��� : 
        ������ ������ : ����� 1��. ���� ���������� �񱳿����ڸ� ���
        ������ ������ : ����� ������. in, any, all, exists ;

-- book3 ���̺��� ���� ��� ������ �̸� �˻�
    -- ���� ��� �ݾ�
    -- group by�� ������� �����Լ��� ���� ��� ����
    select max(price) from book3 b;
    -- ���� ��� �ݾ��� ���� �̸�
    select bookname from book3 b where price=35000;
    -- ���� ����¥�� �ڵ��� ���ٷ� ���� (���������� �̿��� ������ ������ ���)
    select bookname from book3 b where price =(select max(price) from book3);
    
-- ���� �����̷�(orders3)�� �ִ� ���� �̸�(customer3) �˻�
    -- �����̷��� �ִ� �� (�ߺ����ŵ� �����Ƿ� �ߺ� ������)
    select distinct custid from orders3 ;
    -- �����̷��� �ִ� ���� �̸�
    select name from customer3 where custid=1;
    select name from customer3 where custid=2;
    select name from customer3 where custid=3;
    select name from customer3 where custid=4;
    -- ���� �������� ���ٷ� ������
    select name from customer3 c where custid in (1,2,3,4);
    -- ������ ������ �ڵ��� �����̷� ���� ���ٷ� �ڵ�(���������� �̿��� ������ ������ ���)
    select name from customer3 c where custid in (select distinct custid from orders3);
    -- join�� �̿��� ���
    select distinct c.name 
    from customer3 c, orders3 o 
    where c.custid = o.custid;

-- ���ѹ̵��� ������ ����(book3)�� ������ ���� �̸�(customer3)
    -- ���ѹ̵��� ������ å
    select bookid from book3 where publisher='���ѹ̵��';   -- 3,4
    
    -- orders3 ���̺��� 3,4(bookid) �� �ֹ��� custid
    select custid from orders3 where bookid in (3,4);      -- 1
    
    -- custid=1 ����� �̸�
    select name from customer3 where custid=1;
    
    -- ���� 3�ܰ��� �ڵ��� �ѹ��� (���� ���� ���)
    select name from customer3
    where custid = (select custid 
                    from orders3 
                    where bookid in (select bookid 
                                        from book3 
                                        where publisher='���ѹ̵��'));
    
    -- ���������� �̿��� �ڵ��� join���� ����
    select distinct c.name
    from orders3 o , customer3 c, book3 b
    where o.custid=c.custid and b.bookid=o.bookid and b.publisher='�̻�̵��';

-- _���� ������ å�� ������ ���
    select bookid from book3 where bookname like '_��%';
    select distinct custid from orders3 where bookid in(1,2,3,7,8);
    select name from customer3 where custid in(1,3,4);
    
    select name from customer3 where custid in (select distinct custid from orders3 
    where bookid in(select bookid from book3 where bookname like '_��%'));

-- ��� ���� ���ݺ��� ��� �����̸�
    -- ��հ� : 14450
    select avg(price) from book3;
    select bookname from book3 where price>14450;
    
    select bookname from book3 where price> (select avg(price) from book3);

================================================================================
-- ������ union, ������ minus, ������ intersect
-- ���� : ����Ŭ�� �������� minus�� ������ SQL ǥ���� except ���
    
-- ������ �ֹ����� ���� ���� �̸� (������)
 -- ��ü ��-�ֹ��� �� = �ֹ����� ���� ��
    -- ��ü ��
    select name from customer3;
    -- �ֹ��� �� : 1,2,3,4
    select custid from orders3;
    -- ���
    select name from customer3
    minus 
    select name from customer3 where custid in (select custid from orders);
================================================================================

--��������--
-- �������� ������ ������ ���ǻ� ��
    select count(distinct publisher) as ���ǻ�
    from customer3 c, orders3 o, book3 b
    where o.custid=c.custid and o.bookid=b.bookid and c.name='������';
    
-- �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
    select b.bookname, b.price, o.saleprice, b.price-o.saleprice as ���αݾ�
    from customer3 c, orders3 o, book3 b
    where o.custid=c.custid and o.bookid=b.bookid and c.name='������';
   
-- �������� �������� ���� ������ �̸�
    select bookname from book3;
    select bookid from orders3 where custid=1;

    select bookname from book3
    minus 
    select bookname from book3 where bookid in (select bookid from orders3 where custid=1);

-- �ֹ����� ���� ���� �̸�(�μ����� ���)
    select name from customer3
    where name not in (select name from customer3 c, orders3 o where c.custid=o.custid);
    
    select name from customer3
    minus
    select name from customer3 where custid in(select distinct custid from orders3);
    
-- �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
    select sum(saleprice), avg(saleprice) from orders3;
    
-- ���� �̸��� ���� ���ž�
    select c.name, sum(saleprice)
    from customer3 c, orders3 o
    where c.custid=o.custid
    group by c.name;

-- ���� �̸��� ���� ������ ���� ���
    select c.name, b.bookname from customer3 c, orders3 o, book3 b
    where o.custid = c.custid and b.bookid = o.bookid;
    -- ���� : order by c.name asc;
    
-- ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
    select b.bookname, b.publisher, b.price, o.saleprice
    from book3 b, orders3 o
    where b.bookid=o.bookid and b.price-o.saleprice =
    (select max(b.price-o.saleprice) from book3 b, orders3 o
    where b.bookid=o.bookid);
    
-- ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
    -- ���� �Ǹ� ��վ�
    select avg(saleprice) from orders3;
    -- ���� ���� ��վ�
    select c.name, avg(o.saleprice) from customer3 c, orders3 o
    where o.custid=c.custid
    group by c.name;
   
    -- �� ���
    select c.name, avg(o.saleprice) from customer3 c, orders3 o
    where o.custid=c.custid
    group by c.name
    having avg(o.saleprice) > (select avg(saleprice) from orders3);

================================================================================
-- p.199 no.11 ���̺� �����ϰ� ����Ǯ�� �������� Ȯ��
-- �������� : ��ȭ���� 20000����, �󿵰���ȣ 1~10��, ��������� ���� �¼���ȣ�� �ι� ����X
CREATE TABLE ����2 (
    �����ȣ number,
    �����̸� VARCHAR2(50),
    ��ġ VARCHAR2(50),
    primary key(�����ȣ)
);

CREATE TABLE ��2 (
    ����ȣ number,
    �̸� VARCHAR2(50),
    �ּ� VARCHAR2(50),
    primary key(����ȣ)
);

CREATE TABLE �󿵰�2 (
    �����ȣ number ,
    �󿵰���ȣ number CHECK (�󿵰���ȣ between 1 and 10),
    ��ȭ���� VARCHAR2(50),
    ���� number CHECK (���� <= 20000),
    �¼��� number,
    primary key (�����ȣ,�󿵰���ȣ)
);

-- ���̺� ���� : ���� (reservation)
CREATE TABLE ����2 (
    �����ȣ NUMBER NOT NULL,
    �󿵰���ȣ NUMBER NOT NULL,
    ����ȣ NUMBER NOT NULL,
    �¼���ȣ NUMBER,
    ��¥ DATE,
    primary key (�����ȣ,�󿵰���ȣ,����ȣ)
);

insert into ����2(�����ȣ,�����̸�,��ġ) values(1,'�Ե�','���');
insert into ����2(�����ȣ,�����̸�,��ġ) values(2,'�ް�','����');
insert into ����2(�����ȣ,�����̸�,��ġ) values(3,'����','���');

insert into �󿵰�2(�����ȣ,�󿵰���ȣ,��ȭ����,����,�¼���) values(1,1,'����� ��ȭ',15000, 48);
insert into �󿵰�2(�����ȣ,�󿵰���ȣ,��ȭ����,����,�¼���) values(3,1,'���� ��ȭ',7500, 120);
insert into �󿵰�2(�����ȣ,�󿵰���ȣ,��ȭ����,����,�¼���) values(3,2,'��մ� ��ȭ',8000, 110);

insert into ����2(�����ȣ,�󿵰���ȣ,����ȣ,�¼���ȣ,��¥) values(3,2,3,15, '2020-09-01');
insert into ����2(�����ȣ,�󿵰���ȣ,����ȣ,�¼���ȣ,��¥) values(3,1,4,16, '2020-09-01');
insert into ����2(�����ȣ,�󿵰���ȣ,����ȣ,�¼���ȣ,��¥) values(1,1,9,48, '2020-09-01');

insert into ��2(����ȣ,�̸�,�ּ�) values(3,'ȫ�浿','����');
insert into ��2(����ȣ,�̸�,�ּ�) values(4,'��ö��','���');
insert into ��2(����ȣ,�̸�,�ּ�) values(9,'�ڿ���','����');

-- ��� ������ �̸��� ��ġ
    select * from ����2;
    
-- ��ǿ� �ִ� ����
    select * from ����2 where ��ġ='���';
    
-- ��ǿ� ��� ���� �̸��� ������������
    select �̸�, �ּ� from ��2 order by �ּ�;
    
-- ������ 8000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ����
    select �����ȣ, �󿵰���ȣ, ��ȭ���� from �󿵰�2 where ����<=8000;
    
-- ���� ��ġ�� ���� �ּҰ� ���� �� <?????����>
    select ��2.�̸�, ��2.�ּ�, ����2.�����̸�, ����2.��ġ
    from ����2, ��2, ����2
    where ����2.�����ȣ=����2.�����ȣ and ��2.����ȣ=����2.����ȣ and ��2.�ּ�=����2.��ġ;

(1) �ܼ� ����(SQL)
�� ��� ������ �̸��� ��ġ�� ���̽ÿ�.
    select * from ����2;
    
�� ����ǡ��� �ִ� ������ ���̽ÿ�.
    select * from ����2 where ��ġ like '���';
    
�� ����ǡ��� ��� ���� �̸��� ������������ ���̽ÿ�.
    select * from ��2 where �ּ� like '���' order by �̸�;
    
�� ������ 6,000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�.
    select �����ȣ, �󿵰���ȣ, ��ȭ���� from �󿵰�2 where ����<=6000;
    
�� ���� ��ġ�� ���� �ּҰ� ���� ������ ���̽ÿ�.
    select distinct ��2.* from ����2, ��2 where ����2.��ġ like ��2.�ּ�;
    
(2) ��������
�� ������ ���� �� ���ΰ�?
    select count(*) from ����2;
    
�� �󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?
    select avg(����) from �󿵰�2;
    
�� 2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?
    -- �����Ͻú��� ���� ǥ��� �ٲ� �׷��� '2020/09/01%' %�� ��
    select count(*) from ����2 where ��¥ like '2020/09/01%'; 
    
(3) �μ����ǿ� ����
�� �����ѡ� ���忡�� �󿵵� ��ȭ������ ���̽ÿ�.
    select �󿵰�2.��ȭ���� from ����2, �󿵰�2
    where ����2.�����ȣ=�󿵰�2.�����ȣ and ����2.�����̸� like '����';
    
�� �����ѡ� ���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�.
    select ��2.�̸� from ����2, ����2, ��2
    where ����2.�����ȣ=����2.�����ȣ and ��2.����ȣ=����2.����ȣ 
        and ����2.�����̸� like '����';
    
�� �����ѡ� ������ ��ü ������ ���̽ÿ�.
    select sum(����) from ����2, �󿵰�2, ����2
    where ����2.�����ȣ = �󿵰�2.�����ȣ and �󿵰�2.�����ȣ =����2.�����ȣ 
    and ����2.�󿵰���ȣ=�󿵰�2.�󿵰���ȣ and ����2.�����̸� like '����';

(4) �׷�����
�� ���庰 �󿵰�  ���� ���̽ÿ�.
    select �����ȣ, count(*) from �󿵰�2 group by �����ȣ;
    
�� ����ǡ��� �ִ� ������ �󿵰��� ���̽ÿ�.
    select * from ����2, �󿵰�2
    where ����2.�����ȣ = �󿵰�2.�����ȣ and ����2.��ġ like '���';
    
�� 2020�� 9�� 1�Ͽ� ���庰 ��� ���� ���� ���� ���̽ÿ�.
    select �����ȣ, count(*) from ����2 
    where ��¥ like '2020/09/01%' 
    group by �����ȣ;
    
-- �� 2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�.
