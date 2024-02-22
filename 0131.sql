commit : ���� ���¸� �����ͺ��̽��� �״�� �����Ѵ�

rollback : ���� ����(commit ����) > update, insert, delete ������ ��� ���� 
            > commit(���泻�� ����) or rollback(���� �� commit ���·� �ǵ��ư�) 

UPDATE : Ư�� �Ӽ� ���� �����ϴ� ��ɾ�
 �⺻���� : update ���̺��̸�
            set �Ӽ��̸�1 = ��1 [, �Ӽ��̸�2 = ��2, �Ӽ��̸�3 = ��3 ... ]
            [where ���ǽ� ] ;
            ** ���ǽĿ��� ������ ������ �ش� �÷��� ��� �����Ͱ� ����ȴ�
                ���ǽĿ����� '=' �� ���ٶ�� ���̴�
                set������ '='�� ������ �����̶�� ����
1. customer ���̺��� ����ȣ�� 5���� ���� �ּҸ� '���ѹα� �λ�'���� ����
    update customer
    set     address='���ѹα� �λ�'
    where   custid=5;
    
2. customer ���̺��� �迬�� ���� �ּҸ� '���ѹα� ����'���� ����
    update customer
    set     address ='���ѹα� ����'
    where   name='�迬��';
    
3. book ���̺��� ���ǻ簡 '���ѹ̵��'���� '�������ǻ�'�� �̸� ����
    update book
    set     publisher ='�������ǻ�'
    where   publisher ='���ѹ̵��';
    
4. customer ���̺��� �߽ż��� �ּҸ� '���ѹα� ��⵵', �ڵ�����ȣ�� '000-1111-9999'�� ����
    update customer
    set     address = '���ѹα� ��⵵', phone='000-1111-9999'
    where   name='�߽ż�';

delete : ���̺� �ִ� ���� Ʃ��(=���ڵ�or��)�� �����ϴ� ���
 �⺻ ���� : delete from ���̺��̸�
            [where ���ǽ� ] ;
            ** ������ ������ �ش� ���̺��� ��� �����Ͱ� �����ȴ�
               ���ǽĿ��� '='�� ���� ��� �ǹ���

1. customer ���̺��� ��� ������ �����ϱ�
    delete from customer;

2. ��� ������ ������ ���� Ȯ�� �� rollback
    rollback;

3. customer ���̺��� �� ��ȣ 5���� �� ����
    delete from customer
    where   custid=5;

4. ������ �� Ȯ�� �� rollback
    rollback;

