1. ����Ŭ��ġ
	�߰� ��й�ȣ �Է� : 1111

2. cmd���� sqlplus > 
    ������̸� : system �Է� > 
             ��� : 1111 �Է� > 
                       Ȯ�� �� ���� > 
                         exit �Է�(���� ����)

3. sqldeveloper ���������� ����ȭ�� �ٷΰ��� ����� ����

4. ���� ���ӿ��� '+' ���� �� ���� â���� �ش� ���� �Է��ϸ� ��
	name : �Է� �� �̸�
	����� �̸� : system
	��й�ȣ : 1111

	ȣ��Ʈ�̸� : localhost
	��Ʈ : 1521
	SD : xe
�߾� �ϴ��� �׽�Ʈ ���� ���� �� ���� ����

5. �ڽ��� ��� �� ������ ����� ����ϱ� (system �������� �����ؾߵ�)
 5-1. ���� ���� ��� : create user c##������ identified by ��й�ȣ;
  create user c##ictdeu identified by 1111;
 
 5-2. ���� �ο� ��� : grant connect, resource, dba to c##������ ;
  grant connect, resource, dba to c##ictdeu;

================================================================================

�����ͺ��̽�(DB) ���� : Ư�� ������ ���� ����ڰ� **�����Ͽ� ����� �� �ֵ��� **�����ؼ� 
                                 **������ **� �������� ����
                                 
�����ͺ��̽��� Ư¡ :  �ǽð� ���ټ�, �������� ��ȯ, �������� ����, ���ð���

�����ͺ��̽������ý���(DBMS) : ������ �ʿ��� �����͸� �����ͺ��̽��� �����Ͽ�
                            �����ϰ� �����ϴ� �ý���

�����ͺ��̽� �ֿ��� 
  - ���Ǳ�� : �����ͺ��̽� ������ �����ϰų� ���� �� �� �ִ�. 
  - ���۱�� : �����͸� ����, ���� ,����, �˻��ϴ� ������ �� �� �ִ�.
  - ������ : �����͸� �׻� ��Ȯ�ϰ� �����ϰ� ������ �� �ִ�.

�����ͺ��̽��� ����
 1. �ܺν�Ű�� : ���� ����� �������� �����ϰ� ǥ���ϴ� �ܰ�
               ����� ���� �ٸ� �� �־ ������ ������ �� �ִ�.
               (����ڿ��� �ʿ��� �����ͺ��̽� ����)
               ���� ��Ű�������
 2. ���佺Ű�� :  ������ü�� �������� �����ϰ� ǥ���ϴ� �ܰ�
                 �ϳ��� �����ͺ��̽������� ���� ��Ű���� �ϳ��� ����
                ** �ܺ� ��Ű���� ��� ���� ��Ű��(�ߺ� ����)
 3. ���ν�Ű�� : ���� ��ġ�� �������� �����ϰ� ǥ���ϴ� �ܰ�
               ���佺Ű���� ������ ���屸���� ������ ���� �� 

���� ������ �� : ������ �����ͺ��̽� = ���̺� ���� = ǥ ����
 - �����̼� = ���̺� 
 - �� = row = Ʃ�� = ���ڵ�
 - �� = attribute = �Ӽ�  = �ʵ�
 - ������ = �Ӽ����� ���� �� �ִ� ������ ���� , ������Ÿ��(Data Type)�� ���̸� �ǹ��Ѵ�.
 
 Ű(key) : Ʃ�õ��� �����ϰ� �����ϴ� �Ӽ� �Ǵ� �Ӽ����� ����
 - �⺻Ű(primary key = PK) : ���ϼ�(UNIQUE)�� �ּҼ�(NOTNULL)�� �����ϴ� �Ӽ� 
                                (�ֹι�ȣ, ���� ���¹�ȣ...)
                             ���̺��� �� ���� �����ϰ� �ĺ��� �� �ִ� �Ӽ� (��)
                             
 - �ܷ�Ű(foreign key = FK) : �� ���̺��� ������ �� ������ �����ϰ� ���� �����Ͽ� 
                                �ܷ�Ű ���̺� ���� �� �� �ִ� �����͸� �����ϴµ� 
                                ���Ǵ� �Ӽ�(��)
                             ��� ���̺����� �⺻Ű������  
                             �ٸ� ���̺����� �ϳ��� �÷����θ� �����ϴ� �÷��� ���Ѵ�.
