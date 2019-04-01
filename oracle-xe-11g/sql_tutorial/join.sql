-- select * from t1 CROSS JOIN t2;

select * from t1 INNER JOIN t2 using (t2_id);
/*#select * from t1 NATURAL INNER JOIN t2 ;
#select * from t1 LEFT JOIN  t2 on t1.num=t2.num;
#select * from t1 RIGHT JOIN  t2 on t1.num=t2.num;
#select * from t1 FULL JOIN  t2 using (num);
#select * from t1 RIGHT JOIN t2 on t1.num=t2.num;
#select * from t1 LEFT JOIN t2 on t1.num=t2.num AND t2.value='xxx';
#select * from t1 LEFT JOIN t2 on t1.num=t2.num WHERE t2.value='xxx'; 
*/

SELECT FirstName|| ' ' ||LastName as "Sales Employee" FROM Employee WHERE Employee.Title LIKE 'Sales%';