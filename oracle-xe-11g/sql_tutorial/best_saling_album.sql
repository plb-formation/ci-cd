SELECT *
FROM ( SELECT ar.Name as 'Artist Name', SUM(t.UnitPrice) as 'Total earned'
  FROM Track t
  JOIN Album a ON t.AlbumId = a.AlbumId
  JOIN Artist ar ON a.ArtistId = ar.ArtistId
  GROUP BY ar.Name
)
ORDER BY 'Total Earned' DESC;


SELECT e.FirstName, e.LastName, SUM(i.Total) FROM Invoice i
JOIN Customer c ON c.CustomerId = i.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
GROUP BY e.FIRSTNAME, e.LASTNAME;


select e.employeeid, count(i.invoiceid)
from employee  e
	join customer c on e.employeeid = c.supportrepid
	join invoice i on i.customerid = c.customerid
group by e.employeeid;