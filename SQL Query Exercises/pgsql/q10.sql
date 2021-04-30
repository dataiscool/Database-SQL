SELECT COUNT(DISTINCT pname) AS numprojects
FROM Documentauthors, Document
WHERE Documentauthors.employeeid = 93401 AND Documentauthors.documentid = Document.documentid
;
