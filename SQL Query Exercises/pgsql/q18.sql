--SELECT pname, devcost
--FROM (SELECT Project.pname, budget/COUNT(DISTINCT employeeid) AS devcost
--	FROM Project, Devassignments
--	WHERE Project.pname = Devassignments.pname
--	GROUP BY Project.pname) Temp
--WHERE devcost = (SELECT MAX(devcost)
--		FROM Temp)
--ORDER BY devcost DESC, pname
--;
WITH costcalculator AS ( -- use WITH syntax since the derived table is not visible within the WHERE subquery
	SELECT Project.pname, budget/COUNT(DISTINCT employeeid) AS devcost
	FROM Project, Devassignments
	WHERE Project.pname = Devassignments.pname
	GROUP BY Project.pname)
SELECT pname, devcost
FROM costcalculator
WHERE devcost = (SELECT MAX(devcost)
		FROM costcalculator)
ORDER BY devcost DESC, pname
;