���Ἲ ��������
  - ������ ���Ἲ : �����ͺ��̽��� ����� �������� �ϰ����� ��Ȯ���� ��Ű�� ���� ����
  
  - ������ ���Ἲ �������� : �����̼� ���� Ʃ�õ��� �� �Ӽ��� �����ο� ������ ������ ������ �Ѵٴ� ����
                          ������Ÿ��, ��, �⺻��, üũ���� ����Ͽ� ������ �� ����.
                          
  - ��ü ���Ἲ ���� ���� : �⺻Ű ����, �⺻Ű�� not null �̸鼭
                            �����̼ǿ� ���� �ϳ��� ���� �����ؾ� �Ѵ�.(unique) 
                        
  - ���� ���Ἲ ���� ���� : �ܷ�Ű ����
                         �ڽĸ����̼��� �ܷ�Ű�� �θ𸱷��̼��� �⺻Ű�� �������� �����ؾ� �ϸ�
                         �ڽĸ����̼��� ���� ����� �� �θ𸱷��̼��� ������ �޴´ٴ� �� 
                             
================================================================================

1. SQL (Structured Query Language) : ����ȭ�� ���Ǿ�
    : �����ͺ��̽����� �����͸� �����ϰ� �����ϴµ��� ���Ǵ� ������ ó�� ���
    1-1. ������ ���Ǿ� (DDL) : �����ͺ��̽� ��ü���� �����ϴ� ��
                            �����ͺ��̽� ��ü�� ���̺�, ��, �ε���, ������ ���� ���Ѵ�
        create : ���ο� �����ͺ��̽� ��ü ���� ( create ��ü )
        drop   : ������ �����ͺ��̽� ��ü ���� ( drop ��ü �����Ұ�ü�̸� )
        alter  : ������ �����ͺ��̽� ��ü ������ �� �� ���
        
    1-2. ������ ���۾� (DML) : ������ ��ü�� ����, ����, ����, �˻� �� �� ���
        insert : ������(��=Ʃ��=���ڵ�) ����(����)
        delete : ������(��=Ʃ��=���ڵ�) ����
        update : ������(��=Ʃ��=���ڵ�) ����(����)
        select : ������(��=Ʃ��=���ڵ�) �˻�
    
    1-3. ������ �����(DCL) : �����ͺ��̽��� �����ϰ� ��ü���� ����ϵ��� 
                            ������ �ο�, �����ϴ� ��ɾ�
        grant : ���� �ο�
        revoke : ���� ����
        **commit : ���� �����ͺ��̽� ���¸� ����
        **rollback : ���� ���� ���� ����� ������ ����ϰ� ���� ���·� �ǵ����� ��
        �������(commit)���� - 1 ���� - 2 ���� - rollback �� �ϸ� ������·� �ǵ��ư���
================================================================================
1. ����Ŭ ������ Ÿ��
 1-1. ���ڿ� : ���� ��/�ҹ���, ���� 1byte / ��� ������ ������ ���� 3byte
    varchar2(ũ��) : ��������, 4000����Ʈ���� ����
    char(ũ��) : ��������, 2000����Ʈ���� ����
    clob(ũ��) : ��뷮 �׽�Ʈ, �ִ� 4GB
    long(ũ��) : 2GB

 1-2. ���� : 
    number() : 38�ڸ����� �ε��Ҽ���
    number(4) : ���� 4�ڸ�
    number(4, 2) : ��ü 4�ڸ����� �Ҽ��� 2�ڸ� (�ִ� 99.99��)
    
 1-3. ��¥ : ���ڿ��� ��¥�� ������ ���� �� Ȭ����ǥ('') ���
        ���ڿ� ��¥�� ���� �����ϴ� (+, - )
    date : ������ ������ ��ȿ�� ��¥-�ð� ������ �����ϴµ��� ����Ѵ�
        date('2024/01/30')
    timestamp : �⺻ ��¥���� Ȯ���� �ڷ���
    ** sysdate : ���� �ý��� ��¥�� ���Ѵ�
    
 1-4. �׷���, �̹���, �������� �����ʹ� BLOB(���� ��뷮 ��ü)�� �ַ� ����Ѵ�(���� ������)

