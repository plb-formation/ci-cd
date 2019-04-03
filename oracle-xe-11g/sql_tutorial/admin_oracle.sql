select sysdate from dual;

select group#, status, members from v$log
order by group#;

select sequence#,
to_char(first_time,'DD/MM/YYYY HH:MI:SS') first_time
from v$log_history;

select to_char(first_time,'MM-DD') Jour,
        to_char(sum(decode(to_char(first_time,'HH24'),'00',1,0)),'999') " 00",
        to_char(sum(decode(to_char(first_time,'HH24'),'01',1,0)),'999') " 01",
        to_char(sum(decode(to_char(first_time,'HH24'),'02',1,0)),'999') " 02",
        to_char(sum(decode(to_char(first_time,'HH24'),'03',1,0)),'999') " 03",
        to_char(sum(decode(to_char(first_time,'HH24'),'04',1,0)),'999') " 04",
        to_char(sum(decode(to_char(first_time,'HH24'),'05',1,0)),'999') " 05",
        to_char(sum(decode(to_char(first_time,'HH24'),'06',1,0)),'999') " 06",
        to_char(sum(decode(to_char(first_time,'HH24'),'07',1,0)),'999') " 07",
        to_char(sum(decode(to_char(first_time,'HH24'),'08',1,0)),'999') " 08",
        to_char(sum(decode(to_char(first_time,'HH24'),'09',1,0)),'999') " 09",
        to_char(sum(decode(to_char(first_time,'HH24'),'10',1,0)),'999') " 10",
        to_char(sum(decode(to_char(first_time,'HH24'),'11',1,0)),'999') " 11",
        to_char(sum(decode(to_char(first_time,'HH24'),'12',1,0)),'999') " 12",
        to_char(sum(decode(to_char(first_time,'HH24'),'13',1,0)),'999') " 13",
        to_char(sum(decode(to_char(first_time,'HH24'),'14',1,0)),'999') " 14",
        to_char(sum(decode(to_char(first_time,'HH24'),'15',1,0)),'999') " 15",
        to_char(sum(decode(to_char(first_time,'HH24'),'16',1,0)),'999') " 16",
        to_char(sum(decode(to_char(first_time,'HH24'),'17',1,0)),'999') " 17",
        to_char(sum(decode(to_char(first_time,'HH24'),'18',1,0)),'999') " 18",
        to_char(sum(decode(to_char(first_time,'HH24'),'19',1,0)),'999') " 19",
        to_char(sum(decode(to_char(first_time,'HH24'),'20',1,0)),'999') " 20",
        to_char(sum(decode(to_char(first_time,'HH24'),'21',1,0)),'999') " 21",
        to_char(sum(decode(to_char(first_time,'HH24'),'22',1,0)),'999') " 22",
        to_char(sum(decode(to_char(first_time,'HH24'),'23',1,0)),'999') " 23"
from v$log_history group by to_char(first_time,'MM-DD') order by 1;


alter system set archive_lag_target = 900 scope = both;

alter system set fast_start_mttr_target = 30 scope=both;

select estimated_mttr, optimal_logfile_size from v$instance_recovery;

SELECT df.tablespace_name "Tablespace",
  totalusedspace "Used MB",
  (df.totalspace - tu.totalusedspace) "Free MB",
  df.totalspace "Total MB",
  ROUND(100 * ( (df.totalspace - tu.totalusedspace)/ df.totalspace)) "% Free"
FROM
  (SELECT tablespace_name,
    ROUND(SUM(bytes) / 1048576) TotalSpace
  FROM dba_data_files
  GROUP BY tablespace_name
  ) df,
  (SELECT ROUND(SUM(bytes)/(1024*1024)) totalusedspace,
    tablespace_name
  FROM dba_segments
  GROUP BY tablespace_name
  ) tu
WHERE df.tablespace_name = tu.tablespace_name;

SELECT  FILE_NAME, BLOCKS, TABLESPACE_NAME
   FROM DBA_DATA_FILES;

create tablespace DATA_VENTES datafile
'/u01/app/oracle/oradata/XE/data_ventes_01.dbf' size 5M;

alter tablespace DATA_VENTES add datafile
'/u01/app/oracle/oradata/XE/data_ventes_02.dbf' size 10M;

alter database datafile '/u01/app/oracle/oradata/XE/data_ventes_01.dbf'
resize 20M;


select tablespace_name, sum(bytes/1024/1024) "Taille en Mo" from dba_data_files group by tablespace_name;

create tablespace PERTES_DATA datafile
'/u01/app/oracle/oradata/XE/data_pertes_01.dbf' size
10M autoextend on next 5M maxsize 50M;

alter tablespace  PERTES_DATA rename to   DATA_PERTES;

select file#,name,status from v$datafile;

alter tablespace DATA_PERTES offline;

create temporary tablespace TMP tempfile
'/u01/app/oracle/oradata/XE/tmp_01.dbf' size 100M;

alter database default temporary tablespace TMP;

create tablespace TEMPO datafile
'/u01/app/oracle/oradata/XE/tempo_01.dbf' size 20M;

drop tablespace TEMPO;

create temporary tablespace TEMPO tempfile
'/u01/app/oracle/oradata/XE/tempo_01.dbf' size 20M reuse ;

select tablespace_name, file_name, (bytes/1024/1024) "Taille en Mo"
from dba_temp_files order by tablespace_name,file_name;

alter system set db_create_file_dest = '/u04/app/oracle/oradata'
scope= both;


create tablespace DATA;

select segment_name,
sum(bytes/1024/1024) as "Taille (Mb)", status
from dba_undo_extents
where tablespace_name = 'UNDOTBS1'
and status in ('ACTIVE','UNEXPIRED')
group by segment_name,status order by 2 desc ;

alter system set undo_retention=1800;

create undo tablespace tbs_undo datafile
'/u01/app/oracle/oradata/XE/tbs_undo_01.dbf' size 1G;

alter system set undo_tablespace = tbs_undo scope=both;

drop tablespace UNDOTBS1 including contents and datafiles;

alter tablespace UNDOTBS1 offline;