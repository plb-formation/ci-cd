CREATE TABLE pivot_test (
  id            NUMBER,
  customer_id   NUMBER,
  product_code  VARCHAR2(5),
  quantity      NUMBER
);

INSERT INTO pivot_test VALUES (1, 1, 'A', 10);
INSERT INTO pivot_test VALUES (2, 1, 'B', 20);
INSERT INTO pivot_test VALUES (3, 1, 'C', 30);
INSERT INTO pivot_test VALUES (4, 2, 'A', 40);
INSERT INTO pivot_test VALUES (5, 2, 'C', 50);
INSERT INTO pivot_test VALUES (6, 3, 'A', 60);
INSERT INTO pivot_test VALUES (7, 3, 'B', 70);
INSERT INTO pivot_test VALUES (8, 3, 'C', 80);
INSERT INTO pivot_test VALUES (9, 3, 'D', 90);
INSERT INTO pivot_test VALUES (10, 4, 'A', 100);
COMMIT;

select * from pivot_test;


SELECT customer_id,
       SUM(DECODE(product_code, 'A', quantity, 0)) AS a_sum_quantity,
       SUM(DECODE(product_code, 'B', quantity, 0)) AS b_sum_quantity,
       SUM(DECODE(product_code, 'C', quantity, 0)) AS c_sum_quantity
FROM   pivot_test
GROUP BY customer_id
ORDER BY customer_id;



*.audit_file_dest='/u01/app/oracle/admin/dev12c/adump'
*.audit_trail='db'
*.compatible='12.0.0.0.0'
*.control_files='/u01/app/oracle/oradata/dev12c/control01.ctl',
         '/u02/app/oracle/oradata/dev12c/control02.ctl',
         '/u03/app/oracle/oradata/dev12c/control03.ctl'
*.db_block_size=8192
*.db_domain=’lfg.com’
*.db_name='dev12c'
*.db_recovery_file_dest='/u01/app/oracle/fast_recovery_area'
*.db_recovery_file_dest_size=4815m
*.diagnostic_dest='/u01/app/oracle'
*.memory_target=1280m
*.open_cursors=300
*.processes=300
*.undo_tablespace='UNDOTBS1'