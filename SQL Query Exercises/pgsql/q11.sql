SELECT DISTINCT pname
FROM Devassignments
GROUP BY pname
HAVING COUNT(DISTINCT employeeid) > 2 -- on the grouping, only select those with more than 2 entries (more than 2 dev's associated with it)
ORDER BY pname
;
