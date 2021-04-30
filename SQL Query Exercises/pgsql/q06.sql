SELECT DISTINCT ename, Developer.employeeid
FROM Developer, Devassignments
WHERE Developer.employeeid = Devassignments.employeeid AND 
EXISTS (SELECT * -- If there exists a project of type internal, then output this developer info 
	FROM Project
	WHERE Project.pname = Devassignments.pname AND
	Project.ptype = 'internal')
EXCEPT
SELECT DISTINCT ename, Developer.employeeid
FROM Developer, Devassignments
WHERE Developer.employeeid = Devassignments.employeeid AND 
EXISTS (SELECT * -- If there exists a project of type external, then remove this dev from output 
	FROM Project
	WHERE Project.pname = Devassignments.pname AND
	Project.ptype = 'external')
ORDER BY employeeid
;
