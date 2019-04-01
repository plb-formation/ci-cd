SQL> create table t
  d  as
  3  select username, created
  4  from all_users
  5  /

Table created.

SQL> set autoprint off
SQL> variable x refcursor;
SQL> begin
  2  open :x for select * from t;
  3  end;
  4  /

PL/SQL procedure successfully completed.

SQL> declare
  2  pragma autonomous_transaction;
  3  begin
  4   delete from t;
  5  commit;
  6  end;
  7  /

PL/SQL procedure successfully completed.

SQL> print x