2. ����Ŭ ���̺� ������ ��������
 2-1. not null : null�� ������� �ʴ´�. �ش� �Ӽ��� �����͸� ������ �� �ݵ�� ä���� �Ѵ�
 2-2. unique : �ش� �Ӽ�(�÷�) �Ǵ� �Ӽ� ���� ���� �����ϵ��� �Ѵ�
 2-3. primary key : �⺻ Ű (�� ���� �����ϰ� �ĺ��� �� �ֵ��� �ϴ� Ű)
 2-4. default : �⺻���� �����ϴ� �����
            ex) ������ number default 0 > ���� �Է����� ������ 0 ���� ä������
 2-5. check : Ư�� �Ӽ��� ���� ���������� �����ϴ� ��(���� ����)
            ex) ���� number(3) check>=19  > ���ڰ� 19�̻��� ���ڸ� �޴´�
            ��� number check(��� >=0 AND ��� <=1000) > ��� ���ڸ� 0~1000
                    
 
3. create table ����
 3-1. �⺻Ű �ϳ��� ���� ����
    create table ���̺��̸�(
        �÷��� ������Ÿ�� not null primary key,
        �÷��� ������Ÿ�� [��������] ,
        �÷��� ������Ÿ�� [��������]
    );

 3-2. �⺻Ű ������ ���� ����
    create table ���̺��̸�(
        �÷��� ������Ÿ�� [��������] ,
        �÷��� ������Ÿ�� [��������] ,
        �÷��� ������Ÿ�� [��������] ,
        primary key(�Ӽ��̸�=���ο� �̸��� �ƴ϶� ���� �����ϴ� �Ӽ��̸� �� �ϳ�or������)
    );
    
================================================================================
����)
create table newbook(
    bookid number not null primary key,
    bookname varchar2(50),
    publisher varchar2(50),
    price number
    );

create table newbook2(
    bookid number,
    bookname varchar2(50),
    publisher varchar2(50),
    price number,
    primary key (bookid)
    );

--�����߻� key2��
create table newbook3(
    idx    number not null primary key,
    bookid number not null primary key,
    bookname varchar2(50),
    publisher varchar2(50),
    price number,
    );

--��밡�� key2��
create table newbook4(
    idx     number,
    bookid number,
    bookname varchar2(50),
    publisher varchar2(50),
    price number,
    primary key (idx, bookid)
    );

newbook4 �� ���� newbook5 ����
(�������� : bookname = null���� ������ ���� = not null
            publisher = ���� ������ �ȵȴ� = unique
            price = ���� �Էµ��� ������ �⺻�� 10000 �Է� = default 10000
            sal_price = �ԷµǴ� �ּҰ��� 1000 �̻��� �Ǿ���Ѵ�
            
create table newbook5(
    idx     number not null,
    bookid  number not null,
    bookname    varchar2(50) not null,
    publisher   varchar2(50) unique,
    price   number default 10000,
    sal_price   number check(sal_price > 1000),
    primary key (idx, bookid)
);

================================================================================

4. ���̺� ���� : ���̺� ������ ������ ��� �����ȴ�
    ����) drop table ���̺��̸�
    newbook2 ���̺� ���� : drop table newbook2;
    newbook4 ���̺� ���� : drop table newbook4;

