
select * from Employee;
select email from Employee;
select city from Employee;
select distinct city from EMPLOYEE;
select FIRSTNAME from EMPLOYEE where lastname = 'King';
select LASTNAME, email from EMPLOYEE where regexp_like (email,'^[a-z0-9._-]+@[a-z0-9.-]+\.[a-z]{2,3}$','i');
select current_date  from dual;
select FirstName || ' ' || LastName as "Sales"  from Employee where title  LIKE 'Sales%';

SELECT a.Name, al.title FROM Album al, artist a
WHERE al.ArtistId= a.ArtistId
order by a.name

select a.name, al.title from Album al INNER JOIN artist a using (artistid) order by a.name;

SELECT FirstName || ' ' || LastName as "Customers Brazil" FROM Customer where Country = 'Brazil';

SELECT BillingCountry as "Country" , SUM(Total) as "Total Sales For Country"
FROM Invoice
GROUP BY BillingCountry
DESC
LIMIT 1;



SELECT BillingCountry as "Country" , SUM(Total) as "Total Sales Country"
FROM Invoice  GROUP BY BillingCountry  Order by "Total Sales Country" DESC
FETCH FIRST 1 ROWS ONLY;


SELECT "Country", MAX("Total Sales For Country") as "Total Spent"
FROM
(SELECT BillingCountry as "Country" , SUM(Total) as "Total Sales For Country"
FROM Invoice
GROUP BY BillingCountry);

Select * From
(SELECT BillingCountry as "Country" , SUM(Total) as "Total Sales Country"
FROM Invoice  GROUP BY BillingCountry  Order by "Total Sales Country" DESC)
WHERE ROWNUM  <=1;

SELECT p.Name, COUNT(pt.TrackId) as "Number Of Tracks"
FROM Playlist p
JOIN PlaylistTrack pt
ON p.PlaylistId = pt.PlaylistId
GROUP BY p.name;


EXPLAIN PLAN FOR SELECT p.Name, COUNT(pt.TrackId) as "Number Of Tracks"
FROM Playlist p JOIN PlaylistTrack pt
using (PlaylistId)
GROUP BY p.name;

select * from table (dbms_xplan.display);
select count(*) from PLAYLISTTRACK;