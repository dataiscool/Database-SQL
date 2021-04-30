SELECT ename, Developer.employeeid -- DEVS WHO ARE ASSIGNED TO KODIAK
FROM Developer, Devassignments
WHERE Developer.employeeid = Devassignments.employeeid AND Devassignments.pname = 'Kodiak'
UNION
SELECT ename, employeeid -- DEV WHO ARE AUTHORS OF DOCS FOR KODIAK
FROM Document, (SELECT Developer.employeeid, ename, documentid --Note: not necessary to make it into a derived table, just use two ANDs)
						FROM Developer, Documentauthors
						WHERE Developer.employeeid = Documentauthors.employeeid) tmp
WHERE tmp.documentid = Document.documentid AND Document.pname = 'Kodiak'
ORDER BY employeeid
;
