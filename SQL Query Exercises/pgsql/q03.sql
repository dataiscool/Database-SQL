SELECT DISTINCT Developer.ename, Developer.employeeid
FROM Developer, Devassignments
WHERE Developer.employeeid = Devassignments.employeeid AND Devassignments.pname = 'Kodiak'
EXCEPT --devs assigned to Kodiak DIFF devs who did author docs on Kodiak
SELECT DISTINCT Developer.ename, Developer.employeeid
FROM Developer, Document, Documentauthors
WHERE Developer.employeeid = Documentauthors.employeeid AND Document.documentid = Documentauthors.documentid AND Document.pname = 'Kodiak'
ORDER BY employeeid
;
