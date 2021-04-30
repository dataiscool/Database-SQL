SELECT pname, budget
FROM Project
WHERE budget > (SELECT AVG(budget)
		FROM Project
		WHERE ptype = 'internal')
ORDER BY budget DESC, pname 
;
