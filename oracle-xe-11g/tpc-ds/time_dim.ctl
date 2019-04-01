LOAD DATA
INFILE '/tmp/dsd/time_dim_1_2.dat'
BADFILE '/tmp/dsd/time_dim_1_2.bad'
DISCARDFILE '/tmp/dsd/time_dim_1_2.dsc'
INSERT INTO TABLE time_dim
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
 (  T_TIME_SK  ,
  T_TIME_ID  ,
  T_TIME      ,
  T_HOUR      ,
  T_MINUTE    ,
  T_SECOND   ,
  T_AM_PM    ,
  T_SHIFT     ,
  T_SUB_SHIFT  ,
  T_MEAL_TIME
 )


















