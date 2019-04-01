LOAD DATA
INFILE '/tmp/dsd/warehouse_1_2.dat'
BADFILE '/tmp/dsd/warehouse_1_2.bad'
DISCARDFILE '/tmp/dsd/warehouse_1_2.dsc'
INSERT INTO TABLE warehouse
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(  W_WAREHOUSE_SK    ,
  W_WAREHOUSE_ID     ,
  W_WAREHOUSE_NAME  ,
  W_WAREHOUSE_SQ_FT  ,
  W_STREET_NUMBER    ,
  W_STREET_NAME     ,
  W_STREET_TYPE   ,
  W_SUITE_NUMBER   ,
  W_CITY          ,
  W_COUNTY        ,
  W_STATE         ,
  W_ZIP           ,
  W_COUNTRY       ,
  W_GMT_OFFSET

 )


















