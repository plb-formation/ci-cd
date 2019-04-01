with latch as
(
select * from dba_hist_latch
)
select SNAP_ID "SNAP ID", level# "LEVEL #", LATCH_NAME, GETS,
MISSES, SLEEPS, spin_gets "SPIN GETS", wait_time "WAIT TIME"
from latch
where latch_name like 'cache buffers chains%'
order by latch_name, 1



