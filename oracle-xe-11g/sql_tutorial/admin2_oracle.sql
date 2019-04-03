select tablespace_name from all_tables where owner = 'tpcds' and table_name = 'inventory';

select table_name, tablespace_name from all_tables where owner = 'tpcds';


SELECT df.tablespace_name "Tablespace",
  totalusedspace "Used MB",
  (df.totalspace - tu.totalusedspace) "Free MB",
  df.totalspace "Total MB",
  ROUND(100 * ( (df.totalspace - tu.totalusedspace)/ df.totalspace)) "% Free"
FROM
  (SELECT tablespace_name,
    ROUND(SUM(bytes) / 1048576) TotalSpace
  FROM dba_data_files
  GROUP BY tablespace_name
  ) df,
  (SELECT ROUND(SUM(bytes)/(1024*1024)) totalusedspace,
    tablespace_name
  FROM dba_segments
  GROUP BY tablespace_name
  ) tu
WHERE df.tablespace_name = tu.tablespace_name;


SELECT  FILE_NAME, BLOCKS, TABLESPACE_NAME
   FROM DBA_DATA_FILES;


WITH customer_total_return AS
(select cr_returning_customer_sk as ctr_cust_sk
,ca_state as ctr_state
,sum(cr_return_amt_inc_tax) as ctr_return
FROM catalog_returns
,date_dim
,customer_address
WHERE cr_returned_date_sk = d_date_sk
AND d_year ='2001'
AND cr_returning_addr_sk = ca_address_sk
GROUP BY cr_returning_customer_sk
,ca_state)
SELECT c_customer_id,c_salutation
,c_first_name,c_last_name
,ca_street_number,ca_street_name
,ca_street_type,ca_suite_number
,ca_city,ca_county
,ca_state,ca_zip,ca_country,ca_gmt_offset
,ca_location_type,ctr_return
FROM customer_total_return ctr1
,customer_address
,customer
WHERE ctr1.ctr_return
> (SELECT avg(ctr_return)*1.2
FROM customer_total_return ctr2
WHERE ctr1.ctr_state = ctr2.ctr_state)
AND ca_address_sk = c_current_addr_sk
AND ca_state = 'TN'
AND ctr1.ctr_cust_sk = c_customer_sk
ORDER BY c_customer_id,c_salutation,c_first_name
,c_last_name,ca_street_number,ca_street_name
,ca_street_type,ca_suite_number,ca_city
,ca_county,ca_state,ca_zip,ca_country
,ca_gmt_offset ,ca_location_type
,ctr_return



-- start query 13 in stream 0 using template query13.tpl
SELECT Avg(ss_quantity),
       Avg(ss_ext_sales_price),
       Avg(ss_ext_wholesale_cost),
       Sum(ss_ext_wholesale_cost)
FROM   store_sales,
       store,
       customer_demographics,
       household_demographics,
       customer_address,
       date_dim
WHERE  s_store_sk = ss_store_sk
       AND ss_sold_date_sk = d_date_sk
       AND d_year = 2001
       AND ( ( ss_hdemo_sk = hd_demo_sk
               AND cd_demo_sk = ss_cdemo_sk
               AND cd_marital_status = 'U'
               AND cd_education_status = 'Advanced Degree'
               AND ss_sales_price BETWEEN 100.00 AND 150.00
               AND hd_dep_count = 3 )
              OR ( ss_hdemo_sk = hd_demo_sk
                   AND cd_demo_sk = ss_cdemo_sk
                   AND cd_marital_status = 'M'
                   AND cd_education_status = 'Primary'
                   AND ss_sales_price BETWEEN 50.00 AND 100.00
                   AND hd_dep_count = 1 )
              OR ( ss_hdemo_sk = hd_demo_sk
                   AND cd_demo_sk = ss_cdemo_sk
                   AND cd_marital_status = 'D'
                   AND cd_education_status = 'Secondary'
                   AND ss_sales_price BETWEEN 150.00 AND 200.00
                   AND hd_dep_count = 1 ) )
       AND ( ( ss_addr_sk = ca_address_sk
               AND ca_country = 'United States'
               AND ca_state IN ( 'AZ', 'NE', 'IA' )
               AND ss_net_profit BETWEEN 100 AND 200 )
              OR ( ss_addr_sk = ca_address_sk
                   AND ca_country = 'United States'
                   AND ca_state IN ( 'MS', 'CA', 'NV' )
                   AND ss_net_profit BETWEEN 150 AND 300 )
              OR ( ss_addr_sk = ca_address_sk
                   AND ca_country = 'United States'
                   AND ca_state IN ( 'GA', 'TX', 'NJ' )
AND ss_net_profit BETWEEN 50 AND 250 ) );


-- start query 81 in stream 0 using template query81.tpl
WITH customer_total_return
     AS (SELECT cr_returning_customer_sk   AS ctr_customer_sk,
                ca_state                   AS ctr_state,
                Sum(cr_return_amt_inc_tax) AS ctr_total_return
         FROM   catalog_returns,
                date_dim,
                customer_address
         WHERE  cr_returned_date_sk = d_date_sk
                AND d_year = 1999
                AND cr_returning_addr_sk = ca_address_sk
         GROUP  BY cr_returning_customer_sk,
                   ca_state)
SELECT c_customer_id,
               c_salutation,
               c_first_name,
               c_last_name,
               ca_street_number,
               ca_street_name,
               ca_street_type,
               ca_suite_number,
               ca_city,
               ca_county,
               ca_state,
               ca_zip,
               ca_country,
               ca_gmt_offset,
               ca_location_type,
               ctr_total_return
FROM   customer_total_return ctr1,
       customer_address,
       customer
WHERE  ctr1.ctr_total_return > (SELECT Avg(ctr_total_return) * 1.2
                                FROM   customer_total_return ctr2
                                WHERE  ctr1.ctr_state = ctr2.ctr_state)
       AND ca_address_sk = c_current_addr_sk
       AND ca_state = 'TX'
       AND ctr1.ctr_customer_sk = c_customer_sk
ORDER  BY c_customer_id,
          c_salutation,
          c_first_name,
          c_last_name,
          ca_street_number,
          ca_street_name,
          ca_street_type,
          ca_suite_number,
          ca_city,
          ca_county,
          ca_state,
          ca_zip,
          ca_country,
          ca_gmt_offset,
          ca_location_type,
          ctr_total_return
LIMIT 100;