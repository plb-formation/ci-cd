create table t
( id number primary key,
  processed_flag varchar2(1),
  payload varchar2(20)
 );

create index t_idx on
  t( decode( processed_flag, 'N', 'N' ) );

insert into t select r,
case when mod(r,2) = 0 then 'N' else 'Y' end,
'payload ' || r
from (select level r
from dual
connect by level <= 5);

select * from t;


create table v ( x int );

create or replace procedure proc1
as
begin
for i in 1 .. 10000
loop
  execute immediate
  'insert into t values ( :x )' using i;
end loop;
end;


create or replace procedure proc2
as
begin
for i in 1 .. 10000
loop
  execute immediate
  'insert into t values ( '||i||')';
end loop;
end;