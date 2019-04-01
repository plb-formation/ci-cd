LOAD DATA
INFILE '/tmp/dsd/reason_1_2.dat'
BADFILE '/tmp/dsd/reason_1_2.bad'
DISCARDFILE '/tmp/dsd/reason_1_2.dsc'
INSERT INTO TABLE reason
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
( R_REASON_SK   ,
  R_REASON_ID    ,
  R_REASON_DESC
 )


















