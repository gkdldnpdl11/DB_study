create table member(
idx number primary key,
id  varchar2(50) unique,
password    varchar2(50),
username    varchar2(50),
age number,
regdate DATE
);

insert into member(idx, id, password, username, age, regdate)
values(1, 'aaaa', 'a1111', '둘리', 22, '2024/01/03');
insert into member(idx, id, password, username, age, regdate)
values(2, 'bbbb', 'b2222', '희동이', 2, '2024/02/01');
insert into member(idx, id, password, username, age, regdate)
values(3, 'cccc', 'c3333', '도우너', 16, '2024/01/24');
insert into member(idx, id, password, username, age, regdate)
values(4, 'dddd', 'd4444', '고길동', 32, '2024/02/03');


-- 선생님 자료
create TABLE members(
    idx number not null PRIMARY KEY,
    id VARCHAR2(50) UNIQUE,
    pw VARCHAR2(50),
    username VARCHAR2(50),
    age NUMBER,
    regdate DATE
);

insert into members(idx, id, pw, username, age, regdate) values(1, 'aaaa', 'a1111', '둘리', 22, '2024-01-03');
insert into members(idx, id, pw, username, age, regdate) values(2, 'bbbb', 'b2222', '희동이', 2, '2024-02-01');
insert into members(idx, id, pw, username, age, regdate) values(3, 'cccc', 'c3333', '도우너', 16, '2024-01-24');
insert into members(idx, id, pw, username, age, regdate) values(4, 'dddd', 'd4444', '고길동', 32, '2024-02-03');


select * from members;

commit;

-- 여기까지 

-- 현재 날짜 및 시간
select sysdate from dual;

