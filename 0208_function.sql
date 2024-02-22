function (�Լ�): ���ν����� ���������� ���� �� ����
    1) �Ϲ� SQL �������� function �� ȣ�� �� �� �ִ�(���ν������� ������)
    2) function �� return ���� �ݵ�� ����ؾ� �Ѵ�
        ���ν��� : in = �Է� , out = ��� (in, out �� ��� �������)
 ����)    function                              procedure
 -------------------------------------------------------------------------------
    create function �̸�()                  create procedure �̸�()
    return dateType                        as 
    as                                     begin
    begin                                   ���๮;
        ���๮                              end;
    end;
 ������) SQL ������ ȣ�� �� �� �ִ�           exec ���ν����̸�(); => SQL�� ȣ��

-- �Ǹŵ� ������ ���� ������ ����ϴ� �Լ�(fnc_interest)
-- ������ 30,000�� �̻��̸� 10%, 30,000�� �̸��̸� 5%
-- �ܺο��� ������ �޴´�
    create function fnc_interest(f_price in orders3.saleprice%type)
    return number   -- number�� ������ �ƴ϶� ��ȯ�ϴ� ������ "�ڷ���"
    as
        myprice number;     -- ����� ���� �޾Ƽ� ��ȯ�ϴ� ����
    begin
        if(f_price>=30000) then myprice := f_price*0.1 ;
        else myprice := f_price*0.05;
        end if;
        return myprice;     -- ������ ���� ����
    end;
    -- ���� ���(�Ϲ� SQL������ ȣ�� ������)
    select o.*, fnc_interest(o.saleprice) as ������ from orders3 o;
    -- ��� Ȯ��
    select * from orders3;
    
-- ��¥�� �޾Ƽ� ��¥������ �����ϴ� �Լ� (fnc_orderdate)
    -- ex) ����Ͽ���
    create function fnc_orderdate(f_date in orders3.orderdate%type)
    return varchar2
    as
        v_date varchar2(50);
    begin
        v_date := to_char(f_date, 'yyyy"��" mm"��" dd"��" day');
        return v_date;
    end;
    -- ��� Ȯ��
    select o.*, fnc_orderdate(o.orderdate) from orders3 o;
