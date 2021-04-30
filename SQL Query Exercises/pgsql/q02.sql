SELECT DISTINCT documentauthors.employeeid, ename
FROM developer, documentauthors
WHERE developer.employeeid = documentauthors.employeeid AND documentid = 22
ORDER BY employeeid;
