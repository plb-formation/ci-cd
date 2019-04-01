LOAD DATA
INFILE '/tmp/dsd/customer_1_2.dat'
BADFILE '/tmp/dsd/customer_1_2.bad'
DISCARDFILE '/tmp/dsd/customer_1_2.dsc'
INSERT INTO TABLE customer
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
( C_CUSTOMER_SK        ,
  C_CUSTOMER_ID         ,
  C_CURRENT_CDEMO_SK   ,
  C_CURRENT_HDEMO_SK   ,
  C_CURRENT_ADDR_SK    ,
  C_FIRST_SHIPTO_DATE_SK,
  C_FIRST_SALES_DATE_SK ,
  C_SALUTATION          ,
  C_FIRST_NAME          ,
  C_LAST_NAME           ,
  C_PREFERRED_CUST_FLAG ,
  C_BIRTH_DAY           ,
  C_BIRTH_MONTH        ,
  C_BIRTH_YEAR          ,
  C_BIRTH_COUNTRY       ,
  C_LOGIN              ,
  C_EMAIL_ADDRESS      ,
  C_LAST_REVIEW_DATE
 )


















