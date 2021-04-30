-- Pig Latin script to produce a list of highest mortality days of Quebec.

-- load the data from HDFS and define the schema
coviddata = LOAD '/data/Covid19Canada.csv' USING PigStorage(',') AS (prname:CHARARRAY, idate:CHARARRAY, newcases:INT, newdeaths:INT, tests:INT, recoveries:INT);

-- Select only province and number of deaths
proj = FOREACH coviddata GENERATE prname, newdeaths;

-- Get record of quebec and number of deaths
QuebecCases = FILTER coviddata BY prname == 'Quebec';
proj = FOREACH QuebecCases GENERATE prname, idate, newdeaths;
GrpQc = GROUP proj BY prname;
QcDeaths = FOREACH GrpQc GENERATE group AS prov, SUM(proj.newdeaths) AS totalDeaths;

-- Join aggregated data set with individual days of quebec deaths
jndQc = JOIN QcDeaths by prov, proj by prname;

-- compute mortality rate; newdeath/totaldeaths
mrate = FOREACH jndQc GENERATE idate, newdeaths, (1.0*newdeaths)/(1.0*totalDeaths)*100 AS mortalityRate; 

-- filter by > 1%
fltrd = FILTER mrate BY mortalityRate >= 1;

-- Order by date
results = ORDER fltrd BY idate;

-- output
DUMP results; 