5. ���̺� ���� ���� : alter table ���̺��̸�
                    �÷� �߰� ( ADD �÷��� �ڷ���(ũ��) [��������] ), 
                    �÷� ���� ( drop column �÷��� )
                    �÷� ���� ( modify �÷��� �ڷ���(ũ��) [��������] )
  ** ���̺� ���� ���� ��ɾ� : desc ���̺��̸�;
    ��) desc newbook;
 
 5-1. �÷� �߰� : alter table newbook add addr varchar2(50);
 5-2. �÷� ���� : �����Ͱ� �־ ������
                ���࿡ ���� �� �Ӽ��� �����ϴ� �ٸ� �Ӽ��� ������ ���� �ȵ�
                alter table newbook drop column addr;
 5-3. �÷� ���� : 
    - �����Ͱ� ���� ��� : �÷��� �ڷ����� ũ�⸦ ������� ���� �� �� �ִ�
        ��) addr varchar2(50) > number(7) 
            alter table newbook modify addr number(7);
 
    - �����Ͱ� �ִ� ��� : ���� �ڷ������� ũ�� ��ȭ�� ����
                        ��, ������ �ִ� ������ ũ�⺸�ٴ� Ŀ�� ���� ����
   
    ---���� �ȵ�, �Ŀ� ã�ƺ�---
    - �����Ͱ� �ִ� ��� �ٸ� �ڷ������� ������ �� (����)
         ���ڸ� ���ڷ� ������ �� �Ұ���
         ���ڸ� ���ڷ� ������ �� ����

6. ���̺� ���� (key�� ���� �ȵ�)
    1) ������ �����͸� ��� ���� �� ���
        create table ���ο����̺��̸� as select * from �������̺��̸�;
    2) ������ �����ϴ� ���
        create table ���ο����̺��̸� as select * from �������̺��̸� where 1=0 ;

        create table newnewbook as select * from newbook;
        create table newnewnewbook as select * from newbook where 1=0;

7. insert into : Ʃ��(���ڵ�or��)�� ����
    1) insert into ���̺��̸�( �÷���1, �÷���2, �÷���3, �÷���4 )
        values( ������1, ������2, ������3, ������4 )
        ** �÷���� �����ʹ� ������� 1��1 ��Ī
        ** �÷����� �Է��Ҷ��� ���������� not null�� ���� �÷��� �ݵ�� �־���Ѵ�
    
    ��1) newbook ���̺� ���� (�÷����� ������ ���)
    bookid =1, bookname='�౸�� ����', publisher='�½�����', price=7000, addr='����'
    insert into newbook(bookid, bookname, publisher, price, addr)
    values(1, '�౸�� ����', '�½�����', 7000, 1);

    2) insert into ���̺��̸�
        values( ������1, ������2, ������3, ������4 )
        ** �ش� ���̺��� ��� �÷��� ���� ������� �����͸� �����ؾ� �Ѵ�
    
    ��2) newbook ���̺� ���� (�÷����� �������� �ʴ� ���)
    bookid =2, bookname='�౸�ƴ� ����', publisher='������', price=13000, addr=1
    insert into newbook
    values(2, '�౸�ƴ� ����', '������', 13000, 1);

    3) �Ϻ� �����͸� ���� ���� (�ݵ�� not null�� ������ �����ؾ���)
    
    ��3) ������ ������� 1��1 ��Ī�� ���߸� �ȴ�. not null�� �ݵ�� ������ ���� �ؾ���
    bookid =3, bookname='�౸�� ����', publisher='���ѹ̵��'
    insert into newbook(bookname, publisher, bookid)
    values('�౸�� ����', '���ѹ̵��', 3);
    
    ��4) ������ ���缭 �Է��ؾ���. �÷��� ���� ������ ���� ��ġ���� null �Է� �ؾ���
    bookid =4, bookname='���� ���̺�', price=35000
    insert into newbook
    values(4, '���� ���̺�', null, 35000, null);
================================================================================
 ** newbook ���̺� �����Ͱ� ���� > �տ��� ���� �͵� ������
1. ���̺� ���� : key�� ���� �ȵ�
    1-1. ������ ������ ���� : create table ���ο����̺��̸� as select * from �������̺�;
        create table copybook as select * from newbook;
        
    1-2. ���� ���� : create table ���ο����̺��̸� as select * from �������̺� where 1=0;
        create table copybook2 as select * from newbook where 1=0;

