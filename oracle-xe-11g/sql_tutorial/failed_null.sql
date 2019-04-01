select * from CUSTOMER;

select FIRSTNAME, LASTNAME from CUSTOMER
where company <> NULL ;

select CUSTOMERID, FIRSTNAME, LASTNAME from CUSTOMER
where company IS NOT NULL ;

select CUSTOMERID, LASTNAME, NVL(COMPANY, 'Inconnu') FROM CUSTOMER;

select CUSTOMERID, LASTNAME, NVL2(COMPANY, 'Connu' , 'Inconnu') FROM CUSTOMER;

# NULLIF accepts two parameters and returns null if both parameters are equal.
select NULLIF(100,100) FROM DUAL;

select NULLIF(100,200) FROM DUAL;

SELECT TRIM ('  khaled       khudai  ') v  FROM DUAL;

SELECT e.FirstName ||' '|| e.LastName as 'Sales Agent', SUM(i.Total) as 'Total for Agent' FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId JOIN Employee e ON c.SupportRepId = e.EmployeeId GROUP BY e.EmployeeId; 



select e.*, count(i.invoiceid) as 'Total Number of Sales'
from employee as e
	join customer as c on e.employeeid = c.supportrepid
	join invoice as i on i.customerid = c.customerid
group by e.employeeid


select e.*, count(i.invoiceid) as 'Total Number of Sales'
from employee  e
	join customer c on e.employeeid = c.supportrepid
	join invoice i on i.customerid = c.customerid
group by e.employeeid


select e.LASTNAME, e.FIRSTNAME, count(e.EMPLOYEEID) from EMPLOYEE e , CUSTOMER c
where e.EMPLOYEEID = c.SUPPORTREPID
GROUP BY c.SUPPORTREPID;

SELECT CUSTOMERID, SUPPORTREPID from CUSTOMER
GROUP BY SUPPORTREPID;


