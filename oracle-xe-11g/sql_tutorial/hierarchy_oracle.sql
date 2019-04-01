select LASTNAME, EMPLOYEEID from EMPLOYEE
start with reportsto is null
connect by prior employeeid = reportsto ;