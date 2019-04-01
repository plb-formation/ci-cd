LOAD DATA
INFILE '/tmp/dsd/inventory_1_2.dat'
BADFILE '/tmp/dsd/inventory_1_2.bad'
DISCARDFILE '/tmp/dsd/inventory_1_2.dsc'
INSERT INTO TABLE inventory
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(
   inv_date_sk,inv_item_sk, inv_warehouse_sk, inv_quantity_on_hand
)
