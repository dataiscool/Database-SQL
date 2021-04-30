SELECT DISTINCT pname, pstartdate
FROM project
WHERE ptype = 'internal'
ORDER BY pname
;
