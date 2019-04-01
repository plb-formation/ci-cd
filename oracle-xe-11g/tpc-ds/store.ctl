LOAD DATA
INFILE '/tmp/dsd/store_1_2.dat'
BADFILE '/tmp/dsd/store_1_2.bad'
DISCARDFILE '/tmp/dsd/store_1_2.dsc'
INSERT INTO TABLE store
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
( S_STORE_SK     ,
  S_STORE_ID      ,
  S_REC_START_DATE  date 'yyyy-mm-dd',
  S_REC_END_DATE    date 'yyyy-mm-dd',
  S_CLOSED_DATE_SK ,
  S_STORE_NAME      ,
  S_NUMBER_EMPLOYEES ,
  S_FLOOR_SPACE     ,
  S_HOURS          ,
  S_MANAGER        ,
  S_MARKET_ID      ,
  S_GEOGRAPHY_CLASS ,
  S_MARKET_DESC    ,
  S_MARKET_MANAGER ,
  S_DIVISION_ID    ,
  S_DIVISION_NAME  ,
  S_COMPANY_ID      ,
  S_COMPANY_NAME    ,
  S_STREET_NUMBER   ,
  S_STREET_NAME    ,
  S_STREET_TYPE    ,
  S_SUITE_NUMBER   ,
  S_CITY           ,
  S_COUNTY         ,
  S_STATE          ,
  S_ZIP            ,
  S_COUNTRY        ,
  S_GMT_OFFSET     ,
  S_TAX_PRECENTAGE
 )


















