-- This script finds the days in quebec where number of recoveries >= 2x cases reported on that day.

--load the data from HDFS and define the schema
coviddata = LOAD '/data/Covid19Canada.csv' USING PigStorage(',') AS (prname:CHARARRAY, idate:CHARARRAY, newcases:INT, newdeaths:INT, tests:INT, recoveries:INT);

-- Find the days in which there were cases reported by Quebec, and at least 50 new cases/recoveries
QuebecCases = FILTER coviddata BY prname == 'Quebec' AND newcases > 50 AND recoveries > 50;

-- Read the attributes we are interested in.
projtemp = FOREACH QuebecCases GENERATE idate, newcases, recoveries, 1.0*recoveries/(1.0*newcases) as ratio;

-- Filter records with ratios >= 2.0
ratioFilter = FILTER projtemp BY ratio >= 2.0;

-- Order that by the date
orderRatioDate = ORDER ratioFilter BY idate;

-- output
DUMP orderRatioDate;
