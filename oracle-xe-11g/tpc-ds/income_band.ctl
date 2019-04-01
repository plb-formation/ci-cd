LOAD DATA
INFILE '/tmp/dsd/income_band_1_2.dat'
BADFILE '/tmp/dsd/income_band_1_2.bad'
DISCARDFILE '/tmp/dsd/income_band_1_2.dsc'
INSERT INTO TABLE income_band
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(  IB_INCOME_BAND_SK  ,
  IB_LOWER_BOUND    ,
  IB_UPPER_BOUND
 )


















