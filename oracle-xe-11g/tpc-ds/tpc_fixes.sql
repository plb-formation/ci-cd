ALTER TABLE TPCDS.CATALOG_PAGE
  ADD cp_promo_id number;

update  CATALOG_PAGE t1
  SET CP_PROMO_ID = (select t2.P_PROMO_SK from PROMOTION t2
                       where t1.CP_CATALOG_PAGE_SK=t2.P_PROMO_SK)
WHERE EXISTS(
     SELECT t2.P_PROMO_SK from PROMOTION t2
      WHERE t1.CP_CATALOG_PAGE_SK=t2.P_PROMO_SK
   );
commit;


UPDATE CATALOG_RETURNS
SET CR_REFUNDED_CDEMO_SK=(select CD_DEMO_SK from (select CD_DEMO_SK from  CUSTOMER_DEMOGRAPHICS order by   DBMS_RANDOM.value)
   where rownum=1)
where rownum  between 1 and 144067;
commit;


UPDATE CATALOG_SALES
SET CS_BILL_CDEMO_SK=(select CD_DEMO_SK from (select CD_DEMO_SK from  CUSTOMER_DEMOGRAPHICS order by   DBMS_RANDOM.value)
   where rownum=1)
where rownum  between 1 and 1441548;
commit;



UPDATE CATALOG_SALES
SET cs_ship_cdemo_sk=(select CD_DEMO_SK from (select CD_DEMO_SK from  CUSTOMER_DEMOGRAPHICS order by   DBMS_RANDOM.value)
   where rownum=1)
where rownum  between 1 and 1441548;
commit;


UPDATE customer
SET c_current_cdemo_sk=(select CD_DEMO_SK from (select CD_DEMO_SK from  CUSTOMER_DEMOGRAPHICS order by   DBMS_RANDOM.value)
   where rownum=1)
where rownum  between 1 and 100000;
commit;


UPDATE STORE_RETURNS
SET sr_cdemo_sk=(select CD_DEMO_SK from (select CD_DEMO_SK from  CUSTOMER_DEMOGRAPHICS order by   DBMS_RANDOM.value)
   where rownum=1)
where rownum  between 1 and 287514;
commit;

UPDATE STORE_SALES
SET ss_cdemo_sk=(select CD_DEMO_SK from (select CD_DEMO_SK from  CUSTOMER_DEMOGRAPHICS order by   DBMS_RANDOM.value)
   where rownum=1)
where rownum  between 1 and 2880404;
commit;

UPDATE WEB_RETURNS
SET WR_REFUNDED_CDEMO_SK=(select CD_DEMO_SK from (select CD_DEMO_SK from  CUSTOMER_DEMOGRAPHICS order by   DBMS_RANDOM.value)
   where rownum=1)
where rownum  between 1 and 71763;
commit;


UPDATE WEB_SALES
SET WS_BILL_CDEMO_SK=(select CD_DEMO_SK from (select CD_DEMO_SK from  CUSTOMER_DEMOGRAPHICS order by   DBMS_RANDOM.value)
   where rownum=1)
where rownum  between 1 and 719384;
commit;

UPDATE WEB_SALES
SET WS_SHIP_CDEMO_SK=(select CD_DEMO_SK from (select CD_DEMO_SK from  CUSTOMER_DEMOGRAPHICS order by   DBMS_RANDOM.value)
   where rownum=1)
where rownum  between 1 and 719384;
commit;