2. �÷� ���� : �����Ͱ� �ִ� ����� �÷� ����
    - �����Ͱ� �ִ� ��� : ���� �ڷ������� ũ�� ��ȭ�� ����
                        ��, ������ �ִ� ������ ũ�⺸�ٴ� Ŀ�� ���� ����
        
    ��1) �����Ͱ� �ִ� ��� ���� �ڷ������� ũ�� ��ȯ (���� ũ�⺸�� ũ��)
        copybook ���̺� bookname=varchar2(50)
        ���� varchar2(50)���� varchar2(100)���� ���� > ���� X
    alter table copybook modify bookname varchar2(100);

    ��2) �����Ͱ� �ִ� ��� ���� �ڷ������� ũ�� ��ȯ (���� ũ�⺸�� �۰�)
        copybook ���̺� publisher=varchar2(50)
        ���� varchar2(30)���� ���� > ���� X
        ���� varchar2(10)���� ���� > ���� O 
        ** ���� ������ �� ũ�Ⱑ ���� ū �����ͺ��ٴ� ũ�Ⱑ Ŀ���Ѵ�
    alter table copybook modify publisher varchar2(30);

    - �����Ͱ� �ִ� ��� �ٸ� �ڷ������� ������ �� (����)
         ���ڸ� ���ڷ� ������ �� ����
    
    -- ����ȵ� --
    ��1) copybook ���̺� addr=varchar2(50)
    alter table copybook modify addr varchar2(50);
================================================================================
--å�� �ִ� book ���̺�, orders ���̺�, customer ���̺� ����� ������ �Է�--
create table book(
    bookid      number,
    bookname    varchar2(100),
    publisher   varchar2(100),
    price       number
);
alter table book add primary key(bookid);
alter table book drop column bookid;


insert into book(bookid, bookname, publisher, price)
values(1, '�౸�� ����', '�½�����', 7000);
insert into book(bookid, bookname, publisher, price)
values(2, '�౸�ƴ� ����', '������', 13000);
insert into book(bookid, bookname, publisher, price)
values(3, '�౸�� ����', '���ѹ̵��', 22000);
insert into book(bookid, bookname, publisher, price)
values(4, '���� ���̺�', '���ѹ̵��', 35000);
insert into book(bookid, bookname, publisher, price)
values(5, '�ǰ� ����', '�½�����', 8000);
insert into book(bookid, bookname, publisher, price)
values(6, '���� �ܰ躰���', '�½�����', 6000);
insert into book(bookid, bookname, publisher, price)
values(7, '�߱��� �߾�', '�̻�̵��', 20000);
insert into book(bookid, bookname, publisher, price)
values(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
insert into book(bookid, bookname, publisher, price)
values(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
insert into book(bookid, bookname, publisher, price)
values(10, 'Olympic Champions', 'Pearson', 13000);

create table orders(
    orderid     number,
    custid      number,
    bookid      number,
    saleprice   number,
    orderdate   date
);
alter table orders add primary key(orderid);

insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(1,1,1,6000,'2020/07/01');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(2,1,3,21000,'2020/07/03');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(3,2,5,8000,'2020/07/03');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(4,3,6,6000,'2020/07/04');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(5,4,7,20000,'2020/07/05');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(6,1,2,12000,'2020/07/07');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(7,4,8,13000,'2020/07/07');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(8,3,10,12000,'2020/07/08');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(9,2,10,7000,'2020/07/09');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(10,3,8,13000,'2020/07/10');

create table customer(
    custid      number,
    name        varchar2(100),
    address     varchar2(100),
    phone       varchar2(100)
);
alter table customer add primary key(custid);

insert into customer(custid, name, address, phone)
values(1, '������', '���� ��ü����', '000-5000-0001');
insert into customer(custid, name, address, phone)
values(2, '�迬��', '���ѹα� ����', '000-6000-0001');
insert into customer(custid, name, address, phone)
values(3, '��̶�', '���ѹα� ������', '000-7000-0001');
insert into customer(custid, name, address, phone)
values(4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
insert into customer(custid, name, address, phone)
values(5, '�ڼ���', '���ѹα� ����', null);
