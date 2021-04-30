SELECT pname
FROM Devassignments
GROUP BY pname
HAVING COUNT(DISTINCT employeeid) <= 2
ORDER BY pname
