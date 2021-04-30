SELECT pname, pstartdate
FROM project
--WHERE pstartdate LIKE '2020-05-%' OR pstartdate LIKE '2020-06-__' OR pstartdate LIKE '2020-07-__' OR pstartdate LIKE '2020-08-__'
WHERE pstartdate >= '2020-05-01' AND pstartdate <= '2020-08-31'
ORDER BY pstartdate, pname
;
