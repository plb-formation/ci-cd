LOAD DATA
INFILE '/tmp/dsd/call_center_1_2.dat'
BADFILE '/tmp/dsd/call_center_1_2.bad'
DISCARDFILE '/tmp/dsd/call_center_1_2.dsc'
INSERT INTO TABLE call_center
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING
NULLCOLS
( CC_CALL_CENTER_SK ,
  CC_CALL_CENTER_ID ,
  CC_REC_START_DATE date 'yyyy-mm-dd',
  CC_REC_END_DATE   date 'yyyy-mm-dd',
  CC_CLOSED_DATE_SK ,
  CC_OPEN_DATE_SK   ,
  CC_NAME          ,
  CC_CLASS        ,
  CC_EMPLOYEES     ,
  CC_SQ_FT         ,
  CC_HOURS         ,
  CC_MANAGER       ,
  CC_MKT_ID        ,
  CC_MKT_CLASS      ,
  CC_MKT_DESC      ,
  CC_MARKET_MANAGER ,
  CC_DIVISION       ,
  CC_DIVISION_NAME ,
  CC_COMPANY      ,
  CC_COMPANY_NAME   ,
  CC_STREET_NUMBER,
  CC_STREET_NAME    ,
  CC_STREET_TYPE   ,
  CC_SUITE_NUMBER   ,
  CC_CITY        ,
  CC_COUNTY       ,
  CC_STATE        ,
  CC_ZIP           ,
  CC_COUNTRY       ,
  CC_GMT_OFFSET    ,
  CC_TAX_PERCENTAGE  )
