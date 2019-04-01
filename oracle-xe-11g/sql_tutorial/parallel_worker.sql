create table t1(a bigint,b bigint);
insert into t1 select n,(random()*200000)::int AS id
from 
    generate_series(1,50000000) as x(n);

EXPLAIN ANALYSE SELECT * FROM t1;    -- 26 secondes

EXPLAIN ANALYSE SELECT * FROM t1 where b=1;  -- 3 secondes  

EXPLAIN ANALYSE SELECT * FROM t1 where b >= 23456 and b <= 33333; 4 secondes

EXPLAIN ANALYSE SELECT * FROM t1 where b >= 23456 and b <= 33333 order by b asc;  -- 5 seconds

EXPLAIN ANALYSE SELECT * FROM t1 where b >= 23456 and b <= 33333 limit 10;   4 secondes


EXPLAIN ANALYSE 

select pg_size_pretty(pg_relation_size('b_idx'));

--SET max_parallel_workers_per_gather TO 0;
--EXPLAIN ANALYSE SELECT * FROM t1 where a=1;  -- 6 secondes

--SET max_parallel_workers_per_gather TO 2;
--EXPLAIN ANALYSE SELECT * FROM t1 where a=1;  -- 2.2 secondes

--SET parallel_tuple_cost TO DEFAULT;
--SET max_parallel_workers_per_gather TO 8;
--EXPLAIN ANALYSE SELECT * FROM t1 where a=1;  -- 1.6 secondes

drop index b_idx;
create index b_idx on t1 (b asc) ;   47 secondes
cluster t1 using b_idx;

