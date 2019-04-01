CREATE TABLE T
(
   id number primary key,
   processed_flag varchar2(1),
   payload varchar2(20)
);

create index t_idx on t( decode( processed_flag, 'N', 'N' ) );

insert into t
 select r,
        case when mod(r,2) = 0 then 'N' else 'Y' end,
        'payload ' || r
  from (select level r from dual
      connect by level <= 5);

select * from t;