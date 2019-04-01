SELECT a.Name, COUNT(al.ArtistId) as Number_OF_Albums FROM Album al
FULL JOIN Artist a ON al.ArtistId= a.ArtistId
GROUP BY a.Name ORDER BY a.Name


SELECT a.Name, COUNT(al.ArtistId) as Number_OF_Albums FROM Album al
FULL JOIN Artist a ON al.ArtistId= a.ArtistId
GROUP BY a.Name ORDER BY a.Name


select a.Name, count (b.ARTISTID) from album b, artist a
where b.ARTISTID = a.ARTISTID
group by a.name