--��������
1. ���ο� ���� ('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���. 
     ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���.
     --���� ������ ���� ���¿����� ���� ����--
    insert into book(bookname, publisher, price)
    values ('������ ����', '���ѹ̵��', 10000);
    
2. '�Ｚ��'���� ������ ������ �����ؾ� �Ѵ�.
    delete from book
    where publisher='�Ｚ��';

3. '�̻�̵��'���� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
    delete from book
    where publisher='�̻�̵��';
    
4. ��ü�� commit ���·� rollback
    rollback;

================================================================================
--������ �����Ҷ� �⺻Ű(pk)�� �ܷ�Ű(fk)�� �����ϴ°� ���� (���� ��ȣ�� ����)
--���̺� ������ �� �ܷ�Ű �����ϴ� ���
--CONSTRAINT fk�� FOREIGN key(�÷���) REFERENCES pk�� ��ġ�� ���̺��(�÷���);
--�ܷ�Ű�� �����ϴ� ���� �⺻Ű�� �ؾ��� (�ܷ�Ű�� ���� ���̺� �� insert���� ��������)

--�θ����̺� ���� ����
create table customer2(
    custid      number not null primary key,
    name        varchar2(50),
    address     varchar2(50),
    phone       varchar2(50)
);

insert into customer2(custid, name, address, phone)
values(1, '������', '���� ��ü����', '000-5000-0001');
insert into customer2(custid, name, address, phone)
values(2, '�迬��', '���ѹα� ����', '000-6000-0001');
insert into customer2(custid, name, address, phone)
values(3, '��̶�', '���ѹα� ������', '000-7000-0001');
insert into customer2(custid, name, address, phone)
values(4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
insert into customer2(custid, name, address, phone)
values(5, '�ڼ���', '���ѹα� ����', null);

--�θ����̺� ���� ����
create table book2(
    bookid      number not null primary key,
    bookname    varchar2(50),
    publisher   varchar2(50),
    price       number
);

insert into book2(bookid, bookname, publisher, price)
values(1, '�౸�� ����', '�½�����', 7000);
insert into book2(bookid, bookname, publisher, price)
values(2, '�౸�ƴ� ����', '������', 13000);
insert into book2(bookid, bookname, publisher, price)
values(3, '�౸�� ����', '���ѹ̵��', 22000);
insert into book2(bookid, bookname, publisher, price)
values(4, '���� ���̺�', '���ѹ̵��', 35000);
insert into book2(bookid, bookname, publisher, price)
values(5, '�ǰ� ����', '�½�����', 8000);
insert into book2(bookid, bookname, publisher, price)
values(6, '���� �ܰ躰���', '�½�����', 6000);
insert into book2(bookid, bookname, publisher, price)
values(7, '�߱��� �߾�', '�̻�̵��', 20000);
insert into book2(bookid, bookname, publisher, price)
values(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
insert into book2(bookid, bookname, publisher, price)
values(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
insert into book2(bookid, bookname, publisher, price)
values(10, 'Olympic Champions', 'Pearson', 13000);

-- �ڽ����̺��� �ܷ�Ű�� �����Ͽ� �θ����̺��� ������ �����ޱ� ������ ���� ���߿� ����
-- 2���� �θ����̺��� ���� �ڽ����̺�
create table orders2(
    orderid     number not null primary key,
    custid      number,
    bookid      number,
    saleprice   number,
    orderdate   date,
    constraint fk_custid foreign key (custid) references customer2(custid),
    constraint fk_bookid foreign key (bookid) references book2(bookid)
);

-- �ܷ�Ű�� �ִ� ���̺��̱� ������ insert�� �������� �����ؾ��Ѵ� 
-- �����߻� ������ �θ����̺� ���� ������
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(1,1,1,6000,'2020/07/01');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(2,1,3,21000,'2020/07/03');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(3,2,5,8000,'2020/07/03');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(4,3,6,6000,'2020/07/04');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(5,4,7,20000,'2020/07/05');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(6,1,2,12000,'2020/07/07');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(7,4,8,13000,'2020/07/07');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(8,3,10,12000,'2020/07/08');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(9,2,10,7000,'2020/07/09');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(10,3,8,13000,'2020/07/10');
================================================================================

1. ���ο� ���� ('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���. 
     ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���.
     -- custid�� ���������� not null primary key
     -- �Ʒ� ���ô� �⺻Ű�� �������� �ʾ����Ƿ� ���� �߻�
    insert into book2(bookname, publisher, price)
    values ('������ ����', '���ѹ̵��', 10000);

* �ܷ�Ű ���� �� ����(���Ἲ ���� ���� �����ؾ���)
 ** �ڽ����̺��� ������� ���� ����
 ** �θ����̺��� ������� ������ �� ����(���� ��ȣ�� ����)
 ** �ڽ����̺��� �������� ������ �θ����̺����� ���� �����ϴ�


2. '�Ｚ��'���� ������ ������ �����ؾ� �Ѵ�.
    -- orders2 ���̺� �ִ� bookid �߿� �Ｚ���� �����ϴ� �����Ͱ� �����Ƿ� ���� ����
    delete from book2
    where publisher='�Ｚ��';

3. '�̻�̵��'���� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
    -- orders2 ���̺� �ִ� bookid �߿� �̻�̵� �����ϴ� �����Ͱ� �����Ƿ� ���� �Ұ���
    -- ���� ���Ἲ �������� ���� �߻� (�ڽķ��ڵ尡 �ִ� ��쿡 �ش���)
    delete from book2
    where publisher='�̻�̵��';

--�θ����̺��� ������� ������ ����������, �ڽ����̺��� �θ����̺� ���� �����͸� ������ �� ����
 * �ܷ�Ű ���� �� ���� (���Ἲ ���� ���� �����ؾ���)
  ** �ڽ����̺� (�ܷ�Ű�� ������ �ִ� ���̺�)���� ������ ��
        �����ϴ� �θ����̺��� �÷� ������ �߿��� �����ؾ� �Ѵ�
     ���� �����͸� �����ϸ� ���� �߻�

4. orders2 ���̺� ������ ����
    1) orderid=11�� ������(custid=1)�� '���� ���̺�'(bookid=4) å�� 35000���� �ְ� 
        2020-07-12�� ���� (���� ����)
    insert into orders2(orderid, custid, bookid, saleprice, orderdate)
    values(11,1,4,35000,'2020-07-12');

    2) orderid=12�� �ڼ���(custid=5)�� '�౸ ���̺�'(bookid=11) å�� 35000���� �ְ� 
        2020-07-12�� ���� (���� �Ұ���)
            -- ���Ἲ �������� ���� (�θ�Ű ����)
            -- �θ�Ű orderid�� 12�� �����Ͱ� ���� ������ ���� �߻�
    insert into orders2(orderid, custid, bookid, saleprice, orderdate)
    values(12,5,11,25000,'2020-07-12');
================================================================================

create table book3(
    bookid      number,
    bookname    varchar2(50),
    publisher   varchar2(50),
    price       number
);

insert into book3(bookid, bookname, publisher, price)
values(1, '�౸�� ����', '�½�����', 7000);
insert into book3(bookid, bookname, publisher, price)
values(2, '�౸�ƴ� ����', '������', 13000);
insert into book3(bookid, bookname, publisher, price)
values(3, '�౸�� ����', '���ѹ̵��', 22000);
insert into book3(bookid, bookname, publisher, price)
values(4, '���� ���̺�', '���ѹ̵��', 35000);
insert into book3(bookid, bookname, publisher, price)
values(5, '�ǰ� ����', '�½�����', 8000);
insert into book3(bookid, bookname, publisher, price)
values(6, '���� �ܰ躰���', '�½�����', 6000);
insert into book3(bookid, bookname, publisher, price)
values(7, '�߱��� �߾�', '�̻�̵��', 20000);
insert into book3(bookid, bookname, publisher, price)
values(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
insert into book3(bookid, bookname, publisher, price)
values(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
insert into book3(bookid, bookname, publisher, price)
values(10, 'Olympic Champions', 'Pearson', 13000);

create table customer3(
    custid      number,
    name        varchar2(50),
    address     varchar2(50),
    phone       varchar2(50)
);

insert into customer3(custid, name, address, phone)
values(1, '������', '���� ��ü����', '000-5000-0001');
insert into customer3(custid, name, address, phone)
values(2, '�迬��', '���ѹα� ����', '000-6000-0001');
insert into customer3(custid, name, address, phone)
values(3, '��̶�', '���ѹα� ������', '000-7000-0001');
insert into customer3(custid, name, address, phone)
values(4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
insert into customer3(custid, name, address, phone)
values(5, '�ڼ���', '���ѹα� ����', null);

create table orders3(
    orderid     number,
    custid      number,
    bookid      number,
    saleprice   number,
    orderdate   date
);

insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(1,1,1,6000,'2020/07/01');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(2,1,3,21000,'2020/07/03');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(3,2,5,8000,'2020/07/03');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(4,3,6,6000,'2020/07/04');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(5,4,7,20000,'2020/07/05');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(6,1,2,12000,'2020/07/07');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(7,4,8,13000,'2020/07/07');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(8,3,10,12000,'2020/07/08');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(9,2,10,7000,'2020/07/09');
insert into orders3(orderid, custid, bookid, saleprice, orderdate)
values(10,3,8,13000,'2020/07/10');


���̺��� ����� ���� ���¿��� �⺻Ű�� �ܷ�Ű ����
    : alter table ���̺��̸� add 

-- �⺻�� ���̺���� �����Ϳ� �Բ� ���� (���� �״�� ������ �ֱ� ����)
    create table book3 as select * from book;
    create table customer3 as select * from customer;
    create table orders3 as select * from orders;

-- �⺻Ű ����
    --alter table ���̺��̸� add primary key (�÷���);
    alter table book3 add primary key (bookid);
    alter table customer3 add primary key (custid);
    alter table orders3 add primary key (orderid);

-- �ܷ�Ű ����
    --alter table ���̺��̸� add constraint fk_�̸� foreign key (�÷���) references pk�� ���� �θ����̺�(�÷���);
    alter table orders3 add constraint fk_custid3 foreign key (custid) references customer3(custid);
    alter table orders3 add constraint fk_bookid3 foreign key (bookid) references book3(bookid);

-- �⺻Ű �����ϱ�, �ܷ�Ű �����ϱ� ( ���� : ~02/02 )
    alter table ���̺��(orders3) drop ��������(primary key) ;
    alter table ���̺��(orders3) drop constraint �ܷ�Ű��(fk_bookid3) ;
