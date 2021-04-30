SELECT Project.pname, pstartdate, COUNT(DISTINCT employeeid) AS numdevs
FROM Project LEFT OUTER JOIN  Devassignments -- We also want Projects on which no devs have been assigned yet.
ON Project.pname = Devassignments.pname 
WHERE pstartdate = (SELECT MAX(pstartdate)
			FROM Project)
GROUP BY Project.pname, pstartdate
ORDER BY Project.pname
