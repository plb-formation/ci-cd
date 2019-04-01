LOAD DATA
INFILE '/tmp/dsd/household_demographics_1_2.dat'
BADFILE '/tmp/dsd/household_demographics_1_2.bad'
DISCARDFILE '/tmp/dsd/household_demographics_1_2.dsc'
INSERT INTO TABLE household_demographics
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(  HD_DEMO_SK        ,
  HD_INCOME_BAND_SK  ,
  HD_BUY_POTENTIAL   ,
  HD_DEP_COUNT       ,
  HD_VEHICLE_COUNT
)


















