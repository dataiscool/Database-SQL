SELECT DISTINCT pname 
FROM Documentauthors, Document
WHERE Documentauthors.employeeid = 93401 AND Documentauthors.documentid = Document.documentid
ORDER BY pname
;
-- THIS GETS ALL PROJECTS FOR WHICH 93401 HAS AUTHORED DOCUMENTS
