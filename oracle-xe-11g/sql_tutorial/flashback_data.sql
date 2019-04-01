SQL> variable scn number
SQL> exec :scn := dbms_flashback.get_system_change_number;

PL/SQL procedure successfully completed.

SQL> print scn;

       SCN
----------
    399425

SELECT DECODE(value, NULL, 'PFILE', 'SPFILE') "Init File Type"
   FROM sys.v_$parameter WHERE name = 'spfile';

show parameter spfile;

mkdir -p /u01/app/oracle/admin/WE/adump
chown oracle:dba /u01/app/oracle/admin/WE/adump

startup pfile='/tmp/pfileWE.ora'
--Error controlfiles are missing
startup
show parameter spfile;

create pfile='/tmp/pfileWE.ora' from spfile='/u01/app/oracle/product/11.2.0/xe/dbs/spfileXE.ora'
-- remplacer XE par WE dans le fichier /tmp/pfileWE.ora

alter database backup controlfile to trace as '/tmp/svg_ctrl.txt';

# Keep command history
apt-get install rlwrap
touch ~/.sqlplus_history
alias sqlplus="rlwrap -i -f ~/.sqlplus_history -H ~/.sqlplus_history -s 30000 sqlplus"

shutdown immediate
@svg_ctrl.txt


select tablespace_name, file_name, (bytes/1024/1024) "Taille en Mo"
from dba_data_files order by tablespace_name,file_name;




select d.undo_size/(1024*1024) "Taille Actuelle [Mo]", substr( e.value,1,25) "Undo Rétention[Sec]",
(to_number(e.value) * to_number(f.value) * g.undo_block_per_sec) / (1024*1024) "Taille Optimale [Mo]"
from ( select sum(a.bytes) undo_size from v$datafile a, v$tablespace b, dba_tablespaces c where
c.contents = 'UNDO' and c.status = 'ONLINE' and b.name = c.tablespace_name and a.ts# = b.ts# )
d,
v$parameter e, v$parameter f,
( select max(undoblks/((end_time-begin_time)*3600*24)) undo_block_per_sec from v$undostat ) g
where e.name = 'undo_retention' and f.name = 'db_block_size' ;







