LOAD DATA
INFILE '/tmp/dsd/item_1_2.dat'
BADFILE '/tmp/dsd/item_1_2.bad'
DISCARDFILE '/tmp/dsd/item_1_2.dsc'
INSERT INTO TABLE item
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
( I_ITEM_SK       ,
  I_ITEM_ID        ,
  I_REC_START_DATE  date 'yyyy-mm-dd',
  I_REC_END_DATE    date 'yyyy-mm-dd',
  I_ITEM_DESC      ,
  I_CURRENT_PRICE  ,
  I_WHOLESALE_COST ,
  I_BRAND_ID      ,
  I_BRAND         ,
  I_CLASS_ID      ,
  I_CLASS          ,
  I_CATEGORY_ID   ,
  I_CATEGORY       ,
  I_MANUFACT_ID   ,
  I_MANUFACT      ,
  I_SIZE          ,
  I_FORMULATION   ,
  I_COLOR         ,
  I_UNITS        ,
  I_CONTAINER     ,
  I_MANAGER_ID    ,
  I_PRODUCT_NAME
 )


















