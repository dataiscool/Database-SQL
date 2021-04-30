SELECT pname, pstartdate
FROM Project
WHERE pstartdate = (SELECT MIN(pstartdate) -- This gets the oldest date in Project, then use it as the WHERE clause condition to find all projects of this date.
			FROM Project)
ORDER BY pname
