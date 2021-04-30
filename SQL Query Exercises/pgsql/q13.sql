SELECT Project.pname, COUNT(DISTINCT documentid) AS numdocs
FROM Project LEFT OUTER JOIN Document
ON Document.pname = Project.pname
WHERE ptype = 'internal' -- Note that putting this condition in the ON would return ALL rows of pname (but only those internal will have any information associated to it. In the WHERE, only lines pertaining to internal are displayed.
GROUP BY Project.pname
ORDER BY numdocs DESC, Project.pname
;
