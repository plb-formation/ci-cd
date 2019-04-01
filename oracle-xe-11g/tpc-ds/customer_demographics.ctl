LOAD DATA
INFILE '/tmp/dsd/customer_demographics_1_2.dat'
BADFILE '/tmp/dsd/customer_demographics_1_2.bad'
DISCARDFILE '/tmp/dsd/customer_demographics_1_2.dsc'
INSERT INTO TABLE customer_demographics
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(  CD_DEMO_SK        ,
  CD_GENDER          ,
  CD_MARITAL_STATUS   ,
  CD_EDUCATION_STATUS  ,
  CD_PURCHASE_ESTIMATE  ,
  CD_CREDIT_RATING   ,
  CD_DEP_COUNT        ,
  CD_DEP_EMPLOYED_COUNT,
  CD_DEP_COLLEGE_COUNT
)


















