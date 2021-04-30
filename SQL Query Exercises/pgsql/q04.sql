SELECT DISTINCT Project.pname, asgndate, Project.ptype
FROM Devassignments, Project
WHERE Devassignments.pname = Project.pname AND employeeid = 82102
ORDER BY Project.pname
;
