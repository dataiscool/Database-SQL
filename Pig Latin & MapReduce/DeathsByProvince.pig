-- Compute total number of deaths per province

--load the data from HDFS and define the schema
coviddata = LOAD '/data/Covid19Canada.csv' USING PigStorage(',') AS (prname:CHARARRAY, idate:CHARARRAY, newcases:INT, newdeaths:INT, tests:INT, recoveries:INT);

-- Select only province and number of deaths
proj = FOREACH coviddata GENERATE prname, newdeaths;

-- Group by province
Grpp = GROUP proj BY prname;

-- Sum the number of deaths
sumD = FOREACH Grpp GENERATE group AS prov, SUM(proj.newdeaths) AS totalDeaths; 

-- Select provinces with >= 100 deaths
fltrdD = FILTER sumD BY totalDeaths >= 100;

-- Order by deaths
sortD = ORDER fltrdD BY totalDeaths DESC; 

-- output
DUMP sortD;
