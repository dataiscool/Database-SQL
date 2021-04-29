-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.
INSERT INTO Vaccines (manufacturer,numdoses,waitperiod) VALUES ('Pfizer-BioNTech','2','3');
INSERT INTO Vaccines (manufacturer,numdoses,waitperiod) VALUES ('Moderna','2','1');
INSERT INTO Vaccines (manufacturer,numdoses,waitperiod) VALUES ('Sinovac','1','2');
INSERT INTO Vaccines (manufacturer,numdoses,waitperiod) VALUES ('Novavax','3','4');
INSERT INTO Vaccines (manufacturer,numdoses,waitperiod) VALUES ('Sinopharm','2','4');

INSERT INTO VacLocations (vname,city,postcode,street) VALUES ('Jewish General','Montreal','H3W2N4','Chemin De la Cote-Sainte-Catherine');
INSERT INTO VacLocations (vname,city,postcode,street) VALUES ('Childrens Hospital','Saint-Laurent','H3K2B5','Decarie Blvd');
INSERT INTO VacLocations (vname,city,postcode,street) VALUES ('Super Hospital','Montreal','L5J5U4','Decarie Blvd');
INSERT INTO VacLocations (vname,city,postcode,street) VALUES ('Pharmaprix','Brossard','J3H1K3','Boulevard Taschereau');
INSERT INTO VacLocations (vname,city,postcode,street) VALUES ('Jean-Coutu','Laval','H4K1B5','Boulevard de la Concorde');

INSERT INTO Batches (batchnum,manufacturer,manufdate,expdate,vname) VALUES ('1','Pfizer-BioNTech','2020-08-08','2021-04-01','Jewish General');
INSERT INTO Batches (batchnum,manufacturer,manufdate,expdate,vname) VALUES ('2','Sinovac','2020-07-07','2021-07-01','Super Hospital');
INSERT INTO Batches (batchnum,manufacturer,manufdate,expdate,vname) VALUES ('3','Novavax','2020-09-01','2021-02-02','Pharmaprix');
INSERT INTO Batches (batchnum,manufacturer,manufdate,expdate,vname) VALUES ('8','Pfizer-BioNTech','2021-01-30','2021-06-30','Jean-Coutu');
INSERT INTO Batches (batchnum,manufacturer,manufdate,expdate,vname) VALUES ('9','Moderna','2021-02-10','2021-03-10','Pharmaprix');

INSERT INTO Category (cname,prioritynum) VALUES ('Immunologically Compromised','1');
INSERT INTO Category (cname,prioritynum) VALUES ('Health Care Workers','1');
INSERT INTO Category (cname,prioritynum) VALUES ('Elderly','1');
INSERT INTO Category (cname,prioritynum) VALUES ('Children below 10','2');
INSERT INTO Category (cname,prioritynum) VALUES ('Physical promixity to priority 1','2');
INSERT INTO Category (cname,prioritynum) VALUES ('Teacher','2');
INSERT INTO Category (cname,prioritynum) VALUES ('Physical proximity to priority 2','3');
INSERT INTO Category (cname,prioritynum) VALUES ('Essential Service Workers','3');
INSERT INTO Category (cname,prioritynum) VALUES ('Everybody else','4');

INSERT INTO Employer (ename) VALUES ('Jewish General');
INSERT INTO Employer (ename) VALUES ('Super Hospital');
INSERT INTO Employer (ename) VALUES ('Childrens Hospital ');

INSERT INTO Nurses (licensenum,nname,ename) VALUES ('P318273','Julie O','Jewish General');
INSERT INTO Nurses (licensenum,nname,ename) VALUES ('P392503','Yejin B','Super Hospital');
INSERT INTO Nurses (licensenum,nname,ename) VALUES ('P382930','Derek P','Jewish General');
INSERT INTO Nurses (licensenum,nname,ename) VALUES ('P999888','John P','Super Hospital');
INSERT INTO Nurses (licensenum,nname,ename) VALUES ('P888777','Matthew P','Childrens Hospital');



INSERT INTO NurseAssignment (licensenum,vname,ndate) VALUES ('P318273','Pharmaprix','2021-02-20');
INSERT INTO NurseAssignment (licensenum,vname,ndate) VALUES ('P392503','Jean-Coutu','2021-04-01');
INSERT INTO NurseAssignment (licensenum,vname,ndate) VALUES ('P999888','Jewish General','2021-03-20');
INSERT INTO NurseAssignment (licensenum,vname,ndate) VALUES ('P999888','Jewish General','2021-03-26');
INSERT INTO NurseAssignment (licensenum,vname,ndate) VALUES ('P888777','Super Hospital','2021-05-22');
INSERT INTO NurseAssignment (licensenum,vname,ndate) VALUES ('P382930','Jewish General','2021-02-06');
INSERT INTO NurseAssignment (licensenum,vname,ndate) VALUES ('P382930','Jean-Coutu','2021-01-02');
INSERT INTO NurseAssignment (licensenum,vname,ndate) VALUES ('P392503','Jean-Coutu','2021-01-06');


INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P888999','2021-02-01','Albert C','514-878-3322','1996-03-03','Male','Montreal','H4K0T0','Workman','Teacher');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P555666','2021-02-03','Richard B','514-238-9944','1960-02-01','Male','Laval','H3L2U2','Durocher','Elderly');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P222111','2021-01-01','Peter G','438-555-8887','1950-03-03','Male','Brossard','H4I9S9','Taschereau','Elderly');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P220321','2021-01-23','Susan B','514-234-5949','1940-02-02','Female','Montreal','H28S8S','Atwater','Elderly');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P333222','2021-02-20','Julia Z','514-328-8888','1998-02-02','Female','Montreal','H3S3K3','Crescent','Essential Service Workers');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P345321','2021-01-01','Tom Bee','514-200-3021','1998-02-02','Male','Toronto','H8S2J2','Bay','Everybody else');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P453563','2021-01-01','Greg Yu','438-200-3921','1998-02-02','Male','Vancouver','H8S2J2','Queens','Teacher');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P123456','2021-02-01','Jane Doe','514-321-9993','1998-02-02','Female','Montreal','H4I2K2','Milton','Health Care Workers');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P897377','2021-01-10','Kanye West','291-023-2222','1998-02-02','Male','Calgary','H8S2J2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P897367','2021-01-10','Kanye West','291-023-2222','1998-02-02','Male','Calgary','H8S2J2','Forest','Physical proximity to priority 2');

INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('535','19:30','2021-04-01','Jean-Coutu','P888999','P392503','2021-02-20');
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('536','20:00','2021-04-01','Jean-Coutu','P555666','P392503','2021-02-20');
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('580','8:00','2021-05-22','Super Hospital','P220321','P888777','2021-02-21');
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('590','9:00','2021-03-20','Jewish General','P222111','P999888','2021-02-25');
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('598','12:00','2021-03-26','Jewish General','P222111','P999888','2021-03-01');
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('600','15:00','2021-03-20','Jewish General', NULL, NULL, NULL);
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('501','12:00','2021-02-06','Jewish General','P123456','P382930','2021-02-01');
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('555','12:00','2021-01-02','Jean-Coutu','P345321','P382930','2021-01-01');
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('324','9:00','2021-01-06','Jean-Coutu','P453563','P392503','2021-01-01');
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('899','10:00','2021-01-02','Jean-Coutu','P453563','P382930','2021-01-01');
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('900','11:00','2021-02-20','Pharmaprix','P897377','P318273','2021-01-20');

INSERT INTO Vial (vialnum,batchnum,manufacturer,sid) VALUES ('10','8','Pfizer-BioNTech','535');
INSERT INTO Vial (vialnum,batchnum,manufacturer,sid) VALUES ('11','8','Pfizer-BioNTech','536');
INSERT INTO Vial (vialnum,batchnum,manufacturer,sid) VALUES ('55','2','Sinovac','580');
INSERT INTO Vial (vialnum,batchnum,manufacturer,sid) VALUES ('66','1','Pfizer-BioNTech','590');
INSERT INTO Vial (vialnum,batchnum,manufacturer,sid) VALUES ('89','1','Pfizer-BioNTech','598');
INSERT INTO Vial (vialnum,batchnum,manufacturer,sid) VALUES ('88','1','Pfizer-BioNTech','501');
INSERT INTO Vial (vialnum,batchnum,manufacturer,sid) VALUES ('54','8','Pfizer-BioNTech','555');
INSERT INTO Vial (vialnum,batchnum,manufacturer,sid) VALUES ('65','8','Pfizer-BioNTech','324');
INSERT INTO Vial (vialnum,batchnum,manufacturer,sid) VALUES ('69','9','Moderna','900');
INSERT INTO Vial (vialnum,batchnum,manufacturer,sid) VALUES ('67','8','Pfizer-BioNTech','899');

INSERT INTO NurseAssignment (licensenum,vname,ndate) VALUES ('P392503','Jean-Coutu','2021-03-20');
INSERT INTO NurseAssignment (licensenum,vname,ndate) VALUES ('P318273','Jean-Coutu','2021-03-20');
INSERT INTO NurseAssignment (licensenum,vname,ndate) VALUES ('P382930','Jewish General','2021-03-20');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P888998','2021-02-01','Ally C','514-555-3322','1996-03-03','Female','Montreal','H4K0T0','Atwater','Teacher');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P999000','2021-02-01','Bill C','514-555-3322','1996-03-03','Male','Montreal','H4K0T0','Atwater','Teacher');

INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('902','11:00','2021-03-20','Jean-Coutu', NULL, NULL, NULL);
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('910','11:00','2021-03-13','Jean-Coutu', NULL, NULL, NULL);
INSERT INTO Batches (batchnum,manufacturer,manufdate,expdate,vname) VALUES ('10','Moderna','2021-02-10','2021-03-30','Jean-Coutu');
UPDATE Slots SET sdate = '2021-03-13', licensenum = NULL, hin = 'P453563' WHERE sid = 324;
DELETE FROM Vial WHERE vialnum = 888
UPDATE RegIndividuals SET phonenum = '514-555-5588' WHERE hin = 'P678876'
SELECT * FROM RegIndividuals WHERE hin = 'P678876'

// for b)
SELECT r.HIN, sid, licensenum FROM RegIndividuals r LEFT OUTER JOIN Slots s ON r.HIN = s.HIN WHERE r.HIN = 'P888998'
SELECT r.HIN, sid, licensenum FROM RegIndividuals r LEFT OUTER JOIN Slots s ON r.HIN = s.HIN WHERE r.HIN = 'P888998' UNION SELECT r.HIN, sid, licensenum FROM RegIndividuals r LEFT OUTER JOIN Slots s ON r.HIN = s.HIN WHERE r.HIN = 'P999000'

c)

SELECT manufacturer, numdoses FROM Vaccines WHERE manufacturer = 'Pfizer-BioNTech'
UPDATE Slots SET licensenum = NULL, hin = NULL where sid = 902
UPDATE Slots SET licensenum = NULL, hin = NULL, sdate = '2021-03-13' where sid = 902

SELECT COUNT (*) as count FROM Slots, Vial WHERE hin = 'P453563' AND sdate <= CURRENT DATE AND licensenum IS NOT NULL AND Vial.sid = Slots.sid;

SELECT hin, licensenum, vialnum, s.sid FROM Vial v, Slots s WHERE v.sid = s.sid AND hin = 'P678876'; 
UPDATE Slots SET licensenum = NULL, hin = NULL, assigndate = NULL where sid = 910
e)

SELECT COUNT(*) as count FROM Slots, Vial WHERE hin = 'P345321' AND sdate <= CURRENT DATE AND licensenum IS NOT NULL AND Vial.sid = Slots.sid
SELECT hin, manufacturer, vialnum FROM slots, vial where hin = 'P345321' AND sdate <= CURRENT DATE AND licensenum IS NOT NULL AND vial.sid = slots.sid
--Data Analytics section
-- need to update: vaccines at location (choose those with exp date < current date), nurseassignment at location on date, slots (jc, sh, jg only)
--add individuals first, add 43=> 10: 5 (3 already in), 11: 6, 12: 8, 13: 12, 14: 20
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P112233','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P223344','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P334455','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P445566','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P448855','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P887766','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P009988','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P998877','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P336644','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P22334','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P3344554','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P4455663','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P4488533','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P88776656','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P00998843','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P998877444','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P112233555','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P223344666','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P33445577','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P44556688','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P44885599','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P88776600','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P00998800','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P99887799','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P11223388','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P22334477','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P33445566','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P44556655','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P44885544','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P88776633','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P00998822','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P99887711','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P1122331111','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P2233442222','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P3344553333','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P4455664444','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P448855555','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P8877666666','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P0099887777','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P9988778888','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P3366449999','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P223348888','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P33445547777','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P44556636666','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P4488533555555','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P88776656444','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P00998843333','2021-01-10','Kanye Flat','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P998877444222','2021-01-10','Kanye Round','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 1');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P112233555111','2021-01-10','Kanye East','291-2222','1998-02-02','Male','Montreal','H8S4J4','Forest','Physical proximity to priority 2');
INSERT INTO RegIndividuals (HIN,rdate,iname,phonenum,datebirth,gender,city,postcode,street,cname) VALUES ('P223344666000','2021-01-10','Kanye North','291-023-2222','1996-02-02','Male','Calgary','H8S2F2','Forest','Physical proximity to priority 2');


INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('600','15:00','2021-03-13','Jewish General', NULL, NULL, NULL);
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('600','15:00','2021-03-13','Jewish General', NULL, NULL, NULL);
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('600','15:00','2021-03-13','Jewish General', NULL, NULL, NULL);
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('600','15:00','2021-03-13','Jewish General', NULL, NULL, NULL);
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('600','15:00','2021-03-13','Jewish General', NULL, NULL, NULL);
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('600','15:00','2021-03-13','Jewish General', NULL, NULL, NULL);
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('600','15:00','2021-03-20','Jewish General', NULL, NULL, NULL);
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('600','15:00','2021-03-20','Jewish General', NULL, NULL, NULL);
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('600','15:00','2021-03-20','Jewish General', NULL, NULL, NULL);
INSERT INTO Slots (sid,stime,sdate,vname,HIN,licensenum,assigndate) VALUES ('600','15:00','2021-03-20','Jewish General', NULL, NULL, NULL);