CREATE TEMP TABLE t (
  section   text
, status    text
, ct        integer  -- don't use "count" as column name.
);

INSERT INTO t VALUES ('A', 'Active', 1), ('A', 'Inactive', 2), ('B', 'Active', 4), ('B', 'Inactive', 5) , ('C', 'Inactive', 7)

select * from t; 

SELECT *
FROM   crosstab(
      'SELECT section, status, ct
       FROM   t
       ORDER  BY 1,2')  -- needs to be "ORDER BY 1,2" here
AS ct ("Section" text, "Active" int, "Inactive" int);

SELECT section, status, ct from t order by 3;


SELECT * FROM crosstab(
       'SELECT section, status, ct
        FROM   t
        ORDER  BY 1'  -- could also just be "ORDER BY 1" here

      ,$$VALUES ('Active'::text), ('Inactive')$$)
AS ct ("Section" text, "Active" int, "Inactive" int);

