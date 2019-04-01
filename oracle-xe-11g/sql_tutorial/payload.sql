create table test_payload
(
   id number primary key,
   processed_flag varchar2(1),
   payload varchar2(20)
);

create  index t_idx on test_payload( decode(processed_flag, 'N','N'));


insert into test_payload select r, case when mod(r,2) = 0 then 'N' else 'Y' end, 'payload ' || r
from (select level r from dual connect by level <= 5)

select * from  test_payload;