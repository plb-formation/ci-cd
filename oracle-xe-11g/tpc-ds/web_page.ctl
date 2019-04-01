LOAD DATA
INFILE '/tmp/dsd/web_page_1_2.dat'
BADFILE '/tmp/dsd/web_page_1_2.bad'
DISCARDFILE '/tmp/dsd/web_page_1_2.dsc'
INSERT INTO TABLE web_page
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
( WP_WEB_PAGE_SK     ,
  WP_WEB_PAGE_ID      ,
  WP_REC_START_DATE   date 'yyyy-mm-dd',
  WP_REC_END_DATE      date 'yyyy-mm-dd',
  WP_CREATION_DATE_SK  ,
  WP_ACCESS_DATE_SK  ,
  WP_AUTOGEN_FLAG  ,
  WP_CUSTOMER_SK    ,
  WP_URL            ,
  WP_TYPE           ,
  WP_CHAR_COUNT     ,
  WP_LINK_COUNT     ,
  WP_IMAGE_COUNT    ,
  WP_MAX_AD_COUNT
)


















