-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.


CREATE TABLE Vaccines (
	manufacturer VARCHAR(50) NOT NULL,
	numdoses INTEGER,
	waitperiod INTEGER,
	PRIMARY KEY (manufacturer)
);

CREATE TABLE VacLocations (
	vname VARCHAR(50) NOT NULL,
	city VARCHAR(50),
	postcode VARCHAR(10),
	street VARCHAR(50),
	PRIMARY KEY (vname)
);

CREATE TABLE Category (
	cname VARCHAR(50) NOT NULL,
	prioritynum INTEGER,
	PRIMARY KEY (cname)
);

CREATE TABLE Employer (
	ename VARCHAR(50) NOT NULL,
	PRIMARY KEY (ename),
	FOREIGN KEY (ename) REFERENCES VacLocations(vname)
);

CREATE TABLE Batches (
	batchnum INTEGER NOT NULL,
	manufacturer VARCHAR(50) NOT NULL,
	manufdate DATE,
	expdate DATE,
	vname VARCHAR(50) NOT NULL, -- KEY + Participation constraint
	PRIMARY KEY (batchnum, manufacturer),
	FOREIGN KEY (manufacturer) REFERENCES Vaccines(manufacturer),
	FOREIGN KEY (vname) REFERENCES VacLocations(vname)
);

CREATE TABLE Nurses (
	licensenum VARCHAR(20) NOT NULL,
	nname VARCHAR(50),
	ename VARCHAR(50) NOT NULL, -- KEY + Participation constraint
	PRIMARY KEY (licensenum),
	FOREIGN KEY (ename) REFERENCES Employer(ename)
);

CREATE TABLE NurseAssignment (
	licensenum VARCHAR(20) NOT NULL,
	vname VARCHAR(50) NOT NULL,
	ndate DATE NOT NULl,
	PRIMARY KEY (licensenum, vname, ndate), --ndate as primary key allows to record nurses assigned to same vaccination location on different dates
	FOREIGN KEY (licensenum) REFERENCES Nurses(licensenum),
	FOREIGN KEY (vname) REFERENCES VacLocations(vname)
);

CREATE TABLE RegIndividuals (
	HIN VARCHAR(20) NOT NULL, 
	rdate DATE,
	iname VARCHAR(50),
	phonenum VARCHAR(15),
	datebirth DATE,
	gender VARCHAR(20),
	city VARCHAR(50),
	postcode VARCHAR(10),
	street VARCHAR(50),
	cname VARCHAR(50) NOT NULL, --Enforce participation constraint
	PRIMARY KEY (HIN),
	FOREIGN KEY (cname) REFERENCES Category(cname),
	--UNIQUE(phonenum), since family members can share the same number
);

CREATE TABLE Slots (
	sid INTEGER NOT NULL,
	stime TIME,
	sdate DATE,
	vname VARCHAR(50) NOT NULL, --Participation constraint on Slots' side
	HIN VARCHAR(20),
	licensenum VARCHAR(20),
	assigndate DATE,
	PRIMARY KEY (sid),
	FOREIGN KEY (vname) REFERENCES VacLocations(vname),
	FOREIGN KEY (HIN) REFERENCES RegIndividuals(HIN), --Enforce key constraint on Slots' side
	FOREIGN KEY (licensenum) REFERENCES Nurses(licensenum)
);
	
CREATE TABLE Vial (
	vialnum INTEGER NOT NULL,
	batchnum  INTEGER,
	manufacturer VARCHAR(50),
	sid INTEGER NOT NULL, -- KEY + Participation constraint
	PRIMARY KEY (vialnum),
	FOREIGN KEY (batchnum, manufacturer) REFERENCES Batches(batchnum, manufacturer),
	FOREIGN KEY (sid) REFERENCES Slots(sid),
	UNIQUE(sid) -- Enforce key constraint on Slots' side
);







