WITH RECURSIVE q as ( SELECT "EmployeeId","ReportsTo" FROM "Employee"
					WHERE "EmployeeId"= 1
		      UNION ALL
		      SELECT m."EmployeeId",m."ReportsTo" FROM "Employee" m
		      JOIN q ON q."EmployeeId" = m."ReportsTo"
		    )
SELECT   q."EmployeeId",q."ReportsTo" FROM q
