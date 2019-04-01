LOAD DATA
INFILE '/tmp/dsd/web_site_1_2.dat'
BADFILE '/tmp/dsd/web_site_1_2.bad'
DISCARDFILE '/tmp/dsd/web_site_1_2.dsc'
INSERT INTO TABLE web_site
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(   WEB_SITE_SK    ,
  WEB_SITE_ID      ,
  WEB_REC_START_DATE  date 'yyyy-mm-dd',
  WEB_REC_END_DATE   date 'yyyy-mm-dd',
  WEB_NAME          ,
  WEB_OPEN_DATE_SK   ,
  WEB_CLOSE_DATE_SK  ,
  WEB_CLASS         ,
  WEB_MANAGER     ,
  WEB_MKT_ID       ,
  WEB_MKT_CLASS     ,
  WEB_MKT_DESC      ,
  WEB_MARKET_MANAGER ,
  WEB_COMPANY_ID     ,
  WEB_COMPANY_NAME   ,
  WEB_STREET_NUMBER  ,
  WEB_STREET_NAME    ,
  WEB_STREET_TYPE    ,
  WEB_SUITE_NUMBER   ,
  WEB_CITY          ,
  WEB_COUNTY        ,
  WEB_STATE         ,
  WEB_ZIP           ,
  WEB_COUNTRY      ,
  WEB_GMT_OFFSET    ,
  WEB_TAX_PERCENTAGE
 )


















