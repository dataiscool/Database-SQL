SELECT COUNT(*) AS numprojects -- Note that pname is primary key in project, so can omit the DISTINCT pname in COUNT.. doesnt change anything
FROM Project
WHERE EXTRACT(YEAR FROM pstartdate) = 2020;
