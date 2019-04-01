select month_report.* from 
crosstab ('select c.last_name, to_char(p.payment_date,''mon'')::text AS bucket,
 sum(p.amount) AS bucketvalue from payment p, customer c
where p.customer_id = c.customer_id
and p.payment_date between date ''2007-01-01'' and date ''2007-12-31 23:59''
GROUP BY c.last_name,to_char(p.payment_date, ''mon''), date_part(''month'',p.payment_date)
ORDER BY c.last_name',
'SELECT to_char(date ''2007-01-01'' + (n || ''month'')::interval, ''mon'') AS short_name
  FROM generate_series(0,11) n')
  as month_report( customer_name text,janvier numeric(5,2),fevrier numeric(5,2),mars numeric(5,2),avril numeric(5,2),mai numeric(5,2),
                   juin numeric(5,2),juillet numeric(5,2),aout numeric(5,2),septembre numeric(5,2),octobre numeric(5,2), novembre numeric(5,2),
                   decembre numeric(5,2))
                   
                 

