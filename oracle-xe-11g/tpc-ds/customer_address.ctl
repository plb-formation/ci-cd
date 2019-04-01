LOAD DATA
INFILE '/tmp/dsd/customer_address_1_2.dat'
BADFILE '/tmp/dsd/customer_address_1_2.bad'
DISCARDFILE '/tmp/dsd/customer_address_1_2.dsc'
INSERT INTO TABLE customer_address
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
( CA_ADDRESS_SK    ,
  CA_ADDRESS_ID    ,
  CA_STREET_NUMBER ,
  CA_STREET_NAME  ,
  CA_STREET_TYPE   ,
  CA_SUITE_NUMBER ,
  CA_CITY         ,
  CA_COUNTY      ,
  CA_STATE       ,
  CA_ZIP         ,
  CA_COUNTRY     ,
  CA_GMT_OFFSET  ,
  CA_LOCATION_TYPE
 )


















