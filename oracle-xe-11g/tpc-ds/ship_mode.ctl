LOAD DATA
INFILE '/tmp/dsd/ship_mode_1_2.dat'
BADFILE '/tmp/dsd/ship_mode_1_2.bad'
DISCARDFILE '/tmp/dsd/ship_mode_1_2.dsc'
INSERT INTO TABLE ship_mode
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(  SM_SHIP_MODE_SK  ,
  SM_SHIP_MODE_ID ,
  SM_TYPE         ,
  SM_CODE        ,
  SM_CARRIER      ,
  SM_CONTRACT
 )


